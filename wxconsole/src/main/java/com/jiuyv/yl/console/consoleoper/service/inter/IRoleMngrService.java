package com.jiuyv.yl.console.consoleoper.service.inter;

import java.util.List;
import java.util.Map;

import com.jiuyv.yl.console.consoleoper.entity.RoleVo;
import com.jiuyv.yl.console.security.entity.RoleResVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

public interface IRoleMngrService {
//	public void doInsertRole(RoleVo vo) throws Exception;
//
//	public void delRole(RoleVo vo) throws Exception;
//
	public ExtData<RoleVo> findUserRole(List<Filter> filters, Page page)
		throws Exception;
//
//	//public void doUpdateRole(RoleVo vo) throws Exception;
//
//	//public void doUpdateResources(RoleVo vo) throws Exception;
//
//	public List<ResourceVo> findResources(RoleVo vo) throws Exception;

	//public List<ResourceVo> findHadResources(RoleVo vo) throws Exception;
	
	public ExtData<RoleVo> doUpdateRole(RoleVo roleVo,
            List<RoleResVo> list, List<Filter> Filters) throws Exception;
	public List<RoleResVo> findRecListByRole(RoleVo vo) throws Exception;
	 public ExtData<RoleVo> doDeleteRole(RoleVo roleVo,List<Filter> Filters) throws Exception;
	 public ExtData<Object> checkUserEdit(Map params) throws Exception;
	public ExtData<RoleVo> doInsertRole(RoleVo roleVo,List<RoleResVo> list,List<Filter> Filters) throws Exception;
}
