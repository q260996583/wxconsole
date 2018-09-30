package com.jiuyv.common.ibatis.vo;

import java.util.List;

public class IbatisCeteria {
	
	private Pager pager = null;
	
	private Criteria Criteria = null;
	
	private List<Sort> sorts = null;

	public IbatisCeteria() {

	}

	public Pager getPager() {
		return pager;
	}

	public void setPager(Pager pager) {
		this.pager = pager;
	}

	public Criteria getCriteria() {
		return Criteria;
	}

	public void setCriteria(Criteria criteria) {
		Criteria = criteria;
	}

	/**
	 * @return the sorts
	 */
	public List<Sort> getSorts() {
		return sorts;
	}

	/**
	 * @param sorts the sorts to set
	 */
	public void setSorts(List<Sort> sorts) {
		this.sorts = sorts;
	}

}
