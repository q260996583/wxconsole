package com.jiuyv.yl.console.common.dao;

import java.util.List;
import java.util.Map;

import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.tree.TreeNode;
import com.jiuyv.yl.console.security.entity.Resource;

public interface IResourceDao {

	ExtData<Resource> findResourceList(List<Filter> filters) throws Exception;

	 public List<TreeNode> findCompanyTree(String orgCode) throws Exception;

}
