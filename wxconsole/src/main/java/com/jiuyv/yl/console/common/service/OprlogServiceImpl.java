package com.jiuyv.yl.console.common.service;

import java.util.List;

import com.jiuyv.yl.console.common.dao.IOprlogDao;
import com.jiuyv.yl.console.common.entity.OprlogVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

// TODO: Auto-generated Javadoc
/**
 * The Class OrgServiceImpl.
 */
public class OprlogServiceImpl implements IOprlogService{
	private IOprlogDao dao;

	public IOprlogDao getDao() {
		return dao;
	}

	public void setDao(IOprlogDao dao) {
		this.dao = dao;
	}

	public ExtData<OprlogVo> findOprlogList(List<Filter> filters, Page page) throws Exception {
		return dao.findOprlogList(filters, page);
	}
}
