package com.jiuyv.common.ibatis;

import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyv.common.ibatis.vo.Criteria;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Filter.Comparison;
import com.jiuyv.common.ibatis.vo.Filter.Data;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.ibatis.vo.Pager;
import com.jiuyv.common.ibatis.vo.Sort;

// TODO: Auto-generated Javadoc
/**
 * criteria查询工具.
 */
public class CriteriaUtil {

	private static final Logger LOGGER = LoggerFactory.getLogger(CriteriaUtil.class);
	
	/** 每页记录数excel. */
	public static final String EXCEL = "excel";
	/** 百分号. */
	public static final String PERCENT_SIGN = "%";

	/** 升序排列. */
	public static final String DIR_ASC = "ASC";
	
	/** 降序排列. */
	public static final String DIR_DESC = "DESC";
	
	/** 默认排序为升序. */
	public static final String DEF_DIR = DIR_ASC;
	
	/** 常量 OPER_MAP. */
	private static final Map<String, String> OPER_MAP = new HashMap<String, String>();
	static {
		OPER_MAP.put("gt", " > ");
		OPER_MAP.put("lt", " < ");
		OPER_MAP.put("ge", " >= ");
		OPER_MAP.put("le", " <= ");
		OPER_MAP.put("eq", " = ");
		OPER_MAP.put("ne", " <> ");
		OPER_MAP.put("ulike", " NOT LIKE ");
		OPER_MAP.put("like", " LIKE ");
		OPER_MAP.put("beforelike", " LIKE ");
		OPER_MAP.put("afterlike", " LIKE ");
		OPER_MAP.put("in", " IN ");
		OPER_MAP.put("notin", " NOT IN ");

	}

	/**
	 * 
	 * 获得操作符 "gt",">" "lt","<" "eq","=" "ge",">=" "le","<=".
	 * 
	 * @param comp :
	 *            "gt", "lt", "eq", "ge", "le"
	 * 
	 * @return '>', '<', '=', '>=', '<='
	 */
	public static String getComp(String comp) {
		if (comp == null) {
			return null;
		}

		String tcomp = comp.trim();

		String oper = null;
		oper = OPER_MAP.get(tcomp);

		return oper;
	}

	public static Object convertonevalue(Object orgvalue, String type,
			String compar) {
		if (type.equals(Filter.NUMERIC) || type.equals(Filter.MONEY)) {
			// 数字
			return Long.valueOf(orgvalue.toString());
		} 
		
        // condition date 8
        if (Filter.DATE.equalsIgnoreCase(type)) {
            if (orgvalue instanceof String) {
            	return SimpleDateCheck.parseDateFromVo2Db((String) orgvalue);
            }
        }
        // condition time 14
        //ADDED FOR TIME
        if (Filter.TIME.equalsIgnoreCase(type)) {
            if (orgvalue instanceof String) {
               return SimpleDateCheck.parseDateFromVo2Db14((String) orgvalue);
            
            }
        }
			String newvalue = null;
			newvalue = String.valueOf(orgvalue);
			newvalue = newvalue.trim();
			// 字符判断是否有like的问题
			if (compar.equals(Comparison.LIKE)
					|| compar.equals(Comparison.ULIKE)) {

				newvalue = PERCENT_SIGN + newvalue + PERCENT_SIGN;

			}if(compar.equals(Comparison.BEFORE_LIKE)){
				newvalue = PERCENT_SIGN + newvalue;
			}if(compar.equals(Comparison.AFTER_LIKE)){
				newvalue = newvalue + PERCENT_SIGN;
			}
			return newvalue;
		

	}

	public static Object convertvalue(Data tempdatax, String listtype) {
		// 对列表和单个的进行类型转换
		Data tempdata=null;
		try {
			tempdata = (Data) BeanUtils.cloneBean(tempdatax);
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			LOGGER.error("", e);
		}
		Object tempvalue = tempdata.getValue();
		if (tempvalue instanceof java.util.List) {
			for (Object t : (List) tempvalue) {
				t = convertonevalue(t, listtype, Comparison.EQ);
			}
		} else if (tempvalue instanceof String && ((String) tempvalue).contains(",") ) {
			// 处理逗号分割的字符串类型List
			tempdata.setValue(Arrays.asList(((String) tempvalue).split(",")));
		} else {
			tempdata.setValue(convertonevalue(tempdata.getValue(), tempdata
					.getType(), tempdata.getComparison()));
		}

		return tempdata.getValue();
	}

	/**
	 * Gen criteriaby filter. 根据filter条件生成Criteria对象
	 * 
	 * @param Filters
	 *            the filters
	 * @param BeanColumnMappings
	 *            the bean column mappings
	 * 
	 * @return the criteria
	 */
	public static Criteria genCriteriabyFilter(List<Filter> Filters,
			HashMap<String, BeanColumnMap> BeanColumnMappings) {
		Criteria newCriteria = new Criteria();
		if (Filters != null && Filters.size() > 0) {
			for (Filter oneFilter : Filters) {
				// 先根据filter里的属性名得到数据库列名
				String filterpropretyname = oneFilter.getField();
				BeanColumnMap BeanColumn = BeanColumnMappings
						.get(filterpropretyname.trim().toLowerCase());
				if (BeanColumn != null||Filter.TXT.equals(oneFilter.getData().getType())) {
					Data data = oneFilter.getData();
					String columnname="";
					if(BeanColumn!=null){					
						columnname= BeanColumn.getColumnName();
					// 然后根据判断条件添加Criteria
				
					// 先取出colume的类型，如果没有data类型定义的话，则根据columne的类型添加
					String columtype = BeanColumn.getPropertytype();

					if (data.getType() == null) {
						if (columtype.toLowerCase().indexOf("string") > -1) {

							data.setType(Filter.STRING);
						} else {
							data.setType(Filter.NUMERIC);
						}

					}
					if (data.getType() != null
							&& data.getType().equals(Filter.LIST)) {
						if (columtype.toLowerCase().indexOf("string") > -1) {
							data.setType(Filter.STRINGLIST);
						} else {
							data.setType(Filter.NUMBERLIST);
						}
					}
					}
					
					
					if(Filter.TXT.equals(data.getType())){
						newCriteria.addCriterion(data.getValue().toString());
					}
					else 
					if(Comparison.IN.equals(data.getComparison())&&!data.getType().equals(Filter.STRINGLIST)){
						Data tempdata =new Data();
						String[] paramters=	data.getValue().toString().split(",");
						List<String> tempList=new ArrayList<String>();
						for(int i=0;i<paramters.length;i++){
							tempList.add(paramters[i]);
						}		
						tempdata.setValue(tempList);
						tempdata.setComparison(data.getComparison());
						String condition = columnname + getComp("in");						
						newCriteria.addCriterion(condition,
								(List) convertvalue(tempdata, Filter.STRING),
								filterpropretyname);
					} else	if (data.getType().equals(Filter.NUMBERLIST)) {
						String condition = columnname + getComp("in");
						newCriteria.addCriterion(condition,
								(List) convertvalue(data, Filter.NUMERIC),
								filterpropretyname);
					} else if(data.getType().equals(Filter.OR)){
						String condition = columnname + getComp(data.getComparison());
						newCriteria.addOrCriterion(condition,
								convertvalue(data, null),
								filterpropretyname);
					}else if (data.getType().equals(Filter.STRINGLIST)) {
						String condition="";
						if("notin".equals(data.getComparison())){
							 condition = columnname + getComp("notin");
						}
						else  condition = columnname + getComp("in");						
						newCriteria.addCriterion(condition,
								(List) convertvalue(data, Filter.STRING),
								filterpropretyname);

					} else {
						String condition = columnname + getComp(data.getComparison());
						newCriteria.addCriterion(condition, convertvalue(data,
								null), filterpropretyname);

					}

				}

			}
		}
		return newCriteria;

	}

	public static Pager genPagebyPage(Page oldpage,
			HashMap<String, BeanColumnMap> BeanColumnMappings) {
		Pager newpage = new Pager();
		if (oldpage==null || oldpage.getLimit() == null || oldpage.getLimit().equals(EXCEL) ) {
			newpage.setPageful(null);
		} else {
			long tempstart = Long.valueOf(oldpage.getStart());
			long templimit = Long.valueOf(oldpage.getLimit());
			long lstart = 0;
			long lend = templimit;
			lstart = tempstart + 1;
			lend = tempstart +templimit;
			newpage.setPagestart(lstart);
			newpage.setPageend(lend);
		}
		return newpage;
	}
	
	/**
	 * 生成排序信息.
	 *
	 * @param page the page
	 * @param columnMap the column map
	 * @return the list
	 */
	public static List<Sort> genSorts(Page page, Map<String, BeanColumnMap> columnMap) {
		if ( page == null || columnMap == null ) {
			return null ; 
		}
		String sort = StringUtils.trimToEmpty(page.getSort());
		String dir  = StringUtils.trimToEmpty(page.getDir());
		String[] sorts = sort.split(",");
		String[] dirs = dir.split(",");
		int dirsize = dirs.length ; 
		List<Sort> sortList = new ArrayList<Sort>();
		for (int i = 0 ; i < sorts.length ; i++ ) {
			String fld = sorts[i];
			BeanColumnMap column = columnMap.get(fld.trim().toLowerCase());
			if ( column == null ) {
				continue ; 
			}
			String columnName = column.getColumnName();
			String dirType = DEF_DIR;
			if ( dirsize > i && DIR_DESC.equalsIgnoreCase(dirs[i])) {
				dirType = DIR_DESC ;
			}
			sortList.add(new Sort(columnName, dirType));
		}
		if ( sortList.size() == 0) {
			return null ;
		}
		return sortList ; 
	}
	
	public static Pager genSimplePage(Page page) {
		Pager pager = new Pager();
		long tempstart = Long.valueOf(page.getStart());
		long templimit = Long.valueOf(page.getLimit());
		long lstart = 0;
		long lend = templimit;
		lstart = tempstart + 1;
		lend = tempstart +templimit;
		pager.setPagestart(lstart);
		pager.setPageend(lend);
		if (!StringUtils.isBlank(page.getDir()) && !StringUtils.isBlank(page.getSort())) {
			pager.setDir(page.getDir());
			pager.setSort(page.getSort());
		} else {
			pager.setSort(null);
		}
		return pager;
	}
	
}
