package com.jiuyv.common.execl.input;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The Class DefaultXlsReader.
 * 默认的XLS文件读取
 * 
 * @author 
 * @version 1.0.0
 * @since 2016-4-22
 * @company Shanghai JiuYv Software Systems CO.,LTD.
 */
public abstract class DefaultXlsReader {
	
	/** Logger */
	private static final Logger LOGGER = LoggerFactory.getLogger(DefaultXlsReader.class);

	/**
	 * 读取xls行转换为对象列表.
	 *
	 * @param <T> 对象类型
	 * @param file 输入文件 xls
	 * @param handler 逐行处理转换
	 * @param startRow 起始行记录，从0开始。0:从第一行开始读取,1:从第二行开始读取 ... 
	 * @return 对象列表
	 * @throws Exception the exception
	 */
	public static <T> List<T> readListInXlsFile(File file, XlsReaderRowHandler<T> handler, int startRow) {
		List<T> list = new ArrayList<T>();
		if (file == null) {
			LOGGER.error("Input File is null. ");
			return list;
		}
		Workbook wb;
		try {
			wb = WorkbookFactory.create(new FileInputStream(file));
			// 使用通用api读取记录数据(xls和xlsx)
			readSheet(wb.getSheetAt(0), list, handler, startRow);
		} catch (InvalidFormatException e) {
			LOGGER.error("readListInXlsFile failed. ", e);
		} catch (FileNotFoundException e) {
			LOGGER.error("readListInXlsFile failed. ", e);
		} catch (IOException e) {
			LOGGER.error("readListInXlsFile failed. ", e);
		}
		return list;
	}
	
	/**
	 * 读取Excel文件内容
	 * 
	 * @param sheet
	 * @param list
	 * @param handler
	 * @param startRow
	 */
	public static <T> void readSheet(Sheet sheet, List<T> list, XlsReaderRowHandler<T> handler, int startRow) {
		int rowIdx = 0;
		List<T> result = list == null ? new ArrayList<T>():list;
		Iterator<Row> rowIter = sheet.rowIterator();
		while( rowIter.hasNext()) {
			Row row = rowIter.next();
			if ( rowIdx >= startRow ) {
				// process row 
				Iterator<Cell> cellIter = row.cellIterator();
				List<Object> cellObject = new ArrayList<Object>();
				while ( cellIter.hasNext() ) {
					Cell cell = cellIter.next();
					switch (cell.getCellType()) {  
                    case Cell.CELL_TYPE_NUMERIC: // 数字  
                    	cellObject.add(Double.valueOf(cell.getNumericCellValue()));
                        break;  
                    case Cell.CELL_TYPE_STRING: // 字符串  
                    	cellObject.add(cell.getStringCellValue());
                        break;  
                    case Cell.CELL_TYPE_BOOLEAN: // Boolean 
                    	cellObject.add(Boolean.valueOf(cell.getBooleanCellValue()));
                        break;  
                    case Cell.CELL_TYPE_FORMULA: // 公式  
                    	cellObject.add(cell.getCellFormula());
                        break;  
                    case Cell.CELL_TYPE_BLANK: // 空值  
                    case Cell.CELL_TYPE_ERROR: // 故障  
                    default:  
                    	cellObject.add(cell.getRichStringCellValue().getString());
                        break;  
                    }
				}
				T obj = handler.process(cellObject, rowIdx, row);
				if ( obj != null ) {
					result.add(obj);
				}
			} else {
				LOGGER.info("Skip read row["+rowIdx+"]");
			}
			rowIdx ++ ;
		}
	}
	
}
