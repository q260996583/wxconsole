package com.jiuyv.common.ibatis;

import org.springframework.dao.support.DaoSupport;

public abstract class ExtendSqlMapClientDaoSupport extends DaoSupport {
	private ExtendSqlMapClientTemplate sqlMapClientTemplate = new ExtendSqlMapClientTemplate();

	private boolean externalTemplate = false;

	public final void setExtendSqlMapClientTemplate(ExtendSqlMapClientTemplate sqlMapClientTemplate) {
		if (sqlMapClientTemplate == null) {
			throw new IllegalArgumentException("Cannot set sqlMapClientTemplate to null");
		}
		this.sqlMapClientTemplate = sqlMapClientTemplate;
		this.externalTemplate = true;
	}

	/**
	 * Return the SqlMapClientTemplate for this DAO,
	 * pre-initialized with the SqlMapClient or set explicitly.
	 */
	public final ExtendSqlMapClientTemplate getExtendSqlMapClientTemplate() {
	  return sqlMapClientTemplate;
	}

	public final void setExtendClient(ExtendClient sqlMapClient) {
		this.sqlMapClientTemplate.setExtendclient(sqlMapClient);
	}

	/**
	 * Return the iBATIS Database Layer SqlMapClient that this template works with.
	 */
	public final ExtendClient getExtendClient() {
		return this.sqlMapClientTemplate.getExtendclient();
	}
	protected final void checkDaoConfig() {
		if (!this.externalTemplate) {
			this.sqlMapClientTemplate.afterPropertiesSet();
		}
	}


}
