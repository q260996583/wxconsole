package com.jiuyv.common.web.action;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.PropertyFilter;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.BasicConfigurator;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.context.SecurityContextHolder;

import com.jiuyv.common.exception.BaseException;
import com.jiuyv.common.exception.BussnissException;
import com.jiuyv.common.execl.CellDataType;
import com.jiuyv.common.execl.DefaultHSSOutput;
import com.jiuyv.common.execl.HSSFXLSWriter;
import com.jiuyv.common.execl.XLSSheetTemplate;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Filter.Comparison;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.txt.CSVUtil;
import com.jiuyv.common.web.interceptor.INotConvert;
import com.jiuyv.yl.console.finance.entity.NetPayVo;
import com.jiuyv.yl.console.finance.util.PayReqUtil;
import com.jiuyv.yl.console.outmer.entity.OutMerApplyVo;
import com.jiuyv.yl.console.security.entity.SecurityUserDetail;
import com.jiuyv.yl.console.security.entity.User;
import com.opensymphony.xwork2.ActionSupport;

/**
 * 默认的分页支持类。
 * 继承了ActionSupport类。
 * 并且提供可直接获得分页信息，条件集合，用户信息，语言代码的操作。.
 */
public class DefaultPageSupportAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/** The Constant LOGGER. */
	private static final Logger LOGGER = LoggerFactory.getLogger(DefaultPageSupportAction.class);
	
	/** The Constant TOKEN_USER. */
	private static final String TOKEN_USER = "page.output.xls.user";
	
	/** The Constant TOKEN_TIME. */
	private static final String TOKEN_TIME = "page.output.xls.time";
	
	/** 日期格式 yyyy-MM-dd. */
	private static final String DATE_FORMAT = "yyyy-MM-dd";
	/** 时间格式 yyyy-MM-dd HH:mm:ss */
	private static final String DATETIME_FORMAT = "yyyyMMddHHmmss";
	/** 日期格式 yyyyMMdd */
	private static final String DATE_FORMAT2 = "yyyyMMdd";
	/** 每页记录数excel. */
	protected static final String EXCEL = "excel";
	
	protected static final String NO_DATA = "nodata";
	
	/** struts2返回. */
	protected static final String CSV = "csv";

    /** struts2返回. */
    protected static final String TXT = "txt";
    
    /** struts2返回. */
    protected static final String WORD = "word";
    
    /** struts2返回. */
    protected static final String ZIP = "zip";
	
    /** struts2返回. */
    protected static final String XML = "xml";
    
	/** 排序域. */
    private String dir;

    /** 每页记录数. */
    private String limit;
    
    
    /** 升序/降序. */
    private String sort;

    /** 起始记录数. */
    private String start;		
	
    /** 过滤器信息存储域. */
	private String jsonfilter;	

	/** 页面传递过来的列表信息. */
	private String columns ;

	/** Action 中存储的对象信息. */
	private String jsonObject;
	
	/** 导出文件名. */
	private String fileName;
	
	/** Action 中存储的对象信息. */
	private String jsonArray;
	
	/** 数据存储域. */
	private String resData;
	/**下载文件的文件名*/
	private String downFilename;
	
	/** The input stream. */
	private InputStream inputStream;
	
	private byte[] inputStreamBytes;
	
	private static final String ExcelFileName = "商户批量进件";
	
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
    
	public String getResData() {
		return resData;
	}
	
	/**
	 * 设置对象到RES_DATA。.
	 * 
	 * @param data 将放入RES_DATA中的对象
	 */
	public void setResData(Object resData) {
		String retStr = null;
		if (resData != null ) {
			if (resData instanceof List){
				retStr = JSONArray.fromObject(resData).toString();
			}else{
				if ( !(resData instanceof INotConvert || resData instanceof String)){
					retStr = JSONObject.fromObject(resData).toString();
				}
			}
		}
		this.resData = retStr;
	}
	
    /**
	 * Execute.
	 * 
	 * @return success
	 * 
	 * @throws Exception the exception
	 */
	public String execute() throws Exception{
		return SUCCESS;
	}
    

	/**
	 * 获得分页信息。.
	 * 
	 * @return 分页信息
	 */
	protected Page getPageInfo(){
	//	HttpServletRequest request = ServletActionContext.getRequest();
        Page page = new Page();
        page.setDir(this.dir);
        page.setLimit(this.limit);
        page.setSort(this.sort);
        page.setStart(this.start);
        return page;
	}
	
	/**
	 * 获得分页信息(导出报表Excel用的)。.
	 * 
	 * @return 分页信息
	 */
	protected Page getExcelPageInfo(){
		  Page page =getPageInfo();
		  page.setLimit(EXCEL);
         return page;
	}
	/**
	 * 获得分页信息(ALL)。.
	 * 
	 * @return 分页信息
	 */
	protected Page getALLPageInfo(){
		  Page page =getPageInfo();
		  page.setLimit(EXCEL);
         return page;
	}
	
	/**
	 * 获得条件集合信息。.
	 * 
	 * @return 条件集合
	 */
	protected List<Filter> getFilters(){ 
		List<Filter> filters = new ArrayList<Filter>();
        if (jsonfilter != null && !"".equals(jsonfilter.trim())) {
            JSONArray arr = JSONArray.fromObject(jsonfilter, CONFIG);
            if (arr == null) {
                return null;
            }
            for (Object object : arr) {
                Object obj = JSONObject.toBean((JSONObject) object, Filter.class);
                filters.add((Filter) obj);
            }
        }
		return filters;
	}
	
	/**
	 * 获得条件集合信息(有机构约束)。.
	 * 
	 * @return 条件集合
	 * @throws Exception 
	 */
	protected List<Filter> getOrgFilters(String orgproteyname) throws Exception {
		List<Filter> filters=getFilters();
		if (filters==null){
			filters=new ArrayList<Filter>();
		}
		Filter orgfilter=new Filter(orgproteyname,Filter.LIST,this.getUserInfo().getChildOrgCodes(),null);
		
		filters.add(orgfilter);
		return filters;
	}
		
	/**
	 * 获得条件集合信息(有用户约束)。.
	 * 
	 * @return 条件集合
	 * @throws Exception 
	 */
	protected List<Filter> getUserFilters(String userproteyname) throws Exception {
		List<Filter> filters=getFilters();
		if (filters==null){
			filters=new ArrayList<Filter>();
		}
		Filter userfilter=new Filter(userproteyname,Filter.STRING,this.getUserInfo().getOprId(),Comparison.EQ);
		
		filters.add(userfilter);
		return filters;
	}
	
	/**
	 * 获得简单用户信息。（用于后台的操作）
	 * 登录时，不能使用此方法来获得用户信息。.
	 * 
	 * @return 获得用户信息
	 * @throws Exception 
	 * @throws Exception 
	 */
	protected User getUserInfo() throws Exception{
		User user=null;
		try {
			
			System.out.println(SecurityContextHolder.getContext().getAuthentication().getPrincipal());
			user =(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		} catch (Exception e) {
			LOG.error("", e);
			throw new BussnissException("prompt.sessionExpired");
		}
		return user;
	}
	
	/**
	 * 获得Security用户信息。（用于后台的操作）
	 * 登录时，不能使用此方法来获得用户信息。.
	 * 
	 * @return 获得用户信息
	 * @throws Exception 
	 * @throws Exception 
	 */
	protected SecurityUserDetail getUserDetailInfo() {
		SecurityUserDetail user=null;
		user =(SecurityUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
 		return user;
	}
	
	/**
	 * 获得当前请求中的语言代码.
	 * 
	 * @return 语言代码
	 */
	protected String getLang() {
		HttpServletRequest request = ServletActionContext.getRequest();
		String lang = request.getLocale().toString();
		return lang;
	}
	
	
	/**
	 * 普通excel导出
	 * @param data
	 * @param props
	 * @throws IOException
	 */
	protected  <T> void exportNormalXLS(List<T> data,List<CellDataType> props) throws IOException {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		XLSSheetTemplate sheet = new XLSSheetTemplate("sheet", "", "","", data,getLocalName(props));
		try {
			HSSFXLSWriter.outputXLS(sheet, out);
		} catch (Exception e) {
			BasicConfigurator.configure();
			LOG.error("exportNormalXLS failed. ", e);
		}
		this.inputStreamBytes = out.toByteArray();
	}
	
	 /**
	 * Gets the validate list.
	 *
	 * @param <T> the generic type
	 * @param beanClass the bean class
	 * @return the validate list
	 * @throws BaseException the base exception
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> getValidateList(Class<T> beanClass) throws BaseException {
		String json = this.jsonArray;
		JSONArray jsonArr = JSONArray.fromObject(json);
		return new ArrayList<T>(JSONArray.toCollection(jsonArr,beanClass));
	}
	
	/**
	 * Gets the input stream.
	 * 
	 * @return the input stream
	 */
	public InputStream getInputStream() {
		//return inputStream;
		return new ByteArrayInputStream(inputStreamBytes);
	}
	
	public String getJsonfilter() {
		return jsonfilter;
	}
	
	public void setJsonfilter(String jsonfilter) {
		System.out.println(jsonfilter);
		this.jsonfilter = jsonfilter;
	}
	
	public Object getVaidateBean(Class BeanClass) throws BaseException{
		String json = this.getJsonObject();  
		JSONObject jsonObject = JSONObject.fromObject( json );  
		Object VailteBena=JSONObject.toBean( jsonObject,BeanClass);
		return VailteBena;		
	}
	
	/**
	 * 获取请求参数jsonObject对应的Java Bean对象
	 * @param Java Bean类型
	 * @return
	 * @throws BaseException
	 */
	@SuppressWarnings("unchecked")
	public <T> T jsonObjectBean(Class<T> BeanClass) throws BaseException{
		String json = getJsonObject();  
		JSONObject jsonObject = JSONObject.fromObject( json );  
		T bean = (T) JSONObject.toBean( jsonObject, BeanClass);
		return bean;		
	}
	
	/**
	 * 将json格式字符串转换为对象
	 * @param json
	 * @param beanClass
	 * @return
	 * @throws BaseException
	 */
	@SuppressWarnings("unchecked")
	public <T> T convertJsonToBean(String json, Class<T> beanClass) throws BaseException{
		JSONObject jsonObject = JSONObject.fromObject( json );  
		T bean = (T) JSONObject.toBean( jsonObject, beanClass);
		return bean;		
	}
	
	/**
	 * 转换json格式字符串转换为列表
	 * @param json
	 * @param beanClass
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> convertJsonToList(String json, Class<T> beanClass) {
		JSONArray jsonArr = JSONArray.fromObject(json);
		return new ArrayList<T>(JSONArray.toCollection(jsonArr, beanClass));
	}
	
	
	/**
	 * 获取下载的xls文件名
	 * title[yyyy-MM-dd HH:mm:ss].xls
	 * @param title
	 * @return
	 */
	protected String xlsName(String title) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATETIME_FORMAT);
		String fnm = String.format("%s-%s.xls", title,sdf.format(new Date()));
		return encodeFileName(fnm);
	}
	
	/**
	 * 获取下载的xls文件名
	 * title[yyyy-MM-dd HH:mm:ss].xls
	 * @param title
	 * @return
	 */
	protected String docName(String title) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATETIME_FORMAT);
		String fnm = String.format("%s-%s.docx", title,sdf.format(new Date()));
		return encodeFileName(fnm);
	}
		
	/**
	 * 默认excel文件导出。
	 * 工作页标签名称和工作表中名称一致。.
	 *
	 * @param title 工作表标题
	 * @param props 输出属性
	 * @param data ExtData对象
	 * @throws Exception 
	 */
	public <T> String defaultExportXLS(String title, List<CellDataType> props,
			ExtData<T> data) throws Exception {
		return this.defaultExportXLS(title, title, title, props, data == null ? new ArrayList<T>():data.getRoot());
	}
	
	/**
	 * 默认excel文件导出。
	 * 工作页标签名称和工作表中名称一致。.
	 *
	 * @param title 工作表标题
	 * @param props 输出属性
	 * @param data 输出数据
	 * @throws Exception 
	 */
	public <T> String defaultExportXLS(String title, List<CellDataType> props,
			List<T> data) throws Exception {
		xlsName(title);
		return this.defaultExportXLS(title, title, title, props, data);
	}

	/**
	 * Default export xls.
	 * 默认excel文件导出。
	 * 
	 * @param fileName 文件名
	 * @param sheetName 工作页名
	 * @param title 工作表标题
	 * @param props 输出属性
	 * @param data 输出数据
	 * @throws Exception 
	 */
	public <T> String defaultExportXLS(String fname, String sheetName, String title, List<CellDataType> props,
			List<T> data) throws Exception {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		User user = getUserInfo();
		String prefixUser = getText(TOKEN_USER);
		String prefixTime = getText(TOKEN_TIME)
				+ new SimpleDateFormat(DATE_FORMAT).format(new Date());
		if (user != null) {
			prefixUser += user.getOpName();
		}
		XLSSheetTemplate sheet = new XLSSheetTemplate(sheetName, title, prefixUser,
				prefixTime, data, getLocalName(props));
		try {
			HSSFXLSWriter.outputXLS(sheet, out);
		} catch (Exception e) {
			LOG.error("Error write to xls file. ",e);
		}
		this.inputStreamBytes = out.toByteArray();
		xlsName(fname);
		return EXCEL;
	}
	
	/**
	 * export xls with OutTitle.
	 * excel文件导出。
	 * 
	 * @param fileName 文件名
	 * @param sheetName 工作页名
	 * @param title 工作表标题
	 * @param props 输出属性
	 * @param data 输出数据
	 * @throws Exception 
	 */
	public <T> String exportXLSNoTitle(String fname, String sheetName, String title, List<CellDataType> props,
			List<T> data) throws Exception {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		User user = getUserInfo();
		String prefixUser = getText(TOKEN_USER);
		String prefixTime = getText(TOKEN_TIME)
				+ new SimpleDateFormat(DATE_FORMAT).format(new Date());
		if (user != null) {
			prefixUser += user.getOpName();
		}
		XLSSheetTemplate sheet = new XLSSheetTemplate(sheetName, title, prefixUser,
				prefixTime, data, getLocalName(props));
		sheet.setDrawTitle(false);
		sheet.setDrawSubtitle(false);
		try {
			HSSFXLSWriter.outputXLS(sheet, out);
		} catch (Exception e) {
			LOG.error("Error write to xls file. ",e);
		}
		this.inputStreamBytes = out.toByteArray();
		xlsName(fname);
		return EXCEL;
	}
	
	/**
	 * Export xls.
	 * 
	 * @param title
	 *            the title
	 * @param propName
	 *            the prop name
	 * @param resKey
	 *            the res key
	 * @param data
	 *            the data
	 * 
	 * @throws IOException
	 *             Signals that an I/O exception has occurred.
	 */
	public <T> String defaultExportXLS(String title, String[] propName,
			String[] resKey, List<T> data) throws IOException {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		Map<String, String> meta = new HashMap<String, String>();
		meta.put("title", title);
		meta.put("sheet", title);
		try {
			DefaultHSSOutput.outputTitledXLS(meta, data, propName,
					getLocalName(resKey), out);
		} catch (Exception e) {
			LOG.error("Output XLS error: ", e);
		}
		this.inputStreamBytes = out.toByteArray();
		xlsName(title);
		return EXCEL;
	}

	/**
	 * 设置输出文件名称（支持中文名称文件设置）
	 * 对文件名进行编码并设置到fileName属性
	 * @param name
	 * @return
	 */
	protected String encodeFileName(String name ) {
		String fileName = name ; 
		try {
			fileName = WebRequestUtil.encodeFileName(ServletActionContext.getRequest(), name);
		} catch (UnsupportedEncodingException e) {
			LOG.error("Error in convert fileName ",e);
		}
		setFileName(fileName);
		return fileName;
	}
	
	/**
	 * 获取到处数据列定义.
	 *
	 * @param defCellDef the def cell def
	 * @return the list
	 */
	public List<CellDataType> exportCellDef(List<CellDataType> defCellDef) {
		if ( this.columns != null ) {
			try{
				JSONArray jsonArr = JSONArray.fromObject(this.columns);
				return new ArrayList(JSONArray.toCollection(jsonArr, CellDataType.class));
			} catch ( Exception e) {
				LOG.error("Invalid cell definition in page. ", e);
			}
		}
		return defCellDef;
	}
	
	/**
	 * 获取国际化文件名称
	 * @param type 列定义列表
	 * @return 更新国际化后的列定义列表
	 */
	public List<CellDataType> getLocalName(List<CellDataType> type) {
		if (type == null) {
			return null;
		}
		List<CellDataType> nType = new ArrayList<CellDataType>();
		for (CellDataType cellDataType : type) {
			nType.add(new CellDataType(cellDataType.getPropName(),
					getText(cellDataType.getShowName()), cellDataType
							.getRender	(), cellDataType.getDict()));
		}
		return nType;
	}
	
	/**
	 * Gets the local name.
	 * 
	 * @param resKey
	 *            the res key
	 * 
	 * @return the local name
	 */
	public String[] getLocalName(String[] resKey) {
		if (resKey == null || resKey.length < 1) {
			return resKey;
		}
		String[] colNames = new String[resKey.length];
		int i = 0;
		for (String res : resKey) {
			colNames[i++] = getText(res);
		}
		return colNames;
	}
	
	/**
	 * 验证属性配置是否合法，去除无法获取的字段属性。.
	 * 用于列名来自页面的导出功能（过滤页面传递的无效列名）
	 *
	 * @param fileName 文件名
	 * @param sheetName 工作页名
	 * @param title 工作表标题
	 * @param props 属性
	 * @param data 数据
	 * @param clazz 目标数据类型
	 * @throws Exception 
	 */
	public void safeCheckExportXLS(String fileName, String sheetName, String title, List<CellDataType> props,
			List data, Class clazz) throws Exception {
		List<CellDataType> checkedProps = new ArrayList<CellDataType>();
		if ( clazz != null && props != null) {
			for (CellDataType cdt : props) {
				String propName = cdt.getPropName();
				if ( StringUtils.isBlank(propName) ) {
					LOG.error("Excel export check error: blank property. ", null);
					continue;
				}
				try {
					clazz.getDeclaredField(propName);
					checkedProps.add(cdt);
				} catch (Exception e) {
					// unable to access prop in class
					LOG.error("Excel export check error: property ["+propName+"] cannot be accessed in ["+clazz.getName()+"]"
							,e);
				}
			}
		}
		this.defaultExportXLS(fileName, sheetName, title, checkedProps, data);
	}
	
	/**
	 * 
	 * @param key
	 * @param value
	 */
	public void addRequestAttr(String key, Object value) {
		if ( key != null && value != null ) {
			HttpServletRequest req = ServletActionContext.getRequest();
			req.setAttribute(key, value);
		}
	}
	
	/**
	 * Default export csv.
	 * 默认csv文件导出。
	 * 
	 * @param fileName 文件名
	 * @param props 输出属性
	 * @param data 输出数据
	 * @throws Exception 
	 */
	public String defaultExportCSV(String title, List<String> props,
			ExtData data) throws Exception {
		return this.defaultExportCSV(title, props, data == null ? new ArrayList():data.getRoot());
	}
	
	/**
	 * Default export csv.
	 * 默认csv文件导出。
	 * 
	 * @param fileName 文件名
	 * @param props 输出属性
	 * @param data 输出数据
	 * @throws Exception 
	 */
	public String defaultExportCSV(String fname, List<String> props,
			List data) throws Exception {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		List<String> dataList = new ArrayList<String>();
		try {
			dataList = covertDataListToCSVList(data,props);
		} catch (Exception e) {
			LOG.error("Error write to csv file. ",e);
		}
		CSVUtil.exportCSV(dataList,out);
		this.inputStreamBytes = out.toByteArray();
		csvName(fname);
		return TXT;
	}
	
	/**
	 * 将数据转换成CSV格式。
	 * 
	 * @param data 数据
	 * @param props 输出属性
	 * @throws Exception 
	 */
	private List<String> covertDataListToCSVList (List<Object> data, List<String> props) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		List<String> dataList = new ArrayList<String>();
		for (Object o :data) {
			dataList.add(covertDataToCSVLine(o,props));
		}
		return dataList;
	}
	
	/**
	 * 获取下载的csv文件名
	 * mchnt_yyyyMMdd.csv
	 * @param title
	 * @return
	 */
	protected String csvName(String title) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT2);
		String fnm = String.format("%s_%s.txt", title,sdf.format(new Date()));
		return encodeFileName(fnm);
	}
	
	/**
	 * 将一条数据转换成CSV格式。
	 * 
	 * @param data 数据
	 * @param props 输出属性
	 * @throws Exception 
	 */
	private String covertDataToCSVLine (Object data, List<String> props) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
		List<String> dataLine = new ArrayList<String>();
		for (String prop : props) {
			String value = StringUtils.defaultIfEmpty(BeanUtils.getProperty(data, prop), "");
			value = value.trim();
			dataLine.add(value);
		}
		return CSVUtil.toCSVLine(dataLine);
	}
	
	/**
	 * Default export xls.
	 * 默认excel文件导出。
	 * 
	 * @param fileName 文件名
	 * @throws Exception 
	 */
	public String exportXLS(String fname,ByteArrayOutputStream out) throws Exception {
		this.inputStreamBytes = out.toByteArray();
		xlsName(fname);
		return EXCEL;
	}
	
	/**
	 * Default export xls.
	 * 默认txt文件导出。
	 * 
	 * @param fileName 文件名
	 * @throws Exception 
	 */
	public String exportTXT(String fname,ByteArrayOutputStream out) throws Exception {
		this.inputStreamBytes = out.toByteArray();
		csvName(fname);
		return TXT;
	}
	
	// 替换word中需要替换的特殊字符
    public boolean replaceAndGenerateWord(InputStream is,Map<String, String> map) {
        try {
            XWPFDocument document = new XWPFDocument(is);
            // 替换段落中的指定文字
            Iterator<XWPFParagraph> itPara = document
                    .getParagraphsIterator();
            while (itPara.hasNext()) {
                XWPFParagraph paragraph = (XWPFParagraph) itPara.next();
                List<XWPFRun> runs = paragraph.getRuns();
                for (int i = 0; i < runs.size(); i++) {
                    String oneparaString = runs.get(i).getText(
                            runs.get(i).getTextPosition());
                    if(oneparaString!=null){
                    for (Map.Entry<String, String> entry : map
                            .entrySet()) {
                        oneparaString = oneparaString.replace(
                                entry.getKey(), entry.getValue());
                    	}
                    }
                    runs.get(i).setText(oneparaString, 0);
                }
            }
            // 替换表格中的指定文字
            Iterator<XWPFTable> itTable = document.getTablesIterator();
            while (itTable.hasNext()) {
                XWPFTable table = (XWPFTable) itTable.next();
                int rcount = table.getNumberOfRows();
                for (int i = 0; i < rcount; i++) {
                    XWPFTableRow row = table.getRow(i);
                    List<XWPFTableCell> cells = row.getTableCells();
                    for (XWPFTableCell cell : cells) {
                        String cellTextString = cell.getText();
                        for (Entry<String, String> e : map.entrySet()) {
                            if (cellTextString.contains(e.getKey()))
                                cellTextString = cellTextString.replace(e.getKey(),e.getValue());
                        }
                        cell.removeParagraph(0);
                        cell.setText(cellTextString);
                    }
                }
            }
            ByteArrayOutputStream outStream = new ByteArrayOutputStream();
            document.write(outStream);
            this.inputStreamBytes=outStream.toByteArray();
            //setFileSize(this.inputStreamBytes.length);
            outStream.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } 
    }
    
    /**
	 * @param sourceData
	 * @param listProp
	 * @param sheetsName
	 * @return
	 * @throws IOException
	 */
	public <T> String exportMulitSheetXLS(Map<String, List<T>> sourceData , List<Map<String, String[]>> listProp ,String[] sheetsName) throws IOException {
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		//初始化WorkBook
		HSSFWorkbook work = new HSSFWorkbook();
		
		if(null == sourceData || sourceData.isEmpty() || sourceData.size() <= 0){
			LOGGER.info("数据为空，不做Excel导出处理");
			return null;
		}

		try {
			LOGGER.info("Step6: 数据准备完毕，开始组装Excel");
			DefaultHSSOutput.outputTitledXLS(work, sourceData, listProp, sheetsName, null, out);
		} catch (Exception e) {
			LOG.error("Output XLS error: ", e);
			return null;
		}
		LOGGER.info("Step10: 数据写入完毕，准备转化为IO流");
		inputStreamBytes = out.toByteArray();
		String fileName= xlsName(ExcelFileName);
		LOGGER.info("Step11: 操作完毕，Excel文件名称为： " + fileName);
		return EXCEL;
	}
	
	/**
	 * 设置 导出文件名.
	 *
	 * @param fileName the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getJsonObject() {
		return jsonObject;
	}
	public void setJsonObject(String jsonObject) {
		this.jsonObject = jsonObject;
	}
	public void setResData(String resData) {
		this.resData = resData;
	}


	public String getDir() {
		return dir;
	}


	public void setDir(String dir) {
		this.dir = dir;
	}


	public String getLimit() {
		return limit;
	}


	public void setLimit(String limit) {
		this.limit = limit;
	}


	public String getSort() {
		return sort;
	}


	public void setSort(String sort) {
		this.sort = sort;
	}


	public String getStart() {
		return start;
	}


	public void setStart(String start) {
		this.start = start;
	}

	
	public String getDownFilename() {
		try {
			return URLEncoder.encode(downFilename, "UTF-8");

		} catch (Exception e) {
			return null;
		}
	}

    public void setDownFilename(String downFilename) {
        this.downFilename = downFilename;
    }

    /**
	 * 取得session
	 * 
	 * @return
	 */
	public Map<String, Object> getSession() {
		return ServletActionContext.getContext().getSession();
	}

	/**
	 * 取得Request
	 * 
	 * @return
	 */
	public HttpServletRequest getRequest() {
		return ServletActionContext.getRequest();
	}
	
	/**
	 * 获取HTTP请求参数值
	 * @param paramName 参数名称
	 * @return
	 */
	public String reqParam(String paramName) {
		return getRequest().getParameter(paramName);
	}
	

	/**
	 * 取得Response
	 * 
	 * @return
	 */
	public HttpServletResponse getResponse() {
		return (HttpServletResponse) ServletActionContext.getContext().get(
				ServletActionContext.HTTP_RESPONSE);
	}

	/**
	 * 取得application
	 * 
	 * @return
	 */
	public Map<String, Object> getApplication() {
		return ServletActionContext.getContext().getApplication();
	}

	/**
	 * 取得Parameters
	 * 
	 * @return
	 */
	public Map<String, Object> getParameters() {
		return ServletActionContext.getContext().getParameters();
	}
	
	public String getJsonArray() {
		return jsonArray;
	}


	public void setJsonArray(String jsonArray) {
		this.jsonArray = jsonArray;
	}


	public String getColumns() {
		return columns;
	}


	public void setColumns(String columns) {
		this.columns = columns;
	}


	public String getFileName() {
		return fileName;
	}

	/**
	 * @param inputStreamBytes the inputStreamBytes to set
	 */
	public void setInputStreamBytes(byte[] inputStreamBytes) {
		this.inputStreamBytes = inputStreamBytes;
	}
}
