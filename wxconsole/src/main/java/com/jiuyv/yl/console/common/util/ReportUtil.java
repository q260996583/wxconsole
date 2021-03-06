package com.jiuyv.yl.console.common.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRExporterParameter;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.export.JExcelApiExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.export.JRPdfExporter;
import net.sf.jasperreports.engine.export.JRRtfExporter;
import net.sf.jasperreports.engine.export.JRXlsExporter;
import net.sf.jasperreports.engine.export.JRXlsExporterParameter;
import net.sf.jasperreports.j2ee.servlets.ImageServlet;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

// TODO: Auto-generated Javadoc
/**
 * 这个类用来做jasperReport报表的导出.
 */
public class ReportUtil {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ReportUtil.class);
	
	private static InputStream getIns(String path) {
		return ReportUtil.class.getClassLoader().getResourceAsStream(path);
	}
	
	private static String characterEncoding = "UTF-8";
	
	/**
	 * 导出报表excel.
	 * 
	 * @param path jasper文件路径
	 * @param parameters jasper文件参数
	 * @param list the 绑定的javabean的数据集合
	 * 
	 * @throws Exception the exception
	 */
	public static InputStream reportExcel(String path,Map parameters,List list) throws Exception{
		InputStream ins = new ReportUtil().getClass().getClassLoader().getResourceAsStream(path);
		if ( ins == null ) {
        	return null;
        }
        JasperPrint jasperPrint = null;
        synchronized(ins) {
        	jasperPrint = JasperFillManager.fillReport(ins, parameters, new JRBeanCollectionDataSource(list));
        }
//	
		ByteArrayOutputStream out=new ByteArrayOutputStream();
		JExcelApiExporter exporter = new JExcelApiExporter();
		exporter.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE,Boolean.TRUE); 
		exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint); 
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
		exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
		exporter.setParameter(JRXlsExporterParameter.IS_COLLAPSE_ROW_SPAN, Boolean.FALSE);
		exporter.exportReport();
		return new ByteArrayInputStream(out.toByteArray());
	
	}
	
	/**
	 * 导出报表excel.
	 * 
	 * @param path
	 *            jasper文件路径
	 * @param parameters
	 *            jasper文件参数
	 * @param list
	 *            the 绑定的javabean的数据集合
	 * 
	 * @throws Exception
	 *             the exception
	 */
	public static void reportNewExcel(String path, Map parameters, List list,String fileName)
			throws Exception {
		InputStream ins = getIns(path);
		if (ins == null) {
			return;
		}
		JasperPrint jasperPrint = null;
		synchronized (ins) {
			jasperPrint = JasperFillManager.fillReport(ins, parameters,
					new JRBeanCollectionDataSource(list));
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/vnd.ms-excel");
		response.setCharacterEncoding(characterEncoding);
		String exportFileName = StringUtils.defaultIfEmpty(fileName, "report");
		if (!WebRequestUtil.getBrowser(ServletActionContext.getRequest()).equals("FF")) {
			exportFileName = URLEncoder.encode(fileName, "UTF-8");
		} else {
			// firefox
			exportFileName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
		}
		response.addHeader("Content-Disposition",
				"attachment; filename="+exportFileName+".xls");
		OutputStream out = response.getOutputStream();
		JExcelApiExporter exporter = new JExcelApiExporter();
		exporter.setParameter(JRXlsExporterParameter.IS_DETECT_CELL_TYPE,Boolean.TRUE); 
		exporter.setParameter(JRXlsExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.FALSE);
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint); 
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
		exporter.setParameter(JRXlsExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS, Boolean.TRUE);
		exporter.setParameter(JRXlsExporterParameter.IS_COLLAPSE_ROW_SPAN, Boolean.FALSE);
		exporter.exportReport();
		out.flush();
		out.close();
		ins.close();
	}
	
	
	/**
	 * 导出报表 pdf.
	 * 
	 * @param path jasper文件路径
	 * @param parameters jasper文件需要的参数
	 * @param list the 绑定的javabean的数据集合
	 * 
	 * @throws Exception the exception
	 */
	public static void reportPdf(String path,Map parameters,List list) throws Exception{
		InputStream ins = new ReportUtil().getClass().getClassLoader().getResourceAsStream(path);
		if ( ins == null ) {
        	return ;
        }
        JasperPrint jasperPrint = null;
        synchronized(ins) {
        	jasperPrint = JasperFillManager.fillReport(ins, parameters, new JRBeanCollectionDataSource(list));
        }
//        JasperPrint jasperPrint = JasperFillManager.fillReport(ins, parameters, new JRBeanCollectionDataSource(list));
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/pdf");
		response.setCharacterEncoding("UTF-8");
		response.addHeader("Content-Disposition","attachment; filename=report.pdf");
		// IE bug fixed
	    response.setHeader("Pragma", "public"); 
	    response.setHeader("Cache-Control", "max-age=30" );
	    
		OutputStream out = response.getOutputStream();
		JRPdfExporter exporter = new JRPdfExporter();
		exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING, "UniGB-UCS2-H");
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
		exporter.exportReport();
		out.flush();
		out.close();
		if(ins != null){
        	ins.close();
        }
	}
	/**
	 * 导出Word.
	 * 
	 * @param path the jasper文件路径
	 * @param parameters jasper参数
	 * @param list the 绑定的javabean的数据集合
	 * 
	 * @throws Exception the exception
	 */
	public static void reportWord(String path,Map parameters,List list) throws Exception{
		InputStream ins = new ReportUtil().getClass().getClassLoader().getResourceAsStream(path);
		if ( ins == null ) {
        	return ;
        }
        JasperPrint jasperPrint = null;
        synchronized(ins) {
        	jasperPrint = JasperFillManager.fillReport(ins, parameters, new JRBeanCollectionDataSource(list));
        }
//		JasperPrint jasperPrint = JasperFillManager.fillReport(ins, parameters, new JRBeanCollectionDataSource(list));
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/rtf");
		response.setCharacterEncoding("UTF-8");
		response.addHeader("Content-Disposition","attachment; filename=report.rtf");
		// IE bug fixed
	    response.setHeader("Pragma", "public"); 
	    response.setHeader("Cache-Control", "max-age=30" );
		
		OutputStream out = response.getOutputStream();
		JRRtfExporter exporter = new JRRtfExporter();
		exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING, "UniGB-UCS2-H");
		exporter.setParameter(JRExporterParameter.JASPER_PRINT, jasperPrint);
		exporter.setParameter(JRExporterParameter.OUTPUT_STREAM, out);
		exporter.exportReport();
		out.flush();
		out.close();
		if(ins != null){
        	ins.close();
        }
	}
	
	/**
	 * 导出HTML.
	 * 
	 * @param path the jasper文件路径
	 * @param parameters jasper参数
	 * @param list the 绑定的javabean的数据集合
	 * 
	 * @throws Exception the exception
	 */
	public static void reportHtml(String path,Map parameters,List list) throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        // IE bug fixed
	    response.setHeader("Pragma", "public"); 
	    response.setHeader("Cache-Control", "max-age=30" );
        HttpServletRequest request = ServletActionContext.getRequest();
        PrintWriter out = response.getWriter();
        InputStream ins = new ReportUtil().getClass().getClassLoader().getResourceAsStream(path);
        if ( ins == null ) {
        	return ;
        }
        JasperPrint jasperPrint = null;
        synchronized(ins) {
        	jasperPrint = JasperFillManager.fillReport(ins, parameters, new JRBeanCollectionDataSource(list));
        }
        JRHtmlExporter exporter = new JRHtmlExporter();
        exporter.setParameter(JRHtmlExporterParameter.BETWEEN_PAGES_HTML,"<HR>");
        exporter.setParameter(JRHtmlExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.TRUE);
        
        request.getSession().setAttribute(   
                ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE,   
                jasperPrint);   
        exporter.setParameter(JRExporterParameter.JASPER_PRINT,   
                jasperPrint);   
        exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);   
        exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,   
                "./imageForJasper?image=");   
        exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING,   
                "UTF-8");
        exporter.setParameter(   
                JRHtmlExporterParameter.BETWEEN_PAGES_HTML, "<HR>");   
        exporter   
                .setParameter(   
                        JRHtmlExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,   
                        Boolean.TRUE);   
        exporter.setParameter(JRHtmlExporterParameter.SIZE_UNIT, "pt");
        //增加参数，导出html时文字过长，自动换行
        exporter.setParameter(JRHtmlExporterParameter.IS_WRAP_BREAK_WORD, Boolean.TRUE);
        
        exporter.exportReport();
        if (out != null) {   
            try {   
            	out.flush();
                out.close();   
            } catch (Exception e) {   
            	LOGGER.error("", e);
            }//end of try catch
        }//end of if ...
        if(ins != null){
        	ins.close();
        }
	}//end of function
	
	
	/**
	 * 导出html,去掉一些自动去空格的参数
	 * 
	 * @param path the path
	 * @param parameters the parameters
	 * @param list the list
	 * 
	 * @throws Exception the exception
	 */
	public static void reportNewHtml(String path,Map parameters,List list) throws Exception{
		HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");
        // IE bug fixed
	    response.setHeader("Pragma", "public"); 
	    response.setHeader("Cache-Control", "max-age=30" );
        HttpServletRequest request = ServletActionContext.getRequest();
        PrintWriter out = response.getWriter();
        InputStream ins = new ReportUtil().getClass().getClassLoader().getResourceAsStream(path);
        if ( ins == null ) {
        	return ;
        }
        JasperPrint jasperPrint = null;
        synchronized(ins) {
        	jasperPrint = JasperFillManager.fillReport(ins, parameters, new JRBeanCollectionDataSource(list));
        }
//        JasperPrint jasperPrint = JasperFillManager.fillReport(ins, parameters, new JRBeanCollectionDataSource(list));
        JRHtmlExporter exporter = new JRHtmlExporter();
//        exporter.setParameter(JRHtmlExporterParameter.BETWEEN_PAGES_HTML,"<HR>");
//        exporter.setParameter(JRHtmlExporterParameter.IS_WHITE_PAGE_BACKGROUND, Boolean.TRUE);
        
        request.getSession().setAttribute(   
                ImageServlet.DEFAULT_JASPER_PRINT_SESSION_ATTRIBUTE,   
                jasperPrint);   
        exporter.setParameter(JRExporterParameter.JASPER_PRINT,   
                jasperPrint);   
        exporter.setParameter(JRExporterParameter.OUTPUT_WRITER, out);   
        exporter.setParameter(JRHtmlExporterParameter.IMAGES_URI,   
                "./imageForJasper?image=");   
        exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING,   
                "UTF-8");
//        exporter.setParameter(   
//                JRHtmlExporterParameter.BETWEEN_PAGES_HTML, "<HR>");   
//        exporter   
//                .setParameter(   
//                        JRHtmlExporterParameter.IS_REMOVE_EMPTY_SPACE_BETWEEN_ROWS,   
//                        Boolean.TRUE);   
        exporter.setParameter(JRHtmlExporterParameter.SIZE_UNIT, "pt");
        //增加参数，导出html时文字过长，自动换行
        exporter.setParameter(JRHtmlExporterParameter.IS_WRAP_BREAK_WORD, Boolean.TRUE);
        
        exporter.exportReport();
        if (out != null) {   
            try {   
            	out.flush();
                out.close();   
            } catch (Exception e) {   
            	LOGGER.error("", e);
            }//end of try catch
        }//end of if ...
        if(ins != null){
        	ins.close();
        }
	}//end of function
	
}//end of class
