package com.jiuyv.yl.console.consoleoper.dao.impl;

import java.util.List;
import java.util.Map;

import com.jiuyv.yl.console.consoleoper.dao.inter.IRoleMngrDao;
import com.jiuyv.yl.console.consoleoper.entity.RoleVo;
import com.jiuyv.yl.console.publicdao.PublicModuleDao;
import com.jiuyv.yl.console.security.entity.RoleResVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

public class RoleMngrDaoImpl extends PublicModuleDao implements IRoleMngrDao {

	
	private static final String selectRecByRole="ROLEMNGR.select_rec_by_role";
	private static final String deleterecbyrole="ROLEMNGR.delete_rec_by_role";
	private static final String insertrecbyroleid="ROLEMNGR.insert_rec_by_role";
	private static final String updateroleid="ROLEMNGR.update_Role";
	private static final String insertRole="ROLEMNGR.insertRole";
	private static final String checkuserwithrole="ROLEMNGR.check_user_with_roleid";
	private static final String deleteroleid="ROLEMNGR.delete_role";	
	private static final String roleselectid="ROLEMNGR.selectPageRole";
	private static final String checkUserWithRoleIdUserId="ROLEMNGR.check_user_with_roleid_userid";
	
	
	public ExtData<Object> checkUserEdit(Map params) throws Exception{
		Object obj=getExtendClient().getSqlClient().queryForObject(checkUserWithRoleIdUserId,params);
		ExtData<Object> data=new ExtData<Object>();
		if(!obj.equals("0")){        	
        	data.setSuccess(false);
        	data.setSyserr("该角色属于用户角色无法删除");        	
        }
		else data.setSuccess(true);		
		return data;
	}
	
	
	
	
	public List<RoleResVo> findRecListByRole(RoleVo vo) throws Exception{
		
		return this.getExtendClient().getSqlClient().queryForList(selectRecByRole, vo);
		
	}

	@Override
	public ExtData<RoleVo> findUserRole(List<Filter> filters, Page page)
			throws Exception {
		return getExtendSqlMapClientTemplate().queryExtendForExtData(
				roleselectid, filters, page);
	}
	
	
	 public ExtData<RoleVo> doDeleteRole(RoleVo roleVo,List<Filter> Filters) throws Exception{
	    	
	    	Object obj=getExtendClient().getSqlClient().queryForObject(checkuserwithrole,roleVo);
	        if(!obj.equals("0")){
	        	ExtData<RoleVo> data=new ExtData<RoleVo>();
	        	data.setSuccess(false);
	        	data.setSyserr("该角色已分配给相关用户,无法删除");
	        	return data;
	        }	
	        getExtendSqlMapClientTemplate().delete(deleterecbyrole,roleVo);
	        return getExtendSqlMapClientTemplate().deleteSingleExtendForExtData(deleteroleid, roleVo, "roleId", roleselectid,Filters);
	    }

	

	@Override
	public ExtData<RoleVo> doInsertRole(RoleVo roleVo, List<Filter> Filters)
			throws Exception {
		return this.getExtendSqlMapClientTemplate().insertExtendForExtData(insertRole, roleVo, "roleId", roleselectid, Filters);
	}

	 /**
     * 删除角色对应的资源
     * 
     * @param roleVo the role vo
     * 
     * @throws Exception the exception
     */
    public void doDeleteRecByRole(RoleVo roleVo) throws Exception{
        if(roleVo == null){
            return;
        }    
        getExtendSqlMapClientTemplate().delete(deleterecbyrole,roleVo);
    }

	@Override
	public void doInsertRecListByRole(List<RoleResVo> list) throws Exception {
		 //批量插入角色对应的资源信息       
                this.getExtendClient().getSqlClient().startBatch();
                if(list != null){
                    for (int i = 0; i < list.size(); i++) {
                    	this.getExtendClient().getSqlClient().insert(insertrecbyroleid, list.get(i));
                    }
                }
                this.getExtendClient().getSqlClient().executeBatch();             
         
        
	}



	@Override
	public ExtData<RoleVo> doUpdateRole(RoleVo roleVo, List<Filter> Filters)
			throws Exception {
		 return getExtendSqlMapClientTemplate().updateSingleExtendForExtData(updateroleid, roleVo, "roleId", roleselectid,Filters);
	}

	
	
//	
//	@Override
//	public void doInsertRole(RoleVo vo) throws SQLException {
//		getExtendSqlMapClientTemplate().getSqlMapClient().insert(
//				"ROLEMNGR.insertRole", vo);
//	}
//
//	@Override
//	public void delRole(RoleVo vo) throws SQLException {
//		getExtendSqlMapClientTemplate().getSqlMapClient().insert(
//				"ROLEMNGR.delRole", vo);
//	}
//
//	@Override
//	public ExtData<RoleVo> findPageRole(List<Filter> filters, Page page)
//			throws SQLException {
//		return getExtendSqlMapClientTemplate().queryExtendForExtData(
//				"ROLEMNGR.selectPageRole", filters, page);
//	}
//
//	@Override
//	public void doUpdateRole(RoleVo vo) throws SQLException {
//		getExtendSqlMapClientTemplate().getSqlMapClient().update(
//				"ROLEMNGR.updateRole", vo);
//	}
//
//	@Override
//	public void doUpdateResources(RoleVo vo) throws SQLException {
//		SqlMapClient client = getExtendClient().getSqlClient();
//		String[] resourcesArr = vo.getResources();
//		String roleId = vo.getRoleId();
//		Map<String, String> para = new HashMap<String, String>();
//		para.put("roleId", roleId);
//
//		client.startBatch();
//		client.update("ROLEMNGR.delResources", para);
//		for (int i = 0; i < resourcesArr.length; i++) {
//			para.put("resource_id", resourcesArr[i]);
//			client.insert("ROLEMNGR.insertResources", para);
//		}
//		client.executeBatch();
//
//	}
//
//	@Override
//	public List<ResourceVo> findResources(RoleVo vo) throws SQLException {
//		return (List<ResourceVo>) getExtendClient().getSqlClient()
//				.queryForList("ROLEMNGR.selectResources", vo);
//	}
//
//	@Override
//	public List<ResourceVo> findHadResources(RoleVo vo) throws SQLException {
//		return (List<ResourceVo>) getExtendClient().getSqlClient()
//				.queryForList("ROLEMNGR.selectHadResources", vo);
//	}
//
//	@Override
//	public String getSeq() throws SQLException {
//		return (String) getExtendClient().getSqlClient().queryForObject(
//				"ROLEMNGR.selectSeq");
//	}

}
