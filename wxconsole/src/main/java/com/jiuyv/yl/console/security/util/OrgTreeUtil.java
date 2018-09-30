package com.jiuyv.yl.console.security.util;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.jiuyv.yl.console.security.entity.IConstants;
import com.jiuyv.yl.console.security.entity.SecOrgVo;

public class OrgTreeUtil {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(OrgTreeUtil.class);
	private SqlMapClient sqlmapclient=null;
	private String loadorgtreeid=null;
	public  List<String> findsuborglist(String Orgid){
		
		HashMap<String,SecOrgVo> orgmap=null;
		
		List<String> orglist= new ArrayList<String>();
		try {
			orgmap=(HashMap<String, SecOrgVo>) sqlmapclient.queryForMap(loadorgtreeid,null, "orgCode");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
		}
		//设置用户的子机构
		
		if (orgmap==null){
			return null;
		}
		if (orgmap.get(Orgid)==null){
			return null;
				
		}
		formOrgTree(orgmap);
		
		traveltree(orgmap,Orgid,orglist);
		
		return orglist;
		
		
	
	}
	
	private  void formOrgTree(HashMap<String,SecOrgVo> orgmap){
		if(orgmap.get(IConstants.ORG_ROOT)==null){
			SecOrgVo temproot=new SecOrgVo();
			temproot.setOrgCode(IConstants.ORG_ROOT);
			temproot.setFatherOrgCode(IConstants.ORG_ROOT);
			orgmap.put(IConstants.ORG_ROOT, temproot);
		}
		
		for (Map.Entry<String, SecOrgVo> m : orgmap.entrySet()) {
			SecOrgVo tempresource = m.getValue();
			if(!tempresource.getOrgCode().equals(IConstants.ORG_ROOT)){
				String fatherid=tempresource.getFatherOrgCode();
				SecOrgVo tempvo=orgmap.get(fatherid);
				if (tempvo!=null){
					
						tempvo.getChildren().add(tempresource);
					
					
				}
				
				
			}
			
		
		}
		
		
		
	}
	
	private  void traveltree(HashMap<String,SecOrgVo> orgmap,String Orgid,List<String> orglist){
		SecOrgVo temporg =orgmap.get(Orgid); 
		if(temporg!=null){
			orglist.add(Orgid);
		List<SecOrgVo> children=temporg.getChildren();
			for(SecOrgVo m:children){
				String childrenid=m.getOrgCode();
				traveltree(orgmap,childrenid,orglist);
			}
			
		}
		
	}

	public String getLoadorgtreeid() {
		return loadorgtreeid;
	}

	public void setLoadorgtreeid(String loadorgtreeid) {
		this.loadorgtreeid = loadorgtreeid;
	}

	public SqlMapClient getSqlmapclient() {
		return sqlmapclient;
	}

	public void setSqlmapclient(SqlMapClient sqlmapclient) {
		this.sqlmapclient = sqlmapclient;
	}
	
	
}
