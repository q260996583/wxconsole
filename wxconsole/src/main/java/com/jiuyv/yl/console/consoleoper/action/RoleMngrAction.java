/*
 * Created by KY
 */
package com.jiuyv.yl.console.consoleoper.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.jiuyv.yl.console.consoleoper.entity.RoleVo;
import com.jiuyv.yl.console.consoleoper.service.inter.IRoleMngrService;
import com.jiuyv.yl.console.security.entity.IConstants;
import com.jiuyv.yl.console.security.entity.ResourceCache;
import com.jiuyv.yl.console.security.entity.RoleResVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.web.action.DefaultPageSupportAction;
import com.jiuyv.common.tree.CheckedTreeNode;
import com.jiuyv.common.tree.TreeFacotoryBean;

// TODO: Auto-generated Javadoc
/**
 * The Class ConsoleOperAction.
 */
public class RoleMngrAction extends DefaultPageSupportAction {

	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	  private ResourceCache resoucrecache;
	public ResourceCache getResoucrecache() {
		return resoucrecache;
	}

	public void setResoucrecache(ResourceCache resoucrecache) {
		this.resoucrecache = resoucrecache;
	}

	/** The service. */
	private IRoleMngrService service;

	public IRoleMngrService getService() {
		return service;
	}

	public void setService(IRoleMngrService service) {
		this.service = service;
	}

	/**
	 * Do insert oper.
	 * 
	 * @return the string
	 * @throws Exception
	 *             the exception
	 */
	public String doInsertRole() throws Exception {
		RoleVo vo = (RoleVo) getVaidateBean(RoleVo.class);
		String username = getUserInfo().getLoginNm();
		vo.setCreate_oprid(username);
		ExtData<RoleVo> data=service.doInsertRole(vo, this.genRoleResList(vo), this.getFilters());
		this.setResData(data);
		return SUCCESS;
	}

//	/**
//	 * Del oper.
//	 * 
//	 * @return the string
//	 * @throws Exception
//	 *             the exception
//	 */
	public String delRole() throws Exception {
		RoleVo rolevo=(RoleVo) getVaidateBean(RoleVo.class);        
        ExtData<RoleVo> data = service.doDeleteRole(rolevo,this.getFilters());
        setResData(data);      
		return SUCCESS;
	}
	
	
	
	public String checkRoleEdit()throws Exception{
		
		return SUCCESS;
	}

	/**
	 * Find oper.
	 * 
	 * @return the string
	 * @throws Exception
	 *             the exception
	 */
	public String findPageRole() throws Exception {
		ExtData<RoleVo> resdata = service.findUserRole(this.getOrgFilters("orgCode"),
				getPageInfo());
		this.setResData(resdata);
		return SUCCESS;
	}

	/**
	 * Do update oper.
	 * 
	 * @return the string
	 * @throws Exception
	 *             the exception
	 */
	public String doUpdateRole() throws Exception {
		RoleVo vo = (RoleVo) getVaidateBean(RoleVo.class);
		String username = getUserInfo().getLoginNm();
		vo.setLast_upd_oprid(username);
		ExtData<RoleVo> data=	service.doUpdateRole(vo, this.genRoleResList(vo), this.getFilters());
	    this.setResData(data);
		return SUCCESS;
	}

	
	  /**
     * 转换角色中对应的资源信息.
     * 
     * @param jsonObject the json object
     * 
     * @return the list< role res vo>
     */
    public List<RoleResVo> genRoleResList(RoleVo rolevo){
        List<RoleResVo> list = new ArrayList<RoleResVo>();
        String resource = rolevo.getResourcesStr();
        if(resource==null||resource.equals("")){
            return list;
        }
        String[] resourceList = resource.split(",");
        String roleId = rolevo.getRoleId();
        if(resourceList != null){
            for (int i = 0; i < resourceList.length; i++) {
                if(!IConstants.TREE_NODE.equals(resourceList[i])&&!"".equals(resourceList[i])){
                    RoleResVo vo = new RoleResVo();
                    vo.setRoleId(roleId);
                    vo.setResourceID(resourceList[i].toUpperCase());
                    list.add(vo);
                }
            }
        }
        return list;
    }
	
	
	private Map<String,Object> formateJsonTree(CheckedTreeNode node){
        Map<String,Object> attributes=new LinkedHashMap<String,Object>();         

        List<Map<String,Object>> childList=new ArrayList<Map<String,Object>>();
         if(node.getChildren()!=null&&node.getChildren().size()>0){
             for(CheckedTreeNode cnode :node.getChildren()){
                 childList.add(formateJsonTree(cnode));
             }                    
 }           
         Map<String,Object> nodeMap=new LinkedHashMap<String,Object>();
        
         if(IConstants.resoucetypebutton.equals(node.getShowType())){
        	 nodeMap.put("iclass", "button");
         }
         else  if(IConstants.resoucetypememu.equals(node.getShowType())){
        	 nodeMap.put("iclass", "menu");
         }         
         nodeMap.put("id", node.getId());
         nodeMap.put("check", node.isChecked());
         attributes.put("attributes", nodeMap);
         attributes.put("children",childList);
         Map<String,String> data=new  LinkedHashMap<String,String>();
         data.put("title", node.getText());		         
         attributes.put("data",data);
        return attributes;             
 
 }	
	
	
	
	   /**
     * 加载选择的树
     * 
     * @return the string
     * 
     * @throws Exception the exception
     */
    public String findResourceTreeWithChecked() throws Exception{
        
        RoleVo rolevo=(RoleVo) getVaidateBean(RoleVo.class);
        List<RoleResVo> treeList = service.findRecListByRole(rolevo);
        CheckedTreeNode rootnode=TreeFacotoryBean.fromResoucetree(resoucrecache, treeList,getUserDetailInfo().getAuthorities());
        Map<String,Object> map=formateJsonTree(rootnode);
        setResData(map.get("children")); 
        return SUCCESS;
    }
	
	
    public String findResourceTree() throws Exception{      
	      CheckedTreeNode rootnode=TreeFacotoryBean.fromResoucetree(resoucrecache, null,getUserDetailInfo().getAuthorities());    
         Map<String,Object> map=formateJsonTree(rootnode);		       
         setResData(map.get("children")); 
         return SUCCESS;
	        
	    }
	
    
    public static void main(String args[]){
    	Map a=new HashMap();
    	a.put("Class", "1234");
    	a.put("gclass", "1234");
    	System.out.println(JSONObject.fromObject(a).toString());
    }
    

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jiuyv.common.web.action.DefaultPageSupportAction#execute()
	 */
	@Override
	public String execute() throws Exception {
		return SUCCESS;
	}

	public String addPage() throws Exception {
		return SUCCESS;
	}

	public String modifyPage() throws Exception {
		return SUCCESS;
	}

	public String detailPage() throws Exception {
		return SUCCESS;
	}
}
