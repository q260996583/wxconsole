package com.jiuyv.common.tree;

import java.util.List;

import net.sf.json.JSONObject;

import com.jiuyv.common.web.interceptor.INotConvert;

// TODO: Auto-generated Javadoc
/**
 * The Class TreeNode.
 */
public class CheckedTreeNode implements INotConvert{
	
	
	private boolean checked;
	
	/** The id. */
	private String id ;
	
	/** The parent id. */
	private String parentId;
	
	/** The children. */
	private List<CheckedTreeNode> children;
	
	/** The text. */
	private String text;
	
	/** The node show name. */
	private String nodeShowName;
	
	/** The leaf. */
	private boolean leaf;
	
	/** The cls. */
	private String cls;
	
	/** The href. */
	private String href;
	
	
	private String showType;
	
//	private boolean checked;
	/** The ui provider. */
//	private String uiProvider = "col";
	
	public String getShowType() {
		return showType;
	}

	public void setShowType(String showType) {
		this.showType = showType;
	}

	/** The otherproperty. */
	private Object otherproperty;
	
	/** The icon cls. */
	private String iconCls;
	
	private String sort;
	/** 定义长度*/
	private static final int THELENGTH = 17;
	
	/**
	 * Gets the icon cls.
	 * 
	 * @return the icon cls
	 */
	public String getIconCls() {
		return iconCls;
	}
	
	/**
	 * Sets the icon cls.
	 * 
	 * @param iconCls the new icon cls
	 */
	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}
	
	/**
	 * Gets the id.
	 * 
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	
	/**
	 * Sets the id.
	 * 
	 * @param id the new id
	 */
	public void setId(String id) {
		this.id = id;
	}
	
	/**
	 * Gets the parent id.
	 * 
	 * @return the parent id
	 */
	public String getParentId() {
		return parentId;
	}
	
	/**
	 * Sets the parent id.
	 * 
	 * @param parentId the new parent id
	 */
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	
	
	/**
	 * Gets the children.
	 * 
	 * @return the children
	 */
	public List<CheckedTreeNode> getChildren() {
		return children;
	}
	
	/**
	 * Sets the children.
	 * 
	 * @param children the new children
	 */
	public void setChildren(List<CheckedTreeNode> children) {
		this.children = children;
	}
	
	/**
	 * Gets the text.
	 * 
	 * @return the text
	 */
	public String getText() {
		return text;
	}
	
	/**
	 * Sets the text.
	 * 
	 * @param text the new text
	 */
	public void setText(String text) {
		this.text = text;
	}
	
	/**
	 * Checks if is leaf.
	 * 
	 * @return true, if is leaf
	 */
	public boolean isLeaf() {
		return leaf;
	}
	
	/**
	 * Sets the leaf.
	 * 
	 * @param leaf the new leaf
	 */
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	
	/**
	 * Gets the cls.
	 * 
	 * @return the cls
	 */
	public String getCls() {
		return cls;
	}
	
	/**
	 * Sets the cls.
	 * 
	 * @param cls the new cls
	 */
	public void setCls(String cls) {
		this.cls = cls;
	}
	
	/**
	 * Gets the href.
	 * 
	 * @return the href
	 */
	public String getHref() {
		return href;
	}
	
	/**
	 * Sets the href.
	 * 
	 * @param href the new href
	 */
	public void setHref(String href) {
		this.href = href;
	}
	
	/**
	 * Gets the otherproperty.
	 * 
	 * @return the otherproperty
	 */
	public Object getOtherproperty() {
		return otherproperty;
	}
	
	/**
	 * Sets the otherproperty.
	 * 
	 * @param otherproperty the new otherproperty
	 */
	public void setOtherproperty(Object otherproperty) {
		this.otherproperty = otherproperty;
	}
	
	/**
	 * Gets the ui provider.
	 * 
	 * @return the ui provider
	 */
//	public String getUiProvider() {
//		return uiProvider;
//	}
//	
//	/**
//	 * Sets the ui provider.
//	 * 
//	 * @param uiProvider the new ui provider
//	 */
//	public void setUiProvider(String uiProvider) {
//		this.uiProvider = uiProvider;
//	}
	
	/**
	 * Gets the node show name.
	 * 
	 * @return the node show name
	 */
	public String getNodeShowName() {
		return nodeShowName;
	}
	
	/**
	 * Sets the node show name.
	 * 
	 * @param nodeShowName the new node show name
	 */
	public void setNodeShowName(String nodeShowName) {
		this.nodeShowName = nodeShowName;
	}
	
	/**
	 * 覆盖的toString方法.
	 * 
	 * @return 字符串
	 */
	public String toString() {
		String retStr = JSONObject.fromObject(this).toString();
		retStr = "["+retStr+"]";
		return retStr;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}
	
	
		public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	

}
