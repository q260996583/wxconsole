package com.jiuyv.common.ibatis.vo;

import java.io.Serializable;

// TODO: Auto-generated Javadoc
/**
 * 查询所带的分页信息。
 * The Class Page.
 */
public class Page implements Serializable {
	

    /** 开始. */
    private String start;

    /** 每页记录. */
    private String limit;

    /** 升序 降序. */
    private String dir;

    /** 排序域指定. */
    private String sort;

    /**
     * Instantiates a new page.
     */
    public Page() {
        super();
    }
    
    /**
     * Instantiates a new page.
     *
     * @param start the start
     * @param limit the limit
     * @param dir the dir
     * @param sort the sort
     */
    public Page(String start, String limit, String dir, String sort) {
        super();
        this.start = start;
        this.limit = limit;
        this.dir = dir;
        this.sort = sort;
    }

    /**
     * 获取Default ExcelPage
     * @return
     */
    public static Page ExcelPage() {
    	return new Page("0","excel",null,null);
    }
    
    /**
     * Gets the start.
     *
     * @return the start
     */
    public String getStart() {
        return start;
    }

    /**
     * Sets the start.
     *
     * @param start the new start
     */
    public void setStart(String start) {
        this.start = start;
    }

    /**
     * Gets the limit.
     *
     * @return the limit
     */
    public String getLimit() {
        return limit;
    }

    /**
     * Sets the limit.
     *
     * @param limit the new limit
     */
    public void setLimit(String limit) {
        this.limit = limit;
    }

    /**
     * Gets the dir.
     *
     * @return the dir
     */
    public String getDir() {
        return dir;
    }

    /**
     * Sets the dir.
     *
     * @param dir the new dir
     */
    public void setDir(String dir) {
        this.dir = dir;
    }

    /**
     * Gets the sort.
     *
     * @return the sort
     */
    public String getSort() {
        return sort;
    }

    /**
     * Sets the sort.
     *
     * @param sort the new sort
     */
    public void setSort(String sort) {
        this.sort = sort;
    }
}
