package com.jiuyv.yl.console.common.dao;

import java.util.List;
import java.util.Map;

import com.jiuyv.yl.console.orgmngr.entity.CoreMccRateVo;
import com.jiuyv.yl.console.orgmngr.entity.MerchantSubVo;
import com.jiuyv.yl.console.common.entity.SecCodeVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

// TODO: Auto-generated Javadoc
/**
 * 公共管理.
 */
public interface ISecDao {

	/**
	 * 查询系统参数
	 * 
	 * @param secCodeVo
	 *            the sec code vo
	 * 
	 * @return the ExtData< sec code vo>
	 * 
	 * @throws Exception
	 *             the exception
	 */
	ExtData<SecCodeVo> findSecCodeList(List<Filter> filters) throws Exception;
	
	/**
	 * 查询外部商户流水的交易类型列表
	 * 
	 * @param filters
	 *            the filters
	 * @return the ext data<SecCodeVo>
	 * @throws Exception
	 */
	ExtData<SecCodeVo> selectOutTransSecCodeList(List<Filter> filters) throws Exception;
	/**
	 * 系统中地区编码增加，需要支持分页功能
	 * @param filters
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public ExtData<SecCodeVo> findSecCodePageList(List<Filter> filters,Page page) throws Exception;

	ExtData<SecCodeVo> findSecCodeVal(List<Filter> tempFilters) throws Exception;

	ExtData<SecCodeVo> findSendList(List<Filter> tempFilters) throws Exception;

	/**
	 * 查询机构对应的外部商户号
	 * @param tempFilters
	 * @return
	 * @throws Exception
	 */
	ExtData<MerchantSubVo> findAllOutMid(List<Filter> tempFilters,Page page) throws Exception;

	/**
	 * 根据codeType查询参数信息
	 * @param codeType
	 * @return
	 * @throws Exception
	 */
	Map<String,String> findCodeByType(String codeType) throws Exception; 
	
    /**
	 * 查询全部MCC代码
	 * @return
	 */
	Map<String, String> findAllMccCode() ;
	
	/**
	 * 查询MCC费率信息
	 * @return
	 */
	List<CoreMccRateVo> findCoreMccRate();

	/**
	 * 分页查询MCC费率信息
	 * @param filters
	 * @param page
	 * @return
	 */
	ExtData<CoreMccRateVo> findCoreMccRatePage(List<Filter> filters, Page page);
	
}
