package com.jiuyv.yl.console.security.filter;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.jiuyv.common.web.filter.ResponseHeaderFilter;
import com.jiuyv.yl.console.security.entity.IMedia;
import com.jiuyv.yl.console.security.service.IMediaSupportService;

/**
 * The Class AttachFilter.
 * 附件访问过滤器
 * @author 
 * @see ResponseHeaderFilter
 */
public class AttachFilter implements Filter {
	
	/** Logger for this class. */
	private static final Logger LOGGER = LoggerFactory
			.getLogger(AttachFilter.class);

	/**  过滤器参数配置. */
	private Map<String, String> responseConfig;

	/**  默认的MIME类型. */
	private Map<String, String> mimeType;

	/**  资源获取类型. */
	private IMediaSupportService mediaService;

	
	// 进件文件 /attach/00000000000867_in_bizlic_12345678.jpg
	// 修改文件 /attach/85429005411001_upd_bizlic_12345678.jpg
	/**
	 * Do filter.
	 * 
	 * @param servletRequest the servlet request
	 * @param servletResponse the servlet response
	 * @param chain the chain
	 * @throws IOException Signals that an I/O exception has occurred.
	 * @throws ServletException the servlet exception
	 * @see javax.servlet.Filter#doFilter(javax.servlet.ServletRequest,
	 *      javax.servlet.ServletResponse, javax.servlet.FilterChain)
	 */
	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		// set response cache head info
		if (responseConfig != null) {
			for (Entry<String, String> entry : responseConfig.entrySet()) {
				response.addHeader(entry.getKey(), entry.getValue());
			}
		}
		String filePath = request.getRequestURI().substring(
				request.getContextPath().length() + 1);
		if (!filePath.startsWith("/")) {
			filePath = "/" + filePath;
		}
		String fpTmp = filePath.replace("/attach/", "");
		fpTmp = fpTmp.substring(0, fpTmp.lastIndexOf("."));
		String[] fpArr = fpTmp.split("_");
		if ( fpArr.length != 4 ) {
			response.sendError(404);
			LOGGER.error("Invalid Attach Url: " + filePath);
			return;
		}
		// load with media service
		// if url = xxxx?show=thumbnail
		String fileType = request.getParameter("show");
		String refNo = fpArr[0];
		String type = fpArr[1];
		String medSeq = fpArr[3];
		
		IMedia media = mediaService.findAttach(medSeq, refNo, fileType);
		if (media == null) {
			response.sendError(404);
			LOGGER.error("File Not Found: " + filePath);
			return;
		}
		// get content type for file.
		response.setContentType(media.getContentType());
		String encode = media.getEncode();
		if (encode != null) {
			response.setCharacterEncoding(encode);
		}
		OutputStream os = response.getOutputStream();
		byte[] content = media.getContent();
		try {
			os.write(content);
			os.flush();
		} catch (IOException e) {
			LOGGER.info("Client Abort. ");
		} catch (Exception e) {
			LOGGER.error("Error occur in write media files. ", e);
		} finally {
			IOUtils.closeQuietly(os);
		}

	}

	/**
	 * 初始化.
	 *
	 * @param filterConfig the filter config
	 * @throws ServletException the servlet exception
	 * @see javax.servlet.Filter#init(javax.servlet.FilterConfig)
	 */
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	/**
	 * Destroy.
	 *
	 * @see javax.servlet.Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * Sets the 过滤器参数配置.
	 *
	 * @param responseConfig            the responseConfig to set
	 */
	public void setResponseConfig(Map<String, String> responseConfig) {
		this.responseConfig = responseConfig;
	}

	/**
	 * Sets the 默认的MIME类型.
	 *
	 * @param mimeType            the mimeType to set
	 */
	public void setMimeType(Map<String, String> mimeType) {
		this.mimeType = mimeType;
	}

	/**
	 * Sets the 资源获取类型.
	 *
	 * @param mediaService            the mediaService to set
	 */
	public void setMediaService(IMediaSupportService mediaService) {
		this.mediaService = mediaService;
	}
	
}
