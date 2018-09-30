package com.jiuyu.batchServer.bussiness.wxrobot.action;

import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.core.task.TaskExecutor;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.jiuyu.batchServer.bussiness.wxrobot.service.interfaces.ILotteryAnalysiser;
import com.jiuyv.common.exception.BaseException;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.web.action.DefaultPageSupportAction;
import com.jiuyv.yl.console.common.service.inter.ICommonService;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchant;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryResultOperService;
import com.jiuyv.yl.console.lottery.service.inter.TblLotteryMerchantService;

public class RobotManagerAction extends DefaultPageSupportAction {
	private static boolean lock = true;
	private static Map<String, ChatRobotAction> robots = new HashMap();
	private ICommonService commonService;
	private TblLotteryMerchantService tblLotteryMerchantService;
	private TaskExecutor taskExecutor;
	private Map<String, ILotteryAnalysiser> lotteryAnalysiserMap = new HashMap<String, ILotteryAnalysiser>();
	private static Map<String, String> lotteryRegMap = new HashMap<String, String>();
	private ILotteryResultOperService lotteryResultOperService;

	public ILotteryResultOperService getLotteryResultOperService() {
		return lotteryResultOperService;
	}

	public void setLotteryResultOperService(
			ILotteryResultOperService lotteryResultOperService) {
		this.lotteryResultOperService = lotteryResultOperService;
	}

	public static Map<String, ChatRobotAction> getRobots() {
		return robots;
	}

	static {
		lotteryRegMap.put("03","^(((((总[大小单双])|豹子)/[1-9][0-9]*)|([一二三]([大小单双]|[1-6])/[1-9][0-9]*))/?)+$");
		lotteryRegMap.put("10","^(((((总([大小单双]|(尾大)|(尾小)))|([龙虎]))/[1-9][0-9]*)|(([一二三四五])([大小单双]|([1-9]|1[0-9]|2[0-1])|(尾大)|(尾小))/[1-9][0-9]*))/?)+$");
	}
	public Map<String, ILotteryAnalysiser> getLotteryAnalysiserMap() {
		return lotteryAnalysiserMap;
	}

	public void setLotteryAnalysiserMap(
			Map<String, ILotteryAnalysiser> lotteryAnalysiserMap) {
		this.lotteryAnalysiserMap = lotteryAnalysiserMap;
	}

	public void  cleanUp(){
        System.out.println("cleanUp");  
    }
	
	public TaskExecutor getTaskExecutor() {
		return taskExecutor;
	}
	public void setTaskExecutor(TaskExecutor taskExecutor) {
		this.taskExecutor = taskExecutor;
	}
	public TblLotteryMerchantService getTblLotteryMerchantService() {
		return tblLotteryMerchantService;
	}
	public void setTblLotteryMerchantService(
			TblLotteryMerchantService tblLotteryMerchantService) {
		this.tblLotteryMerchantService = tblLotteryMerchantService;
	}
	
	public ICommonService getCommonService() {
		return commonService;
	}
	public void setCommonService(ICommonService commonService) {
		this.commonService = commonService;
	}
	public String queryRobot() {
		return this.SUCCESS;
	}
	public String createRobot() {
		//插入数据库
		return this.SUCCESS;
	}
	
	public String getLoginInfo() throws Exception {
		String lotteryType = reqParam("lotteryType");
		String oprId = this.getUserInfo().getOprId();
		String key = lotteryType +"_"+ oprId;
		ChatRobotAction robot = this.robots.get(key);
		String uuid = null;
		ExtData data = new ExtData();
		if(null == robot) {
			uuid = ChatRobotAction.getUUID();
			data.setStatus(0);
		} else {
			uuid = robot.getUuid();
			data.setStatus(1);
		}
		data.setSuccess(true);
		data.setSyserr(uuid);
		setResData(data);
		return this.SUCCESS;
	}
	
	public String runRobot() throws Exception {
		String uuid = reqParam("uuid");
		String lotteryType = reqParam("lotteryType");
		String oprId = this.getUserInfo().getOprId();
		String key = lotteryType + "_" + oprId;
		if(null == this.robots.get(key)) {
			byte[] imageBytte = ChatRobotAction.getLoginQrcode(uuid);
			HttpServletResponse response = getResponse();
			OutputStream os = response.getOutputStream();
			os.write(imageBytte);
			os.flush();
			os.close();
		} else {
			throw new BaseException("机器人运行中！");
		}
		return null;
	}
	/**
	 * 查询是否扫描登录
	 * @return
	 * @throws Exception
	 */
	public String executeRobot() {
		try {
			if(lock) {
				lock = false;
				ExtData data = new ExtData();
				String uuid = reqParam("uuid");
				String lotteryType = reqParam("lotteryType");
				if(null == uuid || null == lotteryType
						|| uuid.isEmpty() || lotteryType.isEmpty()) {
					throw new BaseException("缺少必填参数!");
				}
				String key = lotteryType +"_"+ this.getUserInfo().getOprId();
				if(null == robots.get(key)) {
					String retInfo = ChatRobotAction.qryIsStart(uuid);//位置变换
					if(null != retInfo && !retInfo.isEmpty()) {
						//this.switchRobot("1");//打开
						WebApplicationContext context = WebApplicationContextUtils  
								.getWebApplicationContext(ServletActionContext.getServletContext()); 
						ChatRobotAction action = (ChatRobotAction)context.getBean("chatRobotAction");
						action.setUuid(uuid);
						action.setOprId(this.getUserInfo().getOprId());
						action.setRobotSwitch(true);//打开机器人
						action.setLotteryType(lotteryType);
						action.setLotteryAnalysiser(lotteryAnalysiserMap.get(lotteryType));
						action.setLotterReg(lotteryRegMap.get(lotteryType));
						action.setManager(this);
						action.initRobot(retInfo);
						//启一个线程
						taskExecutor.execute(action);
						robots.put(key, action);
						data.setStatus(1);
						data.setSuccess(true);
					}
				}
				setResData(data);
				lock = true;
				return this.SUCCESS;
			}
		} catch (Exception e) {
			lock = true;
			String msg = e.getMessage();
			ExtData error = new ExtData();
			error.setSuccess(false);
			error.setSyserr(msg);
		}
		return this.ERROR;
	}
	
	public String destoryRobot() throws Exception {
		String lotteryType = reqParam("lotteryType");
		String opid = this.getUserInfo().getOprId();
		String key = lotteryType + "_" + opid;
		if(null != robots && !robots.isEmpty()) {
			ChatRobotAction derobot = robots.get(key);
			if(null != derobot) {
				derobot.destory();//关闭微信
				robots.remove(key);//关闭机器人
			}
		}
		//this.switchRobot("0");//关闭
		return this.SUCCESS;
	}
	
//	public void switchRobot(String s) {
//		SecCodeVo vo = new SecCodeVo();
//    	vo.setCodeType("ROBOT_SWITCH");
//    	vo.setCodeNo("switch");
//    	vo.setCodeName(s);
//    	commonService.updateCodeName(vo);//关闭
//	}
	
	public String queryLotterMerInfo() {
		return this.SUCCESS;
	}
	
    public String findLotterMerInfo() throws Exception {
        List<Filter> filters = this.getFilters();
        ExtData<TblLotteryMerchant> edate = tblLotteryMerchantService
        		.findOutQrcMerApply(filters, getPageInfo());
        //edate.setTotalProperty(10000);
        setResData(edate);
        return SUCCESS;
    }
    
    public String doUpdateLotterMerAmt() throws Exception {
    	TblLotteryMerchant vo = (TblLotteryMerchant) getVaidateBean(TblLotteryMerchant.class);
		List merList = tblLotteryMerchantService.selectByMer(vo);
		if(null != merList && !merList.isEmpty()) {
			TblLotteryMerchant merl = (TblLotteryMerchant) merList.get(0);
			//long amt = merl.getAmt()!=null?merl.getAmt():0L;
			long addAmt = vo.getAddAmt();
			merl.setAddAmt(addAmt);
			tblLotteryMerchantService.doUpdateMerAmt(merl);
		}
		return SUCCESS;
    }
    
    public static void main(String[] args) {
    	//lotteryRegMap.put("03","^((([大小单双豹]/[1-9][0-9]*)|([1-3]([大小单双]|[1-6])/[1-9][0-9]*))/?)+$");
		//lotteryRegMap.put("10","^(((([大小单双龙虎]|(尾大)|(尾小))/[1-9][0-9]*)|(([1-5])([大小单双]|([1-9]|1[0-9]|2[0-1])|(尾大)|(尾小))/[1-9][0-9]*))/?)+$");

    	String k10reg = "^(((((总([大小单双]|(尾大)|(尾小)))|([龙虎]))/[1-9][0-9]*)|(([一二三四五])([大小单双]|([1-9]|1[0-9]|2[0-1])|(尾大)|(尾小))/[1-9][0-9]*))/?)+$";
    	String k3reg = "^(((((总[大小单双])|豹子)/[1-9][0-9]*)|([一二三]([大小单双]|[1-6])/[1-9][0-9]*))/?)+$";
    	System.out.println("总子/30".matches(k10reg));
	}
    
    public String selectLotteryOrder() throws Exception {
    	 return SUCCESS;
    }
    public String selectLotteryOrderInfo() throws Exception {
    	List<Filter> filters = this.getFilters();
    	Map param = new HashMap();
    	for(Filter flt : filters) {
    		if("merid".equals(flt.getField())) {
    			param.put("merid", flt.getData().getValue().toString());
    		} else if("nickname".equals(flt.getField())){
    			param.put("nickname", flt.getData().getValue().toString());
    		} else if("lotteryType".equals(flt.getField())) {
    			param.put("lotteryType", flt.getData().getValue());
    		} else if("lotteryId".equals(flt.getField())) {
    			param.put("lotteryId", flt.getData().getValue());
    		}
    	}
    	ExtData<TblLotteryOrder> extDate = lotteryResultOperService
        			.selectLotteryOrder(param, getPageInfo());
        setResData(extDate);
        return SUCCESS;
    }
    
    public String dropLotteryMerchant() throws Exception {
    	TblLotteryMerchant vo = (TblLotteryMerchant) getVaidateBean(TblLotteryMerchant.class);
		tblLotteryMerchantService.doDropLotteryMerchant(vo.getMerid());
		ExtData date = new ExtData();
		date.setSuccess(true);
		setResData(date);
		return SUCCESS;
    }
}
