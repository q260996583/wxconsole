package youle.posp.console.lottery;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Filter.Comparison;
import com.jiuyv.common.util.DateUtil;
import com.jiuyv.yl.console.common.entity.SecCodeVo;
import com.jiuyv.yl.console.common.service.inter.ICommonService;
import com.jiuyv.yl.console.lottery.entity.LotteryInfoVo;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryResultOperService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:com/console/configs/spring/applicationContext.xml")
@TransactionConfiguration(defaultRollback=false,transactionManager="transactionManager")
public class LotteryResultOperServiceTest {
	@Autowired
	private ILotteryResultOperService lotteryResultOperService;
	@Autowired
	private ICommonService commonService;
	
	@Test
	public void test() throws Exception {
		List<Filter> filters = new ArrayList<Filter>();
		List<String> notifyList =  Arrays.asList("1","2","3","4");
		//2017-10-21 14:18:00
		String systime = DateUtil.getFormateDate("yyyyMMdd");
		filters.add(new Filter("systemTime",Filter.STRING, systime,Comparison.GT));//快10
		filters.add(new Filter("systemTime",Filter.STRING, systime+"235959",Comparison.LT));//快10
		filters.add(new Filter("status",Filter.STRING, "03",Comparison.NE));
		filters.add(new Filter("notifyStatus",Filter.LIST, notifyList,Comparison.IN));
		List<LotteryInfoVo> list = lotteryResultOperService.findLotteryInfo(filters);
		for(LotteryInfoVo vo : list) {
			System.out.println(vo.getLotteryId());
			vo.setLotteryResult("4444");
			//lotteryResultOperService.updatetLotteryInfo(vo);
			//lotteryResultOperService.insertLotteryInfo(vo);
		}
	}
	
    public LotteryInfoVo getDbLotteryInfo(String lotteryId) {
    	List<Filter> filters = new ArrayList<Filter>();
    	filters.add(new Filter("lotteryType",Filter.STRING, "10",Comparison.EQ));//快10
		filters.add(new Filter("lotteryId",Filter.STRING, lotteryId,Comparison.EQ));//正在开始的状态
		List<LotteryInfoVo> lotteryTemp = lotteryResultOperService.findLotteryInfo(filters);
		if(null != lotteryTemp && lotteryTemp.size() > 0) {
			return lotteryTemp.get(0);
		}
		return null;
    }
    
    @Test
    public void lotterValid() throws Exception {
    	List<LotteryInfoVo> list = lotteryResultOperService.selectValidOrder("03");
    	for(LotteryInfoVo vo : list) {
    		System.out.println(vo.getLotteryId());
    	}
    }
    @Test
    public void sysCodeTest() throws Exception {
    	List<SecCodeVo> list = commonService.findCodeByType("ROBOT_SWITCH");
    	for(SecCodeVo vo : list) {
    		System.out.println(vo.getCodeName());
    	}
    	SecCodeVo vo = new SecCodeVo();
    	vo.setCodeType("ROBOT_SWITCH");
    	vo.setCodeNo("switch");
    	vo.setCodeName("0");
    	commonService.updateCodeName(vo);
    }
}
