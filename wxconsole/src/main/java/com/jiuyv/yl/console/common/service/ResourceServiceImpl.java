package com.jiuyv.yl.console.common.service;

import java.util.List;
import java.util.Map;

import com.jiuyv.yl.console.common.dao.IResourceDao;
import com.jiuyv.yl.console.security.entity.Resource;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.tree.TreeNode;

// TODO: Auto-generated Javadoc
/**
 * The Class OrgServiceImpl.
 */
public class ResourceServiceImpl implements IResourceService{
	private IResourceDao dao;
	
	public IResourceDao getDao() {
		return dao;
	}

	public void setDao(IResourceDao dao) {
		this.dao = dao;
	}

	public ExtData<Resource> findResourceList(List<Filter> filters) throws Exception{
		
		return dao.findResourceList(filters);
	}

	@Override
	public List<TreeNode> findCompanyTree(String orgCode) throws Exception {
	return dao.findCompanyTree(orgCode);
	}

	
}
