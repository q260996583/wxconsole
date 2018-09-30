package com.jiuyv.yl.console.consoleoper.service.impl;

import java.util.List;
import java.util.Map;

import com.jiuyv.yl.console.consoleoper.dao.inter.IRoleMngrDao;
import com.jiuyv.yl.console.consoleoper.entity.RoleVo;
import com.jiuyv.yl.console.consoleoper.service.inter.IRoleMngrService;
import com.jiuyv.yl.console.security.entity.RoleResVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

public class RoleMngrServiceImpl implements IRoleMngrService {
	private IRoleMngrDao dao;

	public IRoleMngrDao getDao() {
		return dao;
	}

	public void setDao(IRoleMngrDao dao) {
		this.dao = dao;
	}
	
	
	@Override
    public ExtData<RoleVo> doUpdateRole(RoleVo roleVo,
            List<RoleResVo> list, List<Filter> Filters) throws Exception {
        if(roleVo == null){
            return null;
        }
        //先删除角色对应的资源
        dao.doDeleteRecByRole(roleVo);
        //批量新增角色对应的资源信息
        dao.doInsertRecListByRole(list);
        return dao.doUpdateRole(roleVo,Filters);
    }
	
	
	 @Override
     public ExtData<RoleVo> doInsertRole(RoleVo roleVo,
             List<RoleResVo> list, List<Filter> Filters) throws Exception {
         if(roleVo == null){
             return null;
         }
        
         ExtData<RoleVo> tempext=dao.doInsertRole(roleVo,Filters);
         //先删除角色对应的资源
         RoleVo tempVo=tempext.getRoot().get(0);
         String roleid=tempVo.getRoleId();        
         for (RoleResVo m:list){             
             m.setRoleId(roleid);
         }
         //批量新增角色对应的资源信息
         dao.doInsertRecListByRole(list);
         return tempext; 
     }
	
	

//	@Override
//	public void doInsertRole(RoleVo vo) throws Exception {
//		vo.setRoleId(dao.getSeq());
//		dao.doInsertRole(vo);
//	}
//
//	@Override
//	public void delRole(RoleVo vo) throws Exception {
//		dao.delRole(vo);
//	}
//
//	@Override
//	public ExtData<RoleVo> findPageRole(List<Filter> filters, Page page)
//			throws Exception {
//		return dao.findPageRole(filters, page);
//	}
//
//	@Override
//	public void doUpdateRole(RoleVo vo) throws Exception {
//		dao.doUpdateRole(vo);
//	}
//
//	@Override
//	public void doUpdateResources(RoleVo vo) throws Exception {
//		dao.doUpdateResources(vo);
//	}
//
//	@Override
//	public List<ResourceVo> findResources(RoleVo vo) throws Exception {
//		return dao.findResources(vo);
//	}
//
//	@Override
//	public List<ResourceVo> findHadResources(RoleVo vo) throws Exception {
//		return dao.findHadResources(vo);
//	}

	@Override
	public List<RoleResVo> findRecListByRole(RoleVo vo) throws Exception {
		return dao.findRecListByRole(vo);
	}

	@Override
	public ExtData<RoleVo> findUserRole(List<Filter> filters, Page page)
			throws Exception {
		return dao.findUserRole(filters, page);
	}

	@Override
	public ExtData<RoleVo> doDeleteRole(RoleVo roleVo, List<Filter> Filters)
			throws Exception {
		return dao.doDeleteRole(roleVo, Filters);
	}

	@Override
	public ExtData<Object> checkUserEdit(Map params) throws Exception {
		return dao.checkUserEdit(params);
	}

}
