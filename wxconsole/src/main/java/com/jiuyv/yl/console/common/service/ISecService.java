package com.jiuyv.yl.console.common.service;

import java.util.List;

import com.jiuyv.yl.console.orgmngr.entity.MerchantSubVo;
import com.jiuyv.yl.console.common.entity.SecCodeVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

public interface ISecService {

	/**
	 * 查询系统参数
	 * 
	 * @param secCodeVo
	 *            the sec code vo
	 * 
	 * @return the list< sec code vo>
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
	ExtData<SecCodeVo> findOutTransSecCodeList(List<Filter> filters) throws Exception;
	/**
	 * 系统中地区编码增加，需要支持分页功能
	 * @param filters
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public ExtData<SecCodeVo> findSecCodePageList(List<Filter> filters,Page page) throws Exception;

	ExtData<SecCodeVo> findSecCodeValue(List<Filter> tempFilters)throws Exception;

	ExtData<SecCodeVo> findSecCodeList1(List<Filter> tempFilters)throws Exception;

	/**
	 * 排序分页的系统代码检索
	 * @param filters
	 * @param page
	 * @return
	 * @throws Exception
	 */
	ExtData<SecCodeVo> findSecCodePage(List<Filter> filters, Page page) throws Exception ;
	
	/**
	 * 查询机构对应的外部商户号
	 * @param tempFilters
	 * @return
	 * @throws Exception
	 */
	ExtData<MerchantSubVo> findAllOutMid(List<Filter> tempFilters,Page page) throws Exception;

	



}
