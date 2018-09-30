package com.jiuyv.common.ibatis.vo;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Criteria {
    protected List<String> criteriaWithoutValue;

    protected List<Map<String, Object>> criteriaWithSingleValue;

    protected List<Map<String, Object>> criteriaWithListValue;
    
    protected List<Map<String, Object>> criteriaOrValue;

    protected List<Map<String, Object>> criteriaWithBetweenValue;

    public Criteria() {
        super();
        criteriaWithoutValue = new ArrayList<String>();
        criteriaWithSingleValue = new ArrayList<Map<String, Object>>();
        criteriaWithListValue = new ArrayList<Map<String, Object>>();
        criteriaWithBetweenValue = new ArrayList<Map<String, Object>>();
        criteriaOrValue= new ArrayList<Map<String, Object>>(); 
    }

    public boolean isValid() {
        return criteriaWithoutValue.size() > 0
            || criteriaWithSingleValue.size() > 0
            || criteriaWithListValue.size() > 0
            || criteriaWithBetweenValue.size() > 0;
    }

    
    public void addOrCriterion(String condition, Object value, String property){
    	if (value == null) {
             throw new RuntimeException("Value list for " + property + " cannot be null or empty");
         }
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("condition", condition);
         map.put("value", value);
         criteriaOrValue.add(map);
    }
    
    public List<String> getCriteriaWithoutValue() {
        return criteriaWithoutValue;
    }

    public List<Map<String, Object>> getCriteriaWithSingleValue() {
        return criteriaWithSingleValue;
    }

    public List<Map<String, Object>> getCriteriaWithListValue() {
        return criteriaWithListValue;
    }

    public List<Map<String, Object>> getCriteriaWithBetweenValue() {
        return criteriaWithBetweenValue;
    }


    public void addCriterion(String value) {
        if (value == null) {
            throw new RuntimeException("Value   cannot be null");
        }
        criteriaWithoutValue.add(value);
    }
    
    
    public void addCriterion(String condition, Object value, String property) {
        if (value == null) {
            throw new RuntimeException("Value for " + property + " cannot be null");
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("value", value);
        criteriaWithSingleValue.add(map);
    }

    public void addCriterion(String condition, List<? extends Object> values, String property) {
        if (values == null || values.size() == 0) {
            throw new RuntimeException("Value list for " + property + " cannot be null or empty");
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("values", values);
        criteriaWithListValue.add(map);
    }

    public void addCriterion(String condition, Object value1, Object value2, String property) {
        if (value1 == null || value2 == null) {
            throw new RuntimeException("Between values for " + property + " cannot be null");
        }
        List<Object> list = new ArrayList<Object>();
        list.add(value1);
        list.add(value2);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("condition", condition);
        map.put("values", list);
        criteriaWithBetweenValue.add(map);
    }

   
}
