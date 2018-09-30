package com.jiuyv.yl.console.common.service;

import java.util.List;

import com.jiuyv.yl.console.common.entity.OprlogVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

public interface IOprlogService {


	/**
	 * 查询日志
	 * @param filters
	 * @param page
	 * @return
	 * @throws Exception
	 */
	ExtData<OprlogVo> findOprlogList(List<Filter> filters, Page page) throws Exception;

}
