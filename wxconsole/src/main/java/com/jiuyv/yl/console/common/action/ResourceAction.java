package com.jiuyv.yl.console.common.action;


import java.util.List;

import com.jiuyv.yl.console.common.service.IResourceService;
import com.jiuyv.yl.console.security.entity.Resource;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Filter.Comparison;
import com.jiuyv.common.ibatis.vo.Filter.Data;
import com.jiuyv.common.web.action.DefaultPageSupportAction;

/**
 * @author charely
 *
 */
public class ResourceAction extends DefaultPageSupportAction {
	/** The Service. */
	private IResourceService service;
	
	
	
	/**参数的过滤参数**/
	private String resourceID;
	
	public String findResourceList() throws Exception{
			Filter tempFilter=new Filter();
			tempFilter.setField("logflag");
			Data tempdata=new Data();
			tempdata.setComparison(Comparison.EQ);
			tempdata.setValue("1");
			tempdata.setType(Filter.STRING);
			tempFilter.setData(tempdata);
			List<Filter> tempFilters = getFilters();
			tempFilters.add(tempFilter);
			ExtData<Resource> data = service.findResourceList(tempFilters);
			setResData(data);
			return SUCCESS;
		}
	
		public IResourceService getService() {
			return service;
		}
		public void setService(IResourceService service) {
			this.service = service;
		}
		
		public String getResourceID() {
			return resourceID;
		}
		public void setResourceID(String resourceID) {
			this.resourceID = resourceID;
		}
}
