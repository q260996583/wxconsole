package com.jiuyv.yl.console.common.dao;

import java.util.List;
import java.util.Map;

import com.jiuyv.common.ibatis.ExtendSqlMapClientDaoSupport;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.tree.TreeNode;
import com.jiuyv.yl.console.security.entity.Resource;

public class ResourceDaoImpl extends ExtendSqlMapClientDaoSupport implements IResourceDao{
	//日志查找
	
	private static final String selectOprResource = "common.selec_opr_resource";
	private static final String selectcompanytree="common.companytree_select";
	
	public ExtData<Resource> findResourceList(List<Filter> filters)
			throws Exception {
		
		return getExtendSqlMapClientTemplate().queryExtendForExtDataALL(selectOprResource, filters);
	}


			@Override
			public List<TreeNode> findCompanyTree(String orgCode)
					throws Exception {
				return this.getExtendSqlMapClientTemplate().getSqlMapClient().queryForList(selectcompanytree, orgCode);
			}
		
}
