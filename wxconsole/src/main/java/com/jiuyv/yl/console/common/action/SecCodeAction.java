package com.jiuyv.yl.console.common.action;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.apache.commons.lang3.StringUtils;

import com.jiuyv.yl.console.orgmngr.entity.MerchantSubVo;
import com.jiuyv.yl.console.common.entity.SecCodeVo;
import com.jiuyv.yl.console.common.service.ISecService;
import com.jiuyv.yl.console.security.entity.IConstants;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.ibatis.vo.Filter.Comparison;
import com.jiuyv.common.ibatis.vo.Filter.Data;
import com.jiuyv.common.web.action.DefaultPageSupportAction;

public class SecCodeAction extends DefaultPageSupportAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8885332232944578379L;
	
	private static final String AREACODE="AREA_CODE";      //系统配置中code_type类型

	/** The Service. */
	private ISecService service;

	/** 参数的过滤参数 **/
	private String codeType;

	/**
	 * 将codetype相同的全部查出
	 * 
	 * @return
	 * @throws Exception
	 */
	public String findSecCodeList() throws Exception {
		Filter tempFilter = new Filter();
		tempFilter.setField("codeType");
		Data tempdata = new Data();
		tempdata.setComparison(Comparison.EQ);
		tempdata.setValue(this.getCodeType());
		tempdata.setType(Filter.STRING);
		tempFilter.setData(tempdata);
		List<Filter> tempFilters = getFilters();
		tempFilters.add(tempFilter);
		ExtData<SecCodeVo> data = service.findSecCodeList(tempFilters);
		setResData(data);
		return SUCCESS;
	}
	
	
	/**
	 * 查询符合条件的 syscode 查询方法.
	 * 
	 * @return the string
	 * @throws Exception
	 *             the exception
	 */
	public String findCodeList() throws Exception {
		Page page = getExcelPageInfo();
		page.setSort("codeSort");
		page.setDir("DESC");
		// 此版本的CriteriaUtil处理string类型的LIST存在问题, 通过手工转换为List
		List<Filter> filters = getFilters();
		/*for ( Filter filter: filters ) {
			if ( filter!=null && filter.getData()!= null) {
				if ( StringUtils.equals(filter.getData().getType(),"list") ){
					String strValue = (String) filter.getData().getValue();
					filter.getData().setValue(Arrays.asList(strValue.split(",")));
				}
			}
		}*/
		setResData(service.findSecCodePage(filters, page));
		return SUCCESS;
	}
	
	/**
	 * 查询符合条件的 syscode 查询方法.
	 * 
	 * @return the string
	 * @throws Exception
	 *             the exception
	 */
	public String findCodePage() throws Exception {
		// 此版本的CriteriaUtil处理string类型的LIST存在问题, 通过手工转换为List
		List<Filter> filters = getFilters();
		setResData(service.findSecCodePage(filters, getPageInfo()));
		return SUCCESS;
	}
	
	/**
	 * 查询外部商户交易类型
	 * @return String
	 * @throws Exception
	 */
	public String findOutTransSecCodeList() throws Exception {
		List<Filter> filters = getFilters();
		ExtData<SecCodeVo> data = service.findOutTransSecCodeList(filters);
		setResData(data);
		return SUCCESS;
	}
	/**
	 * @按条件查询出系统中所在地区编码
	 * @return
	 * @throws Exception
	 */
	public String findAreaCodeList() throws Exception {
		List<Filter> tempFilters=this.getFilters();
		tempFilters.add(new Filter("codeType",Filter.STRING,AREACODE,Comparison.EQ));
		ExtData<SecCodeVo> data = service.findSecCodePageList(tempFilters,getPageInfo());
		setResData(data);
		return SUCCESS;
	}
	
	
	/**
	 * @按条件查询出查询机构对应的外部商户号
	 * @return
	 * @throws Exception
	 */
	public String findAllOutMid() throws Exception {
		List<Filter> tempFilters=this.getFilters();
		ExtData<MerchantSubVo> data = service.findAllOutMid(tempFilters,getPageInfo());
		setResData(data);
		return SUCCESS;
	}
	
	
	/**
	 * 将标示为1的全部查出
	 * 
	 * @return
	 * @throws Exception
	 */
	public String findSecCodeFlgList() throws Exception {
		Filter tempFilter = new Filter();
		tempFilter.setField("codeType");
		Data tempdata = new Data();
		tempdata.setComparison(Comparison.EQ);
		tempdata.setValue(this.getCodeType());
		tempdata.setType(Filter.STRING);
		tempFilter.setData(tempdata);
		List<Filter> tempFilters = getFilters();
		tempFilters.add(tempFilter);
		tempFilters.add(new Filter("codeFlag", Filter.STRING,
				IConstants.CODE_FLG1, Comparison.EQ));
		ExtData<SecCodeVo> data = service.findSecCodeList(tempFilters);
		setResData(data);
		return SUCCESS;
	}
	 public String findRankTypeInfo() throws Exception{
		 Filter tempFilter=new Filter();
		 tempFilter.setField("codeType");
		 Data tempData=new Data();
		 tempData.setComparison(Comparison.EQ);
		 tempData.setValue(this.getCodeType());
		 tempData.setType(Filter.STRING);
		 tempFilter.setData(tempData);
		 List<Filter> tempFilters=this.getFilters();
		 tempFilters.add(tempFilter);
		 ExtData<SecCodeVo> data=service.findSecCodeList(tempFilters);
		 this.setResData(data);
		 return SUCCESS;
	 }
	 
	 public String findRankTypeName()throws Exception{
		 Filter tempFilter=new Filter();
		 tempFilter.setField("codeType");
		 Data tempData=new Data();
		 tempData.setComparison(Comparison.EQ);
		 tempData.setValue(this.getCodeType());
		 tempData.setType(Filter.STRING);
		 tempFilter.setData(tempData);
		 List<Filter> tempFilters=this.getFilters();
		 tempFilters.add(tempFilter);
		 ExtData<SecCodeVo> data=service.findSecCodeValue(tempFilters);
		 this.setResData(data);
		 return SUCCESS;
		 
	 }
	 
	 public String findRankValueInfo()throws Exception{

		 Filter tempFilter=new Filter();
		 tempFilter.setField("codeType");
		 Data tempData=new Data();
		 tempData.setComparison(Comparison.EQ);
		 tempData.setValue(this.getCodeType());
		 tempData.setType(Filter.STRING);
		 tempFilter.setData(tempData);
		 List<Filter> tempFilters=this.getFilters();
		 tempFilters.add(tempFilter);
		 ExtData<SecCodeVo> data=service.findSecCodeList(tempFilters);
		 this.setResData(data);
		 return SUCCESS;
	 
	 }

	 public String findTimeLevelInfo()throws Exception {

		 Filter tempFilter=new Filter();
		 tempFilter.setField("codeType");
		 Data tempData=new Data();
		 tempData.setComparison(Comparison.EQ);
		 tempData.setType(Filter.STRING);
		 tempData.setValue(this.getCodeType());
		 tempFilter.setData(tempData);
		 List<Filter> tempFilters=this.getFilters();
		 tempFilters.add(tempFilter);
		 ExtData<SecCodeVo> data=service.findSecCodeList(tempFilters);
		 this.setResData(data);
		 return SUCCESS;
	 }
	 public String findPosStatus()throws Exception{
		 Filter tempFilter=new Filter();
		 tempFilter.setField("codeType");
		 Data tempData=new Data();
		 tempData.setComparison(Comparison.EQ);
		 tempData.setValue(this.getCodeType());
		 tempData.setType(Filter.STRING);
		 tempFilter.setData(tempData);
		 List<Filter> tempFilters=this.getFilters();
		 tempFilters.add(tempFilter);
		 ExtData<SecCodeVo> data=service.findSecCodeList1(tempFilters);
		 this.setResData(data);
		 return SUCCESS;
	
	 }
	 
	 public String findBatchStatus()throws Exception{
		 Filter tempFilter=new Filter();
		 tempFilter.setField("codeType");
		 Data tempData=new Data();
		 tempData.setComparison(Comparison.EQ);
		 tempData.setValue(this.getCodeType());
		 tempData.setType(Filter.STRING);
		 tempFilter.setData(tempData);
		 List<Filter> tempFilters=this.getFilters();
		 tempFilters.add(tempFilter);
		 ExtData<SecCodeVo> data=service.findSecCodeList(tempFilters);
		 this.setResData(data);
		 return SUCCESS; 
		 
	 }
	 
	 public String findcardTypeInfo()throws Exception{
		 Filter tempFilter=new Filter();
		 tempFilter.setField("codeType");
		 Data tempData=new Data();
		 tempData.setComparison(Comparison.EQ);
		 tempData.setValue(this.getCodeType());
		 tempData.setType(Filter.STRING);
		 tempFilter.setData(tempData);
		 List<Filter> tempFilters=this.getFilters();
		 tempFilters.add(tempFilter);
		 ExtData<SecCodeVo> data=service.findSecCodeList(tempFilters);
		 this.setResData(data);
		 return SUCCESS; 
				 
	 }
	 
	 public String findStatusAcct()throws Exception{
		 Filter tempFilter=new Filter();
		 tempFilter.setField("codeType");
		 Data tempData=new Data();
		 tempData.setComparison(Comparison.EQ);
		 tempData.setValue(this.getCodeType());
		 tempData.setType(Filter.STRING);
		 tempFilter.setData(tempData);
		 List<Filter> tempFilters=this.getFilters();
		 tempFilters.add(tempFilter);
		 ExtData<SecCodeVo> data=service.findSecCodeList(tempFilters);
		 this.setResData(data);
		 return SUCCESS;
		 
	 }
	 
	 public String findScoreSecCodeList() throws Exception {
			Filter tempFilter = new Filter();
			tempFilter.setField("codeType");
			Data tempdata = new Data();
			tempdata.setComparison(Comparison.EQ);
			tempdata.setValue(this.getCodeType());
			tempdata.setType(Filter.STRING);
			tempFilter.setData(tempdata);
			List<Filter> tempFilters = getFilters();
			tempFilters.add(tempFilter);
			
			
			Filter tempFilter2 = new Filter();
			tempFilter2.setField("codeNo");
			Data tempdata2 = new Data();
			tempdata2.setComparison(Comparison.NE);
			tempdata2.setValue("03");//不包含无线（无SIM卡）的终端类型
			tempdata2.setType(Filter.STRING);
			tempFilter2.setData(tempdata2);
			tempFilters.add(tempFilter2);
			ExtData<SecCodeVo> data = service.findSecCodeList(tempFilters);
			setResData(data);
			return SUCCESS;
		}
	 
	
	public ISecService getService(){
		
		
		return service;
	}

	public void setService(ISecService service) {
		this.service = service;
	}

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

}
