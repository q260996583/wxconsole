package com.jiuyv.common.ibatis.vo;

public class Pager {
public static final String ASC = "asc";
    

    public static final String DESC = "desc";
    /** 开始. */
    private long pagestart;

    /** 结束 */
    private long pageend;

	/** 升序 降序. */
    private String dir;

    /** 排序域指定. */
    private String sort;
    
    private long pagesize;
    private String pageful="";
    
    public String getPageful() {
		return pageful;
	}

	public void setPageful(String pageful) {
		this.pageful = pageful;
	}

	public long getPagestart() {
		return pagestart;
	}

	public void setPagestart(long pagestart) {
		this.pagestart = pagestart;
	}

	public long getPageend() {
		return pageend;
	}

	public void setPageend(long pageend) {
		this.pageend = pageend;
	}

	public String getDir() {
		return dir;
	}

	public void setDir(String dir) {
		this.dir = dir;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public long getPagesize() {
		pagesize=this.pageend-this.pagestart;
		return pagesize;
	}

	public void setPagesize(long pagesize) {
		this.pagesize = pagesize;
	}


}
