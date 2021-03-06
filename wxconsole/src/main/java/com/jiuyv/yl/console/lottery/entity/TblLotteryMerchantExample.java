package com.jiuyv.yl.console.lottery.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TblLotteryMerchantExample {

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	protected String orderByClause;
	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	protected List oredCriteria;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	public TblLotteryMerchantExample() {
		oredCriteria = new ArrayList();
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	protected TblLotteryMerchantExample(TblLotteryMerchantExample example) {
		this.orderByClause = example.orderByClause;
		this.oredCriteria = example.oredCriteria;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	public List getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	public void clear() {
		oredCriteria.clear();
	}

	/**
	 * This class was generated by Apache iBATIS ibator. This class corresponds to the database table tbl_lottery_merchant
	 * @ibatorgenerated  Sun Oct 22 22:51:41 CST 2017
	 */
	public static class Criteria {
		protected List criteriaWithoutValue;
		protected List criteriaWithSingleValue;
		protected List criteriaWithListValue;
		protected List criteriaWithBetweenValue;

		protected Criteria() {
			super();
			criteriaWithoutValue = new ArrayList();
			criteriaWithSingleValue = new ArrayList();
			criteriaWithListValue = new ArrayList();
			criteriaWithBetweenValue = new ArrayList();
		}

		public boolean isValid() {
			return criteriaWithoutValue.size() > 0
					|| criteriaWithSingleValue.size() > 0
					|| criteriaWithListValue.size() > 0
					|| criteriaWithBetweenValue.size() > 0;
		}

		public List getCriteriaWithoutValue() {
			return criteriaWithoutValue;
		}

		public List getCriteriaWithSingleValue() {
			return criteriaWithSingleValue;
		}

		public List getCriteriaWithListValue() {
			return criteriaWithListValue;
		}

		public List getCriteriaWithBetweenValue() {
			return criteriaWithBetweenValue;
		}

		protected void addCriterion(String condition) {
			if (condition == null) {
				throw new RuntimeException("Value for condition cannot be null");
			}
			criteriaWithoutValue.add(condition);
		}

		protected void addCriterion(String condition, Object value,
				String property) {
			if (value == null) {
				throw new RuntimeException("Value for " + property
						+ " cannot be null");
			}
			Map map = new HashMap();
			map.put("condition", condition);
			map.put("value", value);
			criteriaWithSingleValue.add(map);
		}

		protected void addCriterion(String condition, List values,
				String property) {
			if (values == null || values.size() == 0) {
				throw new RuntimeException("Value list for " + property
						+ " cannot be null or empty");
			}
			Map map = new HashMap();
			map.put("condition", condition);
			map.put("values", values);
			criteriaWithListValue.add(map);
		}

		protected void addCriterion(String condition, Object value1,
				Object value2, String property) {
			if (value1 == null || value2 == null) {
				throw new RuntimeException("Between values for " + property
						+ " cannot be null");
			}
			List list = new ArrayList();
			list.add(value1);
			list.add(value2);
			Map map = new HashMap();
			map.put("condition", condition);
			map.put("values", list);
			criteriaWithBetweenValue.add(map);
		}

		public Criteria andMeridIsNull() {
			addCriterion("MERID is null");
			return this;
		}

		public Criteria andMeridIsNotNull() {
			addCriterion("MERID is not null");
			return this;
		}

		public Criteria andMeridEqualTo(String value) {
			addCriterion("MERID =", value, "merid");
			return this;
		}

		public Criteria andMeridNotEqualTo(String value) {
			addCriterion("MERID <>", value, "merid");
			return this;
		}

		public Criteria andMeridGreaterThan(String value) {
			addCriterion("MERID >", value, "merid");
			return this;
		}

		public Criteria andMeridGreaterThanOrEqualTo(String value) {
			addCriterion("MERID >=", value, "merid");
			return this;
		}

		public Criteria andMeridLessThan(String value) {
			addCriterion("MERID <", value, "merid");
			return this;
		}

		public Criteria andMeridLessThanOrEqualTo(String value) {
			addCriterion("MERID <=", value, "merid");
			return this;
		}

		public Criteria andMeridLike(String value) {
			addCriterion("MERID like", value, "merid");
			return this;
		}

		public Criteria andMeridNotLike(String value) {
			addCriterion("MERID not like", value, "merid");
			return this;
		}

		public Criteria andMeridIn(List values) {
			addCriterion("MERID in", values, "merid");
			return this;
		}

		public Criteria andMeridNotIn(List values) {
			addCriterion("MERID not in", values, "merid");
			return this;
		}

		public Criteria andMeridBetween(String value1, String value2) {
			addCriterion("MERID between", value1, value2, "merid");
			return this;
		}

		public Criteria andMeridNotBetween(String value1, String value2) {
			addCriterion("MERID not between", value1, value2, "merid");
			return this;
		}

		public Criteria andMernameIsNull() {
			addCriterion("MERNAME is null");
			return this;
		}

		public Criteria andMernameIsNotNull() {
			addCriterion("MERNAME is not null");
			return this;
		}

		public Criteria andMernameEqualTo(String value) {
			addCriterion("MERNAME =", value, "mername");
			return this;
		}

		public Criteria andMernameNotEqualTo(String value) {
			addCriterion("MERNAME <>", value, "mername");
			return this;
		}

		public Criteria andMernameGreaterThan(String value) {
			addCriterion("MERNAME >", value, "mername");
			return this;
		}

		public Criteria andMernameGreaterThanOrEqualTo(String value) {
			addCriterion("MERNAME >=", value, "mername");
			return this;
		}

		public Criteria andMernameLessThan(String value) {
			addCriterion("MERNAME <", value, "mername");
			return this;
		}

		public Criteria andMernameLessThanOrEqualTo(String value) {
			addCriterion("MERNAME <=", value, "mername");
			return this;
		}

		public Criteria andMernameLike(String value) {
			addCriterion("MERNAME like", value, "mername");
			return this;
		}

		public Criteria andMernameNotLike(String value) {
			addCriterion("MERNAME not like", value, "mername");
			return this;
		}

		public Criteria andMernameIn(List values) {
			addCriterion("MERNAME in", values, "mername");
			return this;
		}

		public Criteria andMernameNotIn(List values) {
			addCriterion("MERNAME not in", values, "mername");
			return this;
		}

		public Criteria andMernameBetween(String value1, String value2) {
			addCriterion("MERNAME between", value1, value2, "mername");
			return this;
		}

		public Criteria andMernameNotBetween(String value1, String value2) {
			addCriterion("MERNAME not between", value1, value2, "mername");
			return this;
		}

		public Criteria andTelphoneIsNull() {
			addCriterion("TELPHONE is null");
			return this;
		}

		public Criteria andTelphoneIsNotNull() {
			addCriterion("TELPHONE is not null");
			return this;
		}

		public Criteria andTelphoneEqualTo(String value) {
			addCriterion("TELPHONE =", value, "telphone");
			return this;
		}

		public Criteria andTelphoneNotEqualTo(String value) {
			addCriterion("TELPHONE <>", value, "telphone");
			return this;
		}

		public Criteria andTelphoneGreaterThan(String value) {
			addCriterion("TELPHONE >", value, "telphone");
			return this;
		}

		public Criteria andTelphoneGreaterThanOrEqualTo(String value) {
			addCriterion("TELPHONE >=", value, "telphone");
			return this;
		}

		public Criteria andTelphoneLessThan(String value) {
			addCriterion("TELPHONE <", value, "telphone");
			return this;
		}

		public Criteria andTelphoneLessThanOrEqualTo(String value) {
			addCriterion("TELPHONE <=", value, "telphone");
			return this;
		}

		public Criteria andTelphoneLike(String value) {
			addCriterion("TELPHONE like", value, "telphone");
			return this;
		}

		public Criteria andTelphoneNotLike(String value) {
			addCriterion("TELPHONE not like", value, "telphone");
			return this;
		}

		public Criteria andTelphoneIn(List values) {
			addCriterion("TELPHONE in", values, "telphone");
			return this;
		}

		public Criteria andTelphoneNotIn(List values) {
			addCriterion("TELPHONE not in", values, "telphone");
			return this;
		}

		public Criteria andTelphoneBetween(String value1, String value2) {
			addCriterion("TELPHONE between", value1, value2, "telphone");
			return this;
		}

		public Criteria andTelphoneNotBetween(String value1, String value2) {
			addCriterion("TELPHONE not between", value1, value2, "telphone");
			return this;
		}

		public Criteria andStatusIsNull() {
			addCriterion("STATUS is null");
			return this;
		}

		public Criteria andStatusIsNotNull() {
			addCriterion("STATUS is not null");
			return this;
		}

		public Criteria andStatusEqualTo(String value) {
			addCriterion("STATUS =", value, "status");
			return this;
		}

		public Criteria andStatusNotEqualTo(String value) {
			addCriterion("STATUS <>", value, "status");
			return this;
		}

		public Criteria andStatusGreaterThan(String value) {
			addCriterion("STATUS >", value, "status");
			return this;
		}

		public Criteria andStatusGreaterThanOrEqualTo(String value) {
			addCriterion("STATUS >=", value, "status");
			return this;
		}

		public Criteria andStatusLessThan(String value) {
			addCriterion("STATUS <", value, "status");
			return this;
		}

		public Criteria andStatusLessThanOrEqualTo(String value) {
			addCriterion("STATUS <=", value, "status");
			return this;
		}

		public Criteria andStatusLike(String value) {
			addCriterion("STATUS like", value, "status");
			return this;
		}

		public Criteria andStatusNotLike(String value) {
			addCriterion("STATUS not like", value, "status");
			return this;
		}

		public Criteria andStatusIn(List values) {
			addCriterion("STATUS in", values, "status");
			return this;
		}

		public Criteria andStatusNotIn(List values) {
			addCriterion("STATUS not in", values, "status");
			return this;
		}

		public Criteria andStatusBetween(String value1, String value2) {
			addCriterion("STATUS between", value1, value2, "status");
			return this;
		}

		public Criteria andStatusNotBetween(String value1, String value2) {
			addCriterion("STATUS not between", value1, value2, "status");
			return this;
		}

		public Criteria andCreateDateIsNull() {
			addCriterion("CREATE_DATE is null");
			return this;
		}

		public Criteria andCreateDateIsNotNull() {
			addCriterion("CREATE_DATE is not null");
			return this;
		}

		public Criteria andCreateDateEqualTo(String value) {
			addCriterion("CREATE_DATE =", value, "createDate");
			return this;
		}

		public Criteria andCreateDateNotEqualTo(String value) {
			addCriterion("CREATE_DATE <>", value, "createDate");
			return this;
		}

		public Criteria andCreateDateGreaterThan(String value) {
			addCriterion("CREATE_DATE >", value, "createDate");
			return this;
		}

		public Criteria andCreateDateGreaterThanOrEqualTo(String value) {
			addCriterion("CREATE_DATE >=", value, "createDate");
			return this;
		}

		public Criteria andCreateDateLessThan(String value) {
			addCriterion("CREATE_DATE <", value, "createDate");
			return this;
		}

		public Criteria andCreateDateLessThanOrEqualTo(String value) {
			addCriterion("CREATE_DATE <=", value, "createDate");
			return this;
		}

		public Criteria andCreateDateLike(String value) {
			addCriterion("CREATE_DATE like", value, "createDate");
			return this;
		}

		public Criteria andCreateDateNotLike(String value) {
			addCriterion("CREATE_DATE not like", value, "createDate");
			return this;
		}

		public Criteria andCreateDateIn(List values) {
			addCriterion("CREATE_DATE in", values, "createDate");
			return this;
		}

		public Criteria andCreateDateNotIn(List values) {
			addCriterion("CREATE_DATE not in", values, "createDate");
			return this;
		}

		public Criteria andCreateDateBetween(String value1, String value2) {
			addCriterion("CREATE_DATE between", value1, value2, "createDate");
			return this;
		}

		public Criteria andCreateDateNotBetween(String value1, String value2) {
			addCriterion("CREATE_DATE not between", value1, value2,
					"createDate");
			return this;
		}

		public Criteria andCreateChlIsNull() {
			addCriterion("CREATE_CHL is null");
			return this;
		}

		public Criteria andCreateChlIsNotNull() {
			addCriterion("CREATE_CHL is not null");
			return this;
		}

		public Criteria andCreateChlEqualTo(String value) {
			addCriterion("CREATE_CHL =", value, "createChl");
			return this;
		}

		public Criteria andCreateChlNotEqualTo(String value) {
			addCriterion("CREATE_CHL <>", value, "createChl");
			return this;
		}

		public Criteria andCreateChlGreaterThan(String value) {
			addCriterion("CREATE_CHL >", value, "createChl");
			return this;
		}

		public Criteria andCreateChlGreaterThanOrEqualTo(String value) {
			addCriterion("CREATE_CHL >=", value, "createChl");
			return this;
		}

		public Criteria andCreateChlLessThan(String value) {
			addCriterion("CREATE_CHL <", value, "createChl");
			return this;
		}

		public Criteria andCreateChlLessThanOrEqualTo(String value) {
			addCriterion("CREATE_CHL <=", value, "createChl");
			return this;
		}

		public Criteria andCreateChlLike(String value) {
			addCriterion("CREATE_CHL like", value, "createChl");
			return this;
		}

		public Criteria andCreateChlNotLike(String value) {
			addCriterion("CREATE_CHL not like", value, "createChl");
			return this;
		}

		public Criteria andCreateChlIn(List values) {
			addCriterion("CREATE_CHL in", values, "createChl");
			return this;
		}

		public Criteria andCreateChlNotIn(List values) {
			addCriterion("CREATE_CHL not in", values, "createChl");
			return this;
		}

		public Criteria andCreateChlBetween(String value1, String value2) {
			addCriterion("CREATE_CHL between", value1, value2, "createChl");
			return this;
		}

		public Criteria andCreateChlNotBetween(String value1, String value2) {
			addCriterion("CREATE_CHL not between", value1, value2, "createChl");
			return this;
		}

		public Criteria andAmtIsNull() {
			addCriterion("AMT is null");
			return this;
		}

		public Criteria andAmtIsNotNull() {
			addCriterion("AMT is not null");
			return this;
		}

		public Criteria andAmtEqualTo(Long value) {
			addCriterion("AMT =", value, "amt");
			return this;
		}

		public Criteria andAmtNotEqualTo(Long value) {
			addCriterion("AMT <>", value, "amt");
			return this;
		}

		public Criteria andAmtGreaterThan(Long value) {
			addCriterion("AMT >", value, "amt");
			return this;
		}

		public Criteria andAmtGreaterThanOrEqualTo(Long value) {
			addCriterion("AMT >=", value, "amt");
			return this;
		}

		public Criteria andAmtLessThan(Long value) {
			addCriterion("AMT <", value, "amt");
			return this;
		}

		public Criteria andAmtLessThanOrEqualTo(Long value) {
			addCriterion("AMT <=", value, "amt");
			return this;
		}

		public Criteria andAmtIn(List values) {
			addCriterion("AMT in", values, "amt");
			return this;
		}

		public Criteria andAmtNotIn(List values) {
			addCriterion("AMT not in", values, "amt");
			return this;
		}

		public Criteria andAmtBetween(Long value1, Long value2) {
			addCriterion("AMT between", value1, value2, "amt");
			return this;
		}

		public Criteria andAmtNotBetween(Long value1, Long value2) {
			addCriterion("AMT not between", value1, value2, "amt");
			return this;
		}
	}
}