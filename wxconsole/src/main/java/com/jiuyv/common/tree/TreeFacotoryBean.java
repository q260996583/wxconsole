package com.jiuyv.common.tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.security.GrantedAuthority;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.jiuyv.yl.console.notice.entity.NoticeUserVo;
import com.jiuyv.yl.console.orgmngr.entity.CoreMerChannelVo;
import com.jiuyv.yl.console.security.entity.IConstants;
import com.jiuyv.yl.console.security.entity.Resource;
import com.jiuyv.yl.console.security.entity.ResourceCache;
import com.jiuyv.yl.console.security.entity.RoleResVo;

public class TreeFacotoryBean implements FactoryBean, InitializingBean {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(TreeFacotoryBean.class);
	private SqlMapClient sqlmapclient = null;
	private String treestatementid = null;
	private static ResourceCache resourceCache = null;

	private void init() {
		LOGGER.info("###################################TreeFacotoryBean");
		if (resourceCache != null)
			return;
		try {
			List<Resource> resList = sqlmapclient.queryForList(treestatementid);
			Map<String, Resource> resMap = new LinkedHashMap<String, Resource>();
			for (Resource res : resList) {
				resMap.put(res.getResourceID(), res);
			}
			Map<String, Resource> actionMap = new LinkedHashMap<String, Resource>();
			resourceCache = new ResourceCache();
			Map<String, Resource> sourcesmapfinal = new LinkedHashMap<String, Resource>();
			Map<String, Resource> logresouces = new LinkedHashMap<String, Resource>();
			// 考虑url中,分割
			for (Map.Entry<String, Resource> m : resMap.entrySet()) {
				Resource tempRes = m.getValue();
				if ((tempRes.getResourceUrl().indexOf(".action") > -1)
						&& tempRes.getShowType().equals("0")) {
					actionMap.put(tempRes.getResourceUrl().substring(0,tempRes.getResourceUrl().indexOf(".action")), tempRes);
				}
				String tempurl = tempRes.getResourceUrl();
				if (tempurl != null && !tempurl.trim().equals("")) {
					String resourceid = tempRes.getResourceID();
					String[] tempurls = tempurl.split(",");
					for (int i = 0; i < tempurls.length; i++) {
						Resource finalRes = new Resource();
						finalRes.setResourceID(tempRes.getResourceID());
						finalRes.setFatherID(tempRes.getFatherID());
						finalRes.setResourceZh(tempRes.getResourceZh());
						finalRes.setResourceEn(tempRes.getResourceEn());
						finalRes.setSysCode(tempRes.getSysCode());
						finalRes.setResourceUrl(tempRes.getResourceUrl());
						finalRes.setOrderNum(tempRes.getOrderNum());
						finalRes.setLogFlag(tempRes.getLogFlag());
						finalRes.setShowType(tempRes.getShowType());
						finalRes.setRemarks(tempRes.getRemarks());
						finalRes.setResourceUrl(formateurl(tempurls[i]));
						sourcesmapfinal.put(resourceid, finalRes);
						if ( StringUtils.isNotBlank(finalRes.getResourceUrl())) {
							if ( logresouces.containsKey(finalRes.getResourceUrl())) {
								LOGGER.error("Duplicate URL " + finalRes.getResourceUrl() + " in " + finalRes.getResourceID());
							}
							logresouces.put(finalRes.getResourceUrl(), finalRes);
						}
					}
				}
			}

			resourceCache.setActionsource(actionMap);
			resourceCache.setResources(resMap);

			/*
			 * Map<String, Resource> logresouces = new LinkedHashMap<String, Resource>();
			for (Map.Entry<String, Resource> m : sourcesmapfinal.entrySet()) {
				Resource tempresource = m.getValue();
				String tempurl = tempresource.getResourceUrl();
				if (tempurl != null && !tempurl.trim().equals("")) {
					logresouces.put(tempurl, tempresource);
				}
			}*/
			resourceCache.setLogresource(logresouces);
		} catch (Exception e) {
			LOGGER.info("###################################TreeFacotoryBeanE" + e.getMessage());
			LOGGER.error("", e);
		}
	}

	private static void formChanneltree(Map<String, CheckedTreeNode> memutree) {
		for (Map.Entry<String, CheckedTreeNode> m : memutree.entrySet()) {
			if (!m.getKey().equals(IConstants.TREE_NODE)) {
				CheckedTreeNode tempnode = m.getValue();
				String fatherid = tempnode.getParentId();
				if (fatherid == null) {
					memutree.get("-2").getChildren().add(tempnode);
				} else {
					CheckedTreeNode fathernode = memutree.get(fatherid);
					if (fathernode != null) {
						fathernode.getChildren().add(tempnode);
						fathernode.setLeaf(false);
					}
				}
			}
		}
	}

	public static CheckedTreeNode fromNoticeUsertree(
			List<NoticeUserVo> channelList, List<String> channelCodeList) {
		Map<String, CheckedTreeNode> tempmap = new LinkedHashMap<String, CheckedTreeNode>();
		// Map<String, Resource> sourcemap = re.getResources();
		for (NoticeUserVo tempresouce : channelList) {
			// Resource tempresouce =
			// sourcemap.get(Authorities[i].getAuthority());
			if (tempresouce != null) {
				CheckedTreeNode temptreenode = new CheckedTreeNode();
				List<CheckedTreeNode> children = new ArrayList<CheckedTreeNode>();
				temptreenode.setId(tempresouce.getUserId());
				temptreenode.setLeaf(true);
				temptreenode.setParentId(tempresouce.getFatherCode());
				temptreenode.setNodeShowName(tempresouce.getUserName());
				temptreenode.setHref("");
				temptreenode.setText(tempresouce.getUserName());
				temptreenode.setSort("0");
				temptreenode.setChildren(children);
				temptreenode.setChecked(false);
				temptreenode.setCls(tempresouce.getType());
				tempmap.put(tempresouce.getUserId(), temptreenode);
			}
		}
		// 添加一个根结点为-1
		CheckedTreeNode temptreenode = new CheckedTreeNode();
		List<CheckedTreeNode> children = new ArrayList<CheckedTreeNode>();
		temptreenode.setId(IConstants.TREE_NODE);
		temptreenode.setNodeShowName("");
		temptreenode.setText("");
		temptreenode.setLeaf(true);
		temptreenode.setChildren(children);
		tempmap.put(IConstants.TREE_NODE, temptreenode);
		if (channelCodeList != null) {
			int selectedlength = channelCodeList.size();
			CheckedTreeNode tempnode = null;
			for (int i = 0; i < selectedlength; i++) {
				tempnode = tempmap.get(channelCodeList.get(i));
				if (tempnode != null) {
					tempnode.setChecked(true);
					/*
					 * while (tempnode!=null&&tempnode.getParentId() != null) {
					 * tempnode = tempmap.get(tempnode.getParentId()); if
					 * (tempnode != null) { tempnode.setChecked(true); } }
					 */
				}

			}
		}
		formcheckedtree(tempmap);
		return tempmap.get(IConstants.TREE_NODE);
	}
	
	public static CheckedTreeNode fromChanneltree(
			List<CoreMerChannelVo> channelList, List<String> channelCodeList) {
		Map<String, CheckedTreeNode> tempmap = new LinkedHashMap<String, CheckedTreeNode>();
		// Map<String, Resource> sourcemap = re.getResources();
		for (CoreMerChannelVo tempresouce : channelList) {
			// Resource tempresouce =
			// sourcemap.get(Authorities[i].getAuthority());
			if (tempresouce != null) {
				CheckedTreeNode temptreenode = new CheckedTreeNode();
				List<CheckedTreeNode> children = new ArrayList<CheckedTreeNode>();
				temptreenode.setId(tempresouce.getChannelCode());
				temptreenode.setLeaf(true);
				temptreenode.setParentId(tempresouce.getFatherId());
				temptreenode.setNodeShowName(tempresouce.getChannelName());
				temptreenode.setHref("");
				temptreenode.setText(tempresouce.getChannelName());
				temptreenode.setSort("0");
				temptreenode.setChildren(children);
				temptreenode.setChecked(false);
				tempmap.put(tempresouce.getChannelCode(), temptreenode);
			}
		}
		// 添加一个根结点为-1
		CheckedTreeNode temptreenode = new CheckedTreeNode();
		List<CheckedTreeNode> children = new ArrayList<CheckedTreeNode>();
		temptreenode.setId(IConstants.TREE_NODE);
		temptreenode.setNodeShowName("所有服务商");
		temptreenode.setText("所有服务商");
		temptreenode.setLeaf(true);
		temptreenode.setChildren(children);
		tempmap.put(IConstants.TREE_NODE, temptreenode);

		CheckedTreeNode rootnode = new CheckedTreeNode();
		List<CheckedTreeNode> childrens = new ArrayList<CheckedTreeNode>();
		rootnode.setId("-2");
		rootnode.setNodeShowName("所有服务商");
		rootnode.setText("所有服务商");
		rootnode.setLeaf(true);
		rootnode.setParentId(IConstants.TREE_NODE);
		rootnode.setChildren(childrens);
		tempmap.put("-2", rootnode);
		if (channelCodeList != null) {
			int selectedlength = channelCodeList.size();
			CheckedTreeNode tempnode = null;
			for (int i = 0; i < selectedlength; i++) {
				tempnode = tempmap.get(channelCodeList.get(i));
				if (tempnode != null) {
					tempnode.setChecked(true);
					/*
					 * while (tempnode!=null&&tempnode.getParentId() != null) {
					 * tempnode = tempmap.get(tempnode.getParentId()); if
					 * (tempnode != null) { tempnode.setChecked(true); } }
					 */
				}

			}
		}
		formChanneltree(tempmap);
		return tempmap.get(IConstants.TREE_NODE);
	}

	public static TreeNode fromtree(ResourceCache re,
			GrantedAuthority[] Authorities) {

		Map<String, TreeNode> tempmap = new LinkedHashMap<String, TreeNode>();
		Map<String, Resource> sourcemap = re.getResources();
		for (int i = 0; i < Authorities.length; i++) {

			Resource tempresouce = sourcemap.get(Authorities[i].getAuthority());
			if (tempresouce != null) {
				if (tempresouce.getShowType()
						.equals(IConstants.resoucetypememu)) {
					TreeNode temptreenode = new TreeNode();
					List<TreeNode> children = new ArrayList<TreeNode>();
					temptreenode.setId(tempresouce.getResourceID()
							.toLowerCase());
					temptreenode.setLeaf(true);
					temptreenode.setParentId(tempresouce.getFatherID()
							.toLowerCase());
					temptreenode.setNodeShowName(tempresouce.getResourceZh());
					temptreenode.setHref(formateurl(tempresouce
							.getResourceUrl()));
					temptreenode.setText(tempresouce.getResourceZh());
					temptreenode.setSort(tempresouce.getOrderNum());
					temptreenode.setChildren(children);
					tempmap.put(tempresouce.getResourceID().toLowerCase(),
							temptreenode);
				}
			}

		}

		// 添加一个根结点为-1
		TreeNode temptreenode = new TreeNode();
		List<TreeNode> children = new ArrayList<TreeNode>();
		temptreenode.setId(IConstants.TREE_NODE);
		temptreenode.setLeaf(true);
		temptreenode.setChildren(children);
		tempmap.put(IConstants.TREE_NODE, temptreenode);

		formtree(tempmap);

		return tempmap.get(IConstants.TREE_NODE);

	}

	public static CheckedTreeNode fromResoucetree(ResourceCache rea,
			List<RoleResVo> selectedRoleResVo, GrantedAuthority[] Authorities) {

		Map<String, Resource> sourcemap = rea.getResources();
		Map<String, CheckedTreeNode> tempmap2 = new LinkedHashMap<String, CheckedTreeNode>();
		// 根据用户本身的权限再进行限制
		if (Authorities != null) {
			for (int i = 0; i < Authorities.length; i++) {
				String tempresid = Authorities[i].getAuthority();
				Resource tempresource = sourcemap.get(tempresid);
				if (tempresource != null) {
					CheckedTreeNode temptreenode = new CheckedTreeNode();
					List<CheckedTreeNode> children = new ArrayList<CheckedTreeNode>();
					temptreenode.setId(tempresource.getResourceID()
							.toLowerCase());
					temptreenode.setLeaf(true);
					temptreenode.setParentId(tempresource.getFatherID()
							.toLowerCase());
					temptreenode.setShowType(tempresource.getShowType());
					temptreenode.setNodeShowName(tempresource.getResourceZh());
					temptreenode.setText(tempresource.getResourceZh());
					temptreenode.setSort(tempresource.getOrderNum());
					temptreenode.setChildren(children);
					temptreenode.setChecked(false);
					tempmap2.put(tempresid.toLowerCase(), temptreenode);
				}
			}

		}

		// else{
		// tempmap2=tempmap;
		// }
		// 添加一个根结点为-1
		CheckedTreeNode temptreenode = new CheckedTreeNode();
		List<CheckedTreeNode> children = new ArrayList<CheckedTreeNode>();
		temptreenode.setId(IConstants.TREE_NODE);
		temptreenode.setText(IConstants.TREE_NODETEXT);
		temptreenode.setLeaf(true);
		temptreenode.setParentId(null);
		temptreenode.setChildren(children);
		tempmap2.put(IConstants.TREE_NODE, temptreenode);

		if (selectedRoleResVo != null) {
			int selectedlength = selectedRoleResVo.size();
			CheckedTreeNode tempnode = null;
			for (int i = 0; i < selectedlength; i++) {
				tempnode = tempmap2.get(selectedRoleResVo.get(i)
						.getResourceID().toLowerCase());
				if (tempnode != null) {
					tempnode.setChecked(true);
					while (tempnode != null && tempnode.getParentId() != null) {
						tempnode = tempmap2.get(tempnode.getParentId());
						if (tempnode != null) {
							tempnode.setChecked(true);
						}
					}
				}

			}
		}

		formcheckedtree(tempmap2);
		return tempmap2.get(IConstants.TREE_NODE);
	}

	private static void formtree(Map<String, TreeNode> memutree) {

		for (Map.Entry<String, TreeNode> m : memutree.entrySet()) {
			if (!m.getKey().equals(IConstants.TREE_NODE)) {
				TreeNode tempnode = m.getValue();
				String fatherid = tempnode.getParentId();
				TreeNode fathernode = memutree.get(fatherid);
				if (fathernode != null) {
					fathernode.getChildren().add(tempnode);
					fathernode.setLeaf(false);
				}
			}
		}
	}

	static public TreeNode formatTree(List<TreeNode> nodeList, String rootId) {
		Map<String, TreeNode> nodeMap = new HashMap<String, TreeNode>();
		Iterator<TreeNode> it = nodeList.iterator();
		while (it.hasNext()) {
			TreeNode node = it.next();
			node.setLeaf(true);
			nodeMap.put(node.getId(), node);
		}
		for (Map.Entry<String, TreeNode> m : nodeMap.entrySet()) {
			TreeNode node = m.getValue();
			TreeNode pnode = nodeMap.get(node.getParentId());
			if (pnode != null) {
				if (pnode.getChildren() == null) {
					pnode.setChildren(new ArrayList<TreeNode>());
				}
				pnode.getChildren().add(node);
				pnode.setLeaf(false);
			}
		}
		return nodeMap.get(rootId);

	}

	private static void formcheckedtree(Map<String, CheckedTreeNode> memutree) {

		for (Map.Entry<String, CheckedTreeNode> m : memutree.entrySet()) {
			if (!m.getKey().equals(IConstants.TREE_NODE)) {
				CheckedTreeNode tempnode = m.getValue();
				String fatherid = tempnode.getParentId();
				CheckedTreeNode fathernode = memutree.get(fatherid);
				if (fathernode != null) {
					fathernode.getChildren().add(tempnode);
					fathernode.setLeaf(false);
				}
			}
		}
	}

	private static String formateurl(String url) {

		if (url != null && !url.equals("")) {
			if (url.charAt(0) == '/') {
				url = url.substring(1);
			}
			String[] urls = url.split(",");
			return urls[0];

		}
		return url;
	}

	public Object getObject() throws Exception {

		return this.resourceCache;
	}

	public Class getObjectType() {
		return (this.resourceCache != null ? this.resourceCache.getClass()
				: TreeNode.class);
	}

	public boolean isSingleton() {
		// TODO Auto-generated method stub
		return true;
	}

	public void afterPropertiesSet() throws Exception {
		init();

	}

	public SqlMapClient getSqlmapclient() {
		return sqlmapclient;
	}

	public void setSqlmapclient(SqlMapClient sqlmapclient) {
		this.sqlmapclient = sqlmapclient;
	}

	public String getTreestatementid() {
		return treestatementid;
	}

	public void setTreestatementid(String treestatementid) {
		this.treestatementid = treestatementid;
	}

	public static ResourceCache getResourceCache() {
		return resourceCache;
	}

	public static void setResourceCache(ResourceCache resourceCache) {
		TreeFacotoryBean.resourceCache = resourceCache;
	}

}
