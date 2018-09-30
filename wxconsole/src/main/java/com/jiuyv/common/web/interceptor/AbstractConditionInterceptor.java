package com.jiuyv.common.web.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.struts2.ServletActionContext;

import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.security.entity.IConstants;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;


// TODO: Auto-generated Javadoc
/**
 * 这个类用于解析页面传输的page信息和Filter信息。.
 * 
 * @author cowyk
 */
public class AbstractConditionInterceptor extends AbstractInterceptor {
    
    /** 排序域. */
    private static final String DIR = "dir";

    /** 每页记录数. */
    private static final String LIMIT = "limit";

    /** 升序/降序. */
    private static final String SORT = "sort";

    /** 起始记录数. */
    private static final String START = "start";

    /** The Constant ORG_FLD. */
    private static final String ORG_FLD = "ORG_FLD";

    /** The Constant ACC_FLD. */
    private static final String ACC_FLD = "ACC_FLD";
    
	/** json config */
	private static final JsonConfig CONFIG = new JsonConfig();
	
	static {
		CONFIG.setJsonPropertyFilter(new PropertyFilter(){
			public boolean apply(Object source, String name, Object value) {
				if ( value != null && value instanceof String && "".equals(String.valueOf(value).trim()) ){
					return true;
				}
				return false;
			}			
		});
	}
    
    /**
     * 拦截方法，将page信息和filter信息装入对象并保存。.
     * 
     * @param invocation Action启动器
     * 
     * @return 返回页面
     * 
     * @throws Exception the exception
     */
    public String intercept(ActionInvocation invocation)
        throws Exception {
        // get userinfo in session
        // Http session
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = request.getSession();

        Object obj = session.getAttribute(IConstants.USER_CONTEXT);

        if (obj != null) {
     
            // generate condition filter
            genFilters(request);
        } else {
            genFilters(request);
        }

        // generate pagination information
        // genPageInfo(request);

        // return 
        return invocation.invoke();
    }

    /**
     * 用于生成分页信息。
     * 并且往request中存入相应的信息。.
     * 
     * @param request 请求信息
     */
    private void genPageInfo(HttpServletRequest request) {
        if (request == null) {
            return;
        }

        Page page = new Page();
        page.setDir(request.getParameter(DIR));
        page.setLimit(request.getParameter(LIMIT));
        page.setSort(request.getParameter(SORT));
        page.setStart(request.getParameter(START));
        request.setAttribute(IConstants.PAGE_FLD, page);
    }

    /**
     * 用于生成条件集合。
     * 并且往request中存入相应的信息。.
     * 
     * @param request 请求信息
     * @param user 对象信息
     */
    private void genFilters(HttpServletRequest request) {
//        HttpSession session = request.getSession();
        String jsonstr = request.getParameter(IConstants.FILTER_FLD);
//        Object access = session.getAttribute(IConstants.ACCESS_AUTHOR);
        List<Filter> filters = new ArrayList<Filter>();

        if (jsonstr != null && !"".equals(jsonstr.trim())) {
            JSONArray arr = JSONArray.fromObject(jsonstr, CONFIG);

            if (arr == null) {
                return;
            }

            for (Object object : arr) {
                Object obj = JSONObject.toBean((JSONObject) object, Filter.class);
                filters.add((Filter) obj);
            }
        }

        request.setAttribute(IConstants.FILTER_FLD, filters);
    }

}
