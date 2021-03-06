package com.jiuyv.yl.console.lottery.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TblLotteryOrderExample {

	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
	 */
	protected String orderByClause;
	/**
	 * This field was generated by Apache iBATIS ibator. This field corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
	 */
	protected List oredCriteria;

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
	 */
	public TblLotteryOrderExample() {
		oredCriteria = new ArrayList();
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
	 */
	protected TblLotteryOrderExample(TblLotteryOrderExample example) {
		this.orderByClause = example.orderByClause;
		this.oredCriteria = example.oredCriteria;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
	 */
	public void setOrderByClause(String orderByClause) {
		this.orderByClause = orderByClause;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
	 */
	public String getOrderByClause() {
		return orderByClause;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
	 */
	public List getOredCriteria() {
		return oredCriteria;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
	 */
	public void or(Criteria criteria) {
		oredCriteria.add(criteria);
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
	 */
	public Criteria createCriteria() {
		Criteria criteria = createCriteriaInternal();
		if (oredCriteria.size() == 0) {
			oredCriteria.add(criteria);
		}
		return criteria;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
	 */
	protected Criteria createCriteriaInternal() {
		Criteria criteria = new Criteria();
		return criteria;
	}

	/**
	 * This method was generated by Apache iBATIS ibator. This method corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
	 */
	public void clear() {
		oredCriteria.clear();
	}

	/**
	 * This class was generated by Apache iBATIS ibator. This class corresponds to the database table tbl_lottery_order
	 * @ibatorgenerated  Sat Oct 21 21:51:34 CST 2017
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

		public Criteria andIdIsNull() {
			addCriterion("ID is null");
			return this;
		}

		public Criteria andIdIsNotNull() {
			addCriterion("ID is not null");
			return this;
		}

		public Criteria andIdEqualTo(Integer value) {
			addCriterion("ID =", value, "id");
			return this;
		}

		public Criteria andIdNotEqualTo(Integer value) {
			addCriterion("ID <>", value, "id");
			return this;
		}

		public Criteria andIdGreaterThan(Integer value) {
			addCriterion("ID >", value, "id");
			return this;
		}

		public Criteria andIdGreaterThanOrEqualTo(Integer value) {
			addCriterion("ID >=", value, "id");
			return this;
		}

		public Criteria andIdLessThan(Integer value) {
			addCriterion("ID <", value, "id");
			return this;
		}

		public Criteria andIdLessThanOrEqualTo(Integer value) {
			addCriterion("ID <=", value, "id");
			return this;
		}

		public Criteria andIdIn(List values) {
			addCriterion("ID in", values, "id");
			return this;
		}

		public Criteria andIdNotIn(List values) {
			addCriterion("ID not in", values, "id");
			return this;
		}

		public Criteria andIdBetween(Integer value1, Integer value2) {
			addCriterion("ID between", value1, value2, "id");
			return this;
		}

		public Criteria andIdNotBetween(Integer value1, Integer value2) {
			addCriterion("ID not between", value1, value2, "id");
			return this;
		}

		public Criteria andLotteryIdIsNull() {
			addCriterion("LOTTERY_ID is null");
			return this;
		}

		public Criteria andLotteryIdIsNotNull() {
			addCriterion("LOTTERY_ID is not null");
			return this;
		}

		public Criteria andLotteryIdEqualTo(String value) {
			addCriterion("LOTTERY_ID =", value, "lotteryId");
			return this;
		}

		public Criteria andLotteryIdNotEqualTo(String value) {
			addCriterion("LOTTERY_ID <>", value, "lotteryId");
			return this;
		}

		public Criteria andLotteryIdGreaterThan(String value) {
			addCriterion("LOTTERY_ID >", value, "lotteryId");
			return this;
		}

		public Criteria andLotteryIdGreaterThanOrEqualTo(String value) {
			addCriterion("LOTTERY_ID >=", value, "lotteryId");
			return this;
		}

		public Criteria andLotteryIdLessThan(String value) {
			addCriterion("LOTTERY_ID <", value, "lotteryId");
			return this;
		}

		public Criteria andLotteryIdLessThanOrEqualTo(String value) {
			addCriterion("LOTTERY_ID <=", value, "lotteryId");
			return this;
		}

		public Criteria andLotteryIdLike(String value) {
			addCriterion("LOTTERY_ID like", value, "lotteryId");
			return this;
		}

		public Criteria andLotteryIdNotLike(String value) {
			addCriterion("LOTTERY_ID not like", value, "lotteryId");
			return this;
		}

		public Criteria andLotteryIdIn(List values) {
			addCriterion("LOTTERY_ID in", values, "lotteryId");
			return this;
		}

		public Criteria andLotteryIdNotIn(List values) {
			addCriterion("LOTTERY_ID not in", values, "lotteryId");
			return this;
		}

		public Criteria andLotteryIdBetween(String value1, String value2) {
			addCriterion("LOTTERY_ID between", value1, value2, "lotteryId");
			return this;
		}

		public Criteria andLotteryIdNotBetween(String value1, String value2) {
			addCriterion("LOTTERY_ID not between", value1, value2, "lotteryId");
			return this;
		}

		public Criteria andLotteryTypeIsNull() {
			addCriterion("LOTTERY_TYPE is null");
			return this;
		}

		public Criteria andLotteryTypeIsNotNull() {
			addCriterion("LOTTERY_TYPE is not null");
			return this;
		}

		public Criteria andLotteryTypeEqualTo(String value) {
			addCriterion("LOTTERY_TYPE =", value, "lotteryType");
			return this;
		}

		public Criteria andLotteryTypeNotEqualTo(String value) {
			addCriterion("LOTTERY_TYPE <>", value, "lotteryType");
			return this;
		}

		public Criteria andLotteryTypeGreaterThan(String value) {
			addCriterion("LOTTERY_TYPE >", value, "lotteryType");
			return this;
		}

		public Criteria andLotteryTypeGreaterThanOrEqualTo(String value) {
			addCriterion("LOTTERY_TYPE >=", value, "lotteryType");
			return this;
		}

		public Criteria andLotteryTypeLessThan(String value) {
			addCriterion("LOTTERY_TYPE <", value, "lotteryType");
			return this;
		}

		public Criteria andLotteryTypeLessThanOrEqualTo(String value) {
			addCriterion("LOTTERY_TYPE <=", value, "lotteryType");
			return this;
		}

		public Criteria andLotteryTypeLike(String value) {
			addCriterion("LOTTERY_TYPE like", value, "lotteryType");
			return this;
		}

		public Criteria andLotteryTypeNotLike(String value) {
			addCriterion("LOTTERY_TYPE not like", value, "lotteryType");
			return this;
		}

		public Criteria andLotteryTypeIn(List values) {
			addCriterion("LOTTERY_TYPE in", values, "lotteryType");
			return this;
		}

		public Criteria andLotteryTypeNotIn(List values) {
			addCriterion("LOTTERY_TYPE not in", values, "lotteryType");
			return this;
		}

		public Criteria andLotteryTypeBetween(String value1, String value2) {
			addCriterion("LOTTERY_TYPE between", value1, value2, "lotteryType");
			return this;
		}

		public Criteria andLotteryTypeNotBetween(String value1, String value2) {
			addCriterion("LOTTERY_TYPE not between", value1, value2,
					"lotteryType");
			return this;
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

		public Criteria andSystemTimeIsNull() {
			addCriterion("SYSTEM_TIME is null");
			return this;
		}

		public Criteria andSystemTimeIsNotNull() {
			addCriterion("SYSTEM_TIME is not null");
			return this;
		}

		public Criteria andSystemTimeEqualTo(String value) {
			addCriterion("SYSTEM_TIME =", value, "systemTime");
			return this;
		}

		public Criteria andSystemTimeNotEqualTo(String value) {
			addCriterion("SYSTEM_TIME <>", value, "systemTime");
			return this;
		}

		public Criteria andSystemTimeGreaterThan(String value) {
			addCriterion("SYSTEM_TIME >", value, "systemTime");
			return this;
		}

		public Criteria andSystemTimeGreaterThanOrEqualTo(String value) {
			addCriterion("SYSTEM_TIME >=", value, "systemTime");
			return this;
		}

		public Criteria andSystemTimeLessThan(String value) {
			addCriterion("SYSTEM_TIME <", value, "systemTime");
			return this;
		}

		public Criteria andSystemTimeLessThanOrEqualTo(String value) {
			addCriterion("SYSTEM_TIME <=", value, "systemTime");
			return this;
		}

		public Criteria andSystemTimeLike(String value) {
			addCriterion("SYSTEM_TIME like", value, "systemTime");
			return this;
		}

		public Criteria andSystemTimeNotLike(String value) {
			addCriterion("SYSTEM_TIME not like", value, "systemTime");
			return this;
		}

		public Criteria andSystemTimeIn(List values) {
			addCriterion("SYSTEM_TIME in", values, "systemTime");
			return this;
		}

		public Criteria andSystemTimeNotIn(List values) {
			addCriterion("SYSTEM_TIME not in", values, "systemTime");
			return this;
		}

		public Criteria andSystemTimeBetween(String value1, String value2) {
			addCriterion("SYSTEM_TIME between", value1, value2, "systemTime");
			return this;
		}

		public Criteria andSystemTimeNotBetween(String value1, String value2) {
			addCriterion("SYSTEM_TIME not between", value1, value2,
					"systemTime");
			return this;
		}

		public Criteria andTotalSingleDoubleIsNull() {
			addCriterion("total_single_double is null");
			return this;
		}

		public Criteria andTotalSingleDoubleIsNotNull() {
			addCriterion("total_single_double is not null");
			return this;
		}

		public Criteria andTotalSingleDoubleEqualTo(String value) {
			addCriterion("total_single_double =", value, "totalSingleDouble");
			return this;
		}

		public Criteria andTotalSingleDoubleNotEqualTo(String value) {
			addCriterion("total_single_double <>", value, "totalSingleDouble");
			return this;
		}

		public Criteria andTotalSingleDoubleGreaterThan(String value) {
			addCriterion("total_single_double >", value, "totalSingleDouble");
			return this;
		}

		public Criteria andTotalSingleDoubleGreaterThanOrEqualTo(String value) {
			addCriterion("total_single_double >=", value, "totalSingleDouble");
			return this;
		}

		public Criteria andTotalSingleDoubleLessThan(String value) {
			addCriterion("total_single_double <", value, "totalSingleDouble");
			return this;
		}

		public Criteria andTotalSingleDoubleLessThanOrEqualTo(String value) {
			addCriterion("total_single_double <=", value, "totalSingleDouble");
			return this;
		}

		public Criteria andTotalSingleDoubleLike(String value) {
			addCriterion("total_single_double like", value, "totalSingleDouble");
			return this;
		}

		public Criteria andTotalSingleDoubleNotLike(String value) {
			addCriterion("total_single_double not like", value,
					"totalSingleDouble");
			return this;
		}

		public Criteria andTotalSingleDoubleIn(List values) {
			addCriterion("total_single_double in", values, "totalSingleDouble");
			return this;
		}

		public Criteria andTotalSingleDoubleNotIn(List values) {
			addCriterion("total_single_double not in", values,
					"totalSingleDouble");
			return this;
		}

		public Criteria andTotalSingleDoubleBetween(String value1, String value2) {
			addCriterion("total_single_double between", value1, value2,
					"totalSingleDouble");
			return this;
		}

		public Criteria andTotalSingleDoubleNotBetween(String value1,
				String value2) {
			addCriterion("total_single_double not between", value1, value2,
					"totalSingleDouble");
			return this;
		}

		public Criteria andTotalBigSmallIsNull() {
			addCriterion("total_big_small is null");
			return this;
		}

		public Criteria andTotalBigSmallIsNotNull() {
			addCriterion("total_big_small is not null");
			return this;
		}

		public Criteria andTotalBigSmallEqualTo(String value) {
			addCriterion("total_big_small =", value, "totalBigSmall");
			return this;
		}

		public Criteria andTotalBigSmallNotEqualTo(String value) {
			addCriterion("total_big_small <>", value, "totalBigSmall");
			return this;
		}

		public Criteria andTotalBigSmallGreaterThan(String value) {
			addCriterion("total_big_small >", value, "totalBigSmall");
			return this;
		}

		public Criteria andTotalBigSmallGreaterThanOrEqualTo(String value) {
			addCriterion("total_big_small >=", value, "totalBigSmall");
			return this;
		}

		public Criteria andTotalBigSmallLessThan(String value) {
			addCriterion("total_big_small <", value, "totalBigSmall");
			return this;
		}

		public Criteria andTotalBigSmallLessThanOrEqualTo(String value) {
			addCriterion("total_big_small <=", value, "totalBigSmall");
			return this;
		}

		public Criteria andTotalBigSmallLike(String value) {
			addCriterion("total_big_small like", value, "totalBigSmall");
			return this;
		}

		public Criteria andTotalBigSmallNotLike(String value) {
			addCriterion("total_big_small not like", value, "totalBigSmall");
			return this;
		}

		public Criteria andTotalBigSmallIn(List values) {
			addCriterion("total_big_small in", values, "totalBigSmall");
			return this;
		}

		public Criteria andTotalBigSmallNotIn(List values) {
			addCriterion("total_big_small not in", values, "totalBigSmall");
			return this;
		}

		public Criteria andTotalBigSmallBetween(String value1, String value2) {
			addCriterion("total_big_small between", value1, value2,
					"totalBigSmall");
			return this;
		}

		public Criteria andTotalBigSmallNotBetween(String value1, String value2) {
			addCriterion("total_big_small not between", value1, value2,
					"totalBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallIsNull() {
			addCriterion("total_tail_big_small is null");
			return this;
		}

		public Criteria andTotalTailBigSmallIsNotNull() {
			addCriterion("total_tail_big_small is not null");
			return this;
		}

		public Criteria andTotalTailBigSmallEqualTo(String value) {
			addCriterion("total_tail_big_small =", value, "totalTailBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallNotEqualTo(String value) {
			addCriterion("total_tail_big_small <>", value, "totalTailBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallGreaterThan(String value) {
			addCriterion("total_tail_big_small >", value, "totalTailBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallGreaterThanOrEqualTo(String value) {
			addCriterion("total_tail_big_small >=", value, "totalTailBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallLessThan(String value) {
			addCriterion("total_tail_big_small <", value, "totalTailBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallLessThanOrEqualTo(String value) {
			addCriterion("total_tail_big_small <=", value, "totalTailBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallLike(String value) {
			addCriterion("total_tail_big_small like", value,
					"totalTailBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallNotLike(String value) {
			addCriterion("total_tail_big_small not like", value,
					"totalTailBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallIn(List values) {
			addCriterion("total_tail_big_small in", values, "totalTailBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallNotIn(List values) {
			addCriterion("total_tail_big_small not in", values,
					"totalTailBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallBetween(String value1, String value2) {
			addCriterion("total_tail_big_small between", value1, value2,
					"totalTailBigSmall");
			return this;
		}

		public Criteria andTotalTailBigSmallNotBetween(String value1,
				String value2) {
			addCriterion("total_tail_big_small not between", value1, value2,
					"totalTailBigSmall");
			return this;
		}

		public Criteria andDragonTiggerIsNull() {
			addCriterion("dragon_tigger is null");
			return this;
		}

		public Criteria andDragonTiggerIsNotNull() {
			addCriterion("dragon_tigger is not null");
			return this;
		}

		public Criteria andDragonTiggerEqualTo(String value) {
			addCriterion("dragon_tigger =", value, "dragonTigger");
			return this;
		}

		public Criteria andDragonTiggerNotEqualTo(String value) {
			addCriterion("dragon_tigger <>", value, "dragonTigger");
			return this;
		}

		public Criteria andDragonTiggerGreaterThan(String value) {
			addCriterion("dragon_tigger >", value, "dragonTigger");
			return this;
		}

		public Criteria andDragonTiggerGreaterThanOrEqualTo(String value) {
			addCriterion("dragon_tigger >=", value, "dragonTigger");
			return this;
		}

		public Criteria andDragonTiggerLessThan(String value) {
			addCriterion("dragon_tigger <", value, "dragonTigger");
			return this;
		}

		public Criteria andDragonTiggerLessThanOrEqualTo(String value) {
			addCriterion("dragon_tigger <=", value, "dragonTigger");
			return this;
		}

		public Criteria andDragonTiggerLike(String value) {
			addCriterion("dragon_tigger like", value, "dragonTigger");
			return this;
		}

		public Criteria andDragonTiggerNotLike(String value) {
			addCriterion("dragon_tigger not like", value, "dragonTigger");
			return this;
		}

		public Criteria andDragonTiggerIn(List values) {
			addCriterion("dragon_tigger in", values, "dragonTigger");
			return this;
		}

		public Criteria andDragonTiggerNotIn(List values) {
			addCriterion("dragon_tigger not in", values, "dragonTigger");
			return this;
		}

		public Criteria andDragonTiggerBetween(String value1, String value2) {
			addCriterion("dragon_tigger between", value1, value2,
					"dragonTigger");
			return this;
		}

		public Criteria andDragonTiggerNotBetween(String value1, String value2) {
			addCriterion("dragon_tigger not between", value1, value2,
					"dragonTigger");
			return this;
		}

		public Criteria andLeopardIsNull() {
			addCriterion("leopard is null");
			return this;
		}

		public Criteria andLeopardIsNotNull() {
			addCriterion("leopard is not null");
			return this;
		}

		public Criteria andLeopardEqualTo(String value) {
			addCriterion("leopard =", value, "leopard");
			return this;
		}

		public Criteria andLeopardNotEqualTo(String value) {
			addCriterion("leopard <>", value, "leopard");
			return this;
		}

		public Criteria andLeopardGreaterThan(String value) {
			addCriterion("leopard >", value, "leopard");
			return this;
		}

		public Criteria andLeopardGreaterThanOrEqualTo(String value) {
			addCriterion("leopard >=", value, "leopard");
			return this;
		}

		public Criteria andLeopardLessThan(String value) {
			addCriterion("leopard <", value, "leopard");
			return this;
		}

		public Criteria andLeopardLessThanOrEqualTo(String value) {
			addCriterion("leopard <=", value, "leopard");
			return this;
		}

		public Criteria andLeopardLike(String value) {
			addCriterion("leopard like", value, "leopard");
			return this;
		}

		public Criteria andLeopardNotLike(String value) {
			addCriterion("leopard not like", value, "leopard");
			return this;
		}

		public Criteria andLeopardIn(List values) {
			addCriterion("leopard in", values, "leopard");
			return this;
		}

		public Criteria andLeopardNotIn(List values) {
			addCriterion("leopard not in", values, "leopard");
			return this;
		}

		public Criteria andLeopardBetween(String value1, String value2) {
			addCriterion("leopard between", value1, value2, "leopard");
			return this;
		}

		public Criteria andLeopardNotBetween(String value1, String value2) {
			addCriterion("leopard not between", value1, value2, "leopard");
			return this;
		}

		public Criteria andField1IsNull() {
			addCriterion("field1 is null");
			return this;
		}

		public Criteria andField1IsNotNull() {
			addCriterion("field1 is not null");
			return this;
		}

		public Criteria andField1EqualTo(String value) {
			addCriterion("field1 =", value, "field1");
			return this;
		}

		public Criteria andField1NotEqualTo(String value) {
			addCriterion("field1 <>", value, "field1");
			return this;
		}

		public Criteria andField1GreaterThan(String value) {
			addCriterion("field1 >", value, "field1");
			return this;
		}

		public Criteria andField1GreaterThanOrEqualTo(String value) {
			addCriterion("field1 >=", value, "field1");
			return this;
		}

		public Criteria andField1LessThan(String value) {
			addCriterion("field1 <", value, "field1");
			return this;
		}

		public Criteria andField1LessThanOrEqualTo(String value) {
			addCriterion("field1 <=", value, "field1");
			return this;
		}

		public Criteria andField1Like(String value) {
			addCriterion("field1 like", value, "field1");
			return this;
		}

		public Criteria andField1NotLike(String value) {
			addCriterion("field1 not like", value, "field1");
			return this;
		}

		public Criteria andField1In(List values) {
			addCriterion("field1 in", values, "field1");
			return this;
		}

		public Criteria andField1NotIn(List values) {
			addCriterion("field1 not in", values, "field1");
			return this;
		}

		public Criteria andField1Between(String value1, String value2) {
			addCriterion("field1 between", value1, value2, "field1");
			return this;
		}

		public Criteria andField1NotBetween(String value1, String value2) {
			addCriterion("field1 not between", value1, value2, "field1");
			return this;
		}

		public Criteria andField2IsNull() {
			addCriterion("field2 is null");
			return this;
		}

		public Criteria andField2IsNotNull() {
			addCriterion("field2 is not null");
			return this;
		}

		public Criteria andField2EqualTo(String value) {
			addCriterion("field2 =", value, "field2");
			return this;
		}

		public Criteria andField2NotEqualTo(String value) {
			addCriterion("field2 <>", value, "field2");
			return this;
		}

		public Criteria andField2GreaterThan(String value) {
			addCriterion("field2 >", value, "field2");
			return this;
		}

		public Criteria andField2GreaterThanOrEqualTo(String value) {
			addCriterion("field2 >=", value, "field2");
			return this;
		}

		public Criteria andField2LessThan(String value) {
			addCriterion("field2 <", value, "field2");
			return this;
		}

		public Criteria andField2LessThanOrEqualTo(String value) {
			addCriterion("field2 <=", value, "field2");
			return this;
		}

		public Criteria andField2Like(String value) {
			addCriterion("field2 like", value, "field2");
			return this;
		}

		public Criteria andField2NotLike(String value) {
			addCriterion("field2 not like", value, "field2");
			return this;
		}

		public Criteria andField2In(List values) {
			addCriterion("field2 in", values, "field2");
			return this;
		}

		public Criteria andField2NotIn(List values) {
			addCriterion("field2 not in", values, "field2");
			return this;
		}

		public Criteria andField2Between(String value1, String value2) {
			addCriterion("field2 between", value1, value2, "field2");
			return this;
		}

		public Criteria andField2NotBetween(String value1, String value2) {
			addCriterion("field2 not between", value1, value2, "field2");
			return this;
		}

		public Criteria andField3IsNull() {
			addCriterion("field3 is null");
			return this;
		}

		public Criteria andField3IsNotNull() {
			addCriterion("field3 is not null");
			return this;
		}

		public Criteria andField3EqualTo(String value) {
			addCriterion("field3 =", value, "field3");
			return this;
		}

		public Criteria andField3NotEqualTo(String value) {
			addCriterion("field3 <>", value, "field3");
			return this;
		}

		public Criteria andField3GreaterThan(String value) {
			addCriterion("field3 >", value, "field3");
			return this;
		}

		public Criteria andField3GreaterThanOrEqualTo(String value) {
			addCriterion("field3 >=", value, "field3");
			return this;
		}

		public Criteria andField3LessThan(String value) {
			addCriterion("field3 <", value, "field3");
			return this;
		}

		public Criteria andField3LessThanOrEqualTo(String value) {
			addCriterion("field3 <=", value, "field3");
			return this;
		}

		public Criteria andField3Like(String value) {
			addCriterion("field3 like", value, "field3");
			return this;
		}

		public Criteria andField3NotLike(String value) {
			addCriterion("field3 not like", value, "field3");
			return this;
		}

		public Criteria andField3In(List values) {
			addCriterion("field3 in", values, "field3");
			return this;
		}

		public Criteria andField3NotIn(List values) {
			addCriterion("field3 not in", values, "field3");
			return this;
		}

		public Criteria andField3Between(String value1, String value2) {
			addCriterion("field3 between", value1, value2, "field3");
			return this;
		}

		public Criteria andField3NotBetween(String value1, String value2) {
			addCriterion("field3 not between", value1, value2, "field3");
			return this;
		}

		public Criteria andField4IsNull() {
			addCriterion("field4 is null");
			return this;
		}

		public Criteria andField4IsNotNull() {
			addCriterion("field4 is not null");
			return this;
		}

		public Criteria andField4EqualTo(String value) {
			addCriterion("field4 =", value, "field4");
			return this;
		}

		public Criteria andField4NotEqualTo(String value) {
			addCriterion("field4 <>", value, "field4");
			return this;
		}

		public Criteria andField4GreaterThan(String value) {
			addCriterion("field4 >", value, "field4");
			return this;
		}

		public Criteria andField4GreaterThanOrEqualTo(String value) {
			addCriterion("field4 >=", value, "field4");
			return this;
		}

		public Criteria andField4LessThan(String value) {
			addCriterion("field4 <", value, "field4");
			return this;
		}

		public Criteria andField4LessThanOrEqualTo(String value) {
			addCriterion("field4 <=", value, "field4");
			return this;
		}

		public Criteria andField4Like(String value) {
			addCriterion("field4 like", value, "field4");
			return this;
		}

		public Criteria andField4NotLike(String value) {
			addCriterion("field4 not like", value, "field4");
			return this;
		}

		public Criteria andField4In(List values) {
			addCriterion("field4 in", values, "field4");
			return this;
		}

		public Criteria andField4NotIn(List values) {
			addCriterion("field4 not in", values, "field4");
			return this;
		}

		public Criteria andField4Between(String value1, String value2) {
			addCriterion("field4 between", value1, value2, "field4");
			return this;
		}

		public Criteria andField4NotBetween(String value1, String value2) {
			addCriterion("field4 not between", value1, value2, "field4");
			return this;
		}

		public Criteria andField5IsNull() {
			addCriterion("field5 is null");
			return this;
		}

		public Criteria andField5IsNotNull() {
			addCriterion("field5 is not null");
			return this;
		}

		public Criteria andField5EqualTo(String value) {
			addCriterion("field5 =", value, "field5");
			return this;
		}

		public Criteria andField5NotEqualTo(String value) {
			addCriterion("field5 <>", value, "field5");
			return this;
		}

		public Criteria andField5GreaterThan(String value) {
			addCriterion("field5 >", value, "field5");
			return this;
		}

		public Criteria andField5GreaterThanOrEqualTo(String value) {
			addCriterion("field5 >=", value, "field5");
			return this;
		}

		public Criteria andField5LessThan(String value) {
			addCriterion("field5 <", value, "field5");
			return this;
		}

		public Criteria andField5LessThanOrEqualTo(String value) {
			addCriterion("field5 <=", value, "field5");
			return this;
		}

		public Criteria andField5Like(String value) {
			addCriterion("field5 like", value, "field5");
			return this;
		}

		public Criteria andField5NotLike(String value) {
			addCriterion("field5 not like", value, "field5");
			return this;
		}

		public Criteria andField5In(List values) {
			addCriterion("field5 in", values, "field5");
			return this;
		}

		public Criteria andField5NotIn(List values) {
			addCriterion("field5 not in", values, "field5");
			return this;
		}

		public Criteria andField5Between(String value1, String value2) {
			addCriterion("field5 between", value1, value2, "field5");
			return this;
		}

		public Criteria andField5NotBetween(String value1, String value2) {
			addCriterion("field5 not between", value1, value2, "field5");
			return this;
		}
	}
}