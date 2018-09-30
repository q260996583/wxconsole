package com.jiuyv.common.execl.input;

import java.util.List;

import org.apache.poi.ss.usermodel.Row;


/**
 * The Interface XlsReaderRowHandler.
 * 逐行处理接口
 *
 * @author 
 * @version 1.0.0
 * @param <T> the generic type
 * @since 2016-4-22
 * @company Shanghai JiuYv Software Systems CO.,LTD.
 */
public interface XlsReaderRowHandler<T> {

	/**
	 * 处理对象数据
	 * @param cellObject
	 * @param rowIdx
	 * @param row
	 * @return
	 */
	T process(List<Object> cellObject, int rowIdx, Row row);

}
