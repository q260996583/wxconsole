package com.jiuyv.yl.console.common.service;

import java.util.List;

import com.jiuyv.yl.console.orgmngr.entity.MerchantSubVo;
import com.jiuyv.yl.console.common.dao.ISecDao;
import com.jiuyv.yl.console.common.entity.SecCodeVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

// TODO: Auto-generated Javadoc
/**
 * The Class OrgServiceImpl.
 */
public class SecServiceImpl implements ISecService {
	private ISecDao dao;

	public void setDao(ISecDao dao) {
		this.dao = dao;
	}

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
	public ExtData<SecCodeVo> findSecCodeList(List<Filter> filters)
			throws Exception {
		return dao.findSecCodeList(filters);
	}
	
	/**
	 * 系统中地区编码增加，需要支持分页功能
	 * @param filters
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public ExtData<SecCodeVo> findSecCodePageList(List<Filter> filters,Page page) throws Exception{
		return dao.findSecCodePageList(filters,page);
	}

	public ExtData<SecCodeVo> findSecCodeValue(List<Filter> tempFilters)
			throws Exception {
		return dao.findSecCodeVal(tempFilters);
	}

	public ExtData<SecCodeVo> findSecCodeList1(List<Filter> tempFilters)
			throws Exception {
		return dao.findSendList(tempFilters);
	}

	public ExtData<SecCodeVo> findOutTransSecCodeList(List<Filter> filters)
			throws Exception {
		ExtData<SecCodeVo> data = dao.selectOutTransSecCodeList(filters);
		return data;
	}

	@Override
	public ExtData<MerchantSubVo> findAllOutMid(List<Filter> tempFilters,
			Page page) throws Exception {
		// TODO Auto-generated method stub
		return dao.findAllOutMid(tempFilters, page);
	}
	
	/**
	 * 排序分页的系统代码检索
	 * @param filters
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public ExtData<SecCodeVo> findSecCodePage(List<Filter> filters, Page page) throws Exception {
		return dao.findSecCodePageList(filters, page);
	}
	

	
}
