package com.jiuyv.common.execl;

import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * The Class DefaultHSSOutput.
 */
public final class DefaultHSSOutput {

	/** Logger for this class. */
	private static final Logger LOGGER = LoggerFactory
			.getLogger(DefaultHSSOutput.class);

	/** The Constant DEFAULT_TTL. */
	private static final String DEFAULT_TTL = "sheet_1";

	/** 常量: FONT_HEIGHT_18. */
	private static final short FONT_HEIGHT_12 = 12;

	/** 常量: FONT_COURIER. */
	private static final String FONT_COURIER = "Courier New";

	private DefaultHSSOutput() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * Output xls.
	 * 
	 * @param title
	 *            the title
	 * @param data
	 *            the data
	 * @param os
	 *            the os
	 * @param propNames
	 *            the prop names
	 * @param colNames
	 *            the col names
	 * @throws Exception
	 */
	public static <T> void outputSimpleXLS(String title, List<T> data,
			String[] propNames, String[] colNames, OutputStream os)
			throws Exception {
		// create work book
		HSSFWorkbook work = new HSSFWorkbook();
		// create sheet
		HSSFSheet sheet = work.createSheet(title == null ? DEFAULT_TTL : title);
		// create head
		createHead((short) 0, sheet, colNames, getHeadStyle(work));
		// create data
		createData((short) 1, sheet, propNames, data, null);
		// write to file
		write2File(work, os);
	}

	/**
	 * Output titled xls.
	 * 
	 * @param meta
	 *            the meta
	 * @param data
	 *            the data
	 * @param propNames
	 *            the prop names
	 * @param colNames
	 *            the col names
	 * @param os
	 *            the os
	 * @throws Exception
	 */
	public static <T> void outputTitledXLS(Map<String, String> meta, List<T> data,
			String[] propNames, String[] colNames, OutputStream os)
			throws Exception {
		// create work book
		HSSFWorkbook work = new HSSFWorkbook();
		// create sheet
		String title = meta.get("title");
		String sheetName = meta.get("sheet");
		HSSFSheet sheet = work
				.createSheet(sheetName == null ? (title == null ? DEFAULT_TTL
						: title) : sheetName);
		// create title
		createTitle((short) 0, sheet, title, (short) propNames.length, null);
		// create head
		createHead((short) 2, sheet, colNames, getHeadStyle(work));
		// create data
		createData((short) 3, sheet, propNames, data, null);
		// write to file
		write2File(work, os);
	}

	/**
	 * @param work         HSSFWorkbook
	 * @param sourceData   Map对象，key为index，方便循环获取数据源
	 * @param listProp     List对象包含Map对象，包含数据源列名、显示列名
	 * @param sheetsName   sheet名称
	 * @param titles       title名称
	 * @param os
	 * @throws Exception
	 */
	public static <T> void outputTitledXLS(HSSFWorkbook work, Map<String, List<T>> sourceData,
			List<Map<String, String[]>> listProp, String[] sheetsName, String[] titles, 
			OutputStream os) throws Exception {
		if(null != listProp && listProp.size() > 0){
			//是否存在多个sheet
			if(null != sheetsName && sheetsName.length > 0){
				for(int index = 0; index < sheetsName.length; index++){
					//数据源列
					LOGGER.info("Step7: 依次获取属性文件");
					String[] propNames = listProp.get(index).get("propNames");
					//列名
					String[] colNames = listProp.get(index).get("colNames");
					HSSFSheet sheet = work.createSheet(sheetsName[index] == null ? DEFAULT_TTL : sheetsName[index]);
					LOGGER.info("属性文件： 数据源列propNames= " + propNames);
					LOGGER.info("属性文件： 数据源列colNames= " + colNames);
					LOGGER.info("属性文件： 数据源列sheetsName= " + sheetsName[index]);
					if(null == titles || titles.length <= 0){
						componentExcel(work,sheet,sourceData.get(String.valueOf(index)),propNames,colNames,null,os);
					}else{
						componentExcel(work,sheet,sourceData.get(String.valueOf(index)),propNames,colNames,titles[index],os);
					}
				}
				// write to file
				write2File(work, os);
				LOGGER.info("Step9: 写入Excel文件完成");
			}
		}
	}
	
	/**
	 * @Method Desc: 组装Excel写入步骤
	 * @param work
	 * @param sheet       sheet
	 * @param data        每个sheet分配一个data
	 * @param propNames   数据源列
	 * @param colNames    列名
	 * @param title       title
	 * @param os
	 * @throws Exception
	 */
	private static <T> void componentExcel(HSSFWorkbook work, HSSFSheet sheet, List<T> data, String[] propNames,
			String[] colNames, String title, OutputStream os) throws Exception {
		LOGGER.info("Step8: 依次构造title，Head，Data");
		sheet.setDefaultColumnWidth(21);
		// create title
		if(!StringUtils.isBlank(title)){
			createTitle((short) 0, sheet, title, (short) propNames.length, null);
		}
		// create head
		createHead((short) 1, sheet, colNames, getHeadStyle(work));
		// create data
		createData((short) 2, sheet, propNames, data, getDataStyle(work));
		LOGGER.info("Step9: 将构造数据写入文件");
	}
	
	/**
	 * Write2 file.
	 * 
	 * @param work
	 *            the work
	 * @param os
	 *            the os
	 * 
	 * @throws IOException
	 *             Signals that an I/O exception has occurred.
	 */
	private static void write2File(HSSFWorkbook work, OutputStream os)
			throws IOException {
		if (os != null && work != null) {
			try {
				work.write(os);
				os.flush();
			} catch (IOException e) {
				LOGGER.error("Invalid output write! ");
				throw e;
			} finally {
				os.close();
			}
		}
	}

	/**
	 * Creates the title.
	 * 
	 * @param rowNum
	 *            the row num
	 * @param sheet
	 *            the sheet
	 * @param title
	 *            the title
	 * @param cols
	 *            the cols
	 * @param style
	 *            the style
	 */
	public static void createTitle(short rowNum, HSSFSheet sheet, String title,
			short cols, HSSFCellStyle style) {
		HSSFRow row = sheet.createRow(rowNum);
		HSSFCell cell = row.createCell(0);
		cell.setCellValue(new HSSFRichTextString(title));
		if (style != null) {
			cell.setCellStyle(style);
		}
		sheet.addMergedRegion(new CellRangeAddress(rowNum, rowNum, 0, cols <= 0 ? 0 :  (cols - 1)));
	}

	/**
	 * Creates the pagehead.
	 * 
	 * @param rowNum
	 *            the row num
	 * @param sheet
	 *            the sheet
	 * @param user
	 *            the user
	 * @param time
	 *            the time
	 * @param cols
	 *            the cols
	 * @param style
	 *            the style
	 */
	public static void createPagehead(short rowNum, HSSFSheet sheet,
			String user, String time, int cols, HSSFCellStyle style) {
		HSSFRow row = sheet.createRow(rowNum);
		HSSFCell lCell = row.createCell(0);
		HSSFCell rCell = row.createCell(cols <= 1? 1:(cols - 1));

		lCell.setCellValue(new HSSFRichTextString(user));
		rCell.setCellValue(new HSSFRichTextString(time));

		if (style != null) {
			lCell.setCellStyle(style);
			rCell.setCellStyle(style);
		}
	}

	/**
	 * Creates the data.
	 * 
	 * @param startRow
	 *            the start row
	 * @param sheet
	 *            the sheet
	 * @param propNames
	 *            the prop names
	 * @param data
	 *            the data
	 * @param style
	 *            the style
	 * @throws Exception
	 */
	private static <T> void createData(short startRow, HSSFSheet sheet,
			String[] propNames, List<T> data, HSSFCellStyle style)
			throws Exception {
		if (data == null) {
			return;
		}
		short rowNum = startRow;
		for (Object tData : data) {
			HSSFRow row = sheet.createRow(rowNum++);
			int colNum = 0;
			for (String propName : propNames) {
				HSSFCell cell = row.createCell(colNum++);
				try {
					Field field = tData.getClass().getDeclaredField(propName);
					field.setAccessible(true);
					Object value = field.get(tData);
					if (value == null) {
						continue;
					}
					if (style != null) {
						cell.setCellStyle(style);
					}
					if (value instanceof Long || value instanceof Integer) {
						cell.setCellValue((Long) value);
					} else {
						cell.setCellValue(new HSSFRichTextString(value
								.toString()));
					}
				} catch (Exception e) {
					LOGGER.error("Invalid Access to Object! " + e);
					throw e;
				}
			}
		}
	}

	/**
	 * Creates the head.
	 * 
	 * @param headRow
	 *            the head row
	 * @param sheet
	 *            the sheet
	 * @param headStyle
	 *            the head style
	 * @param colName
	 *            the col name
	 */
	private static void createHead(short headRow, HSSFSheet sheet,
			String[] colName, HSSFCellStyle headStyle) {
		if (colName == null) {
			return;
		}

		HSSFRow row = sheet.createRow(headRow);
		int col = 0;
		for (String colt : colName) {
			HSSFCell cell = row.createCell(col++, HSSFCell.CELL_TYPE_STRING);
			cell.setCellValue(new HSSFRichTextString(colt));
			if (headStyle != null) {
				cell.setCellStyle(headStyle);
			}
		}
	}

	/**
	 * Gets the head style.
	 * 
	 * @param work
	 *            the work
	 * 
	 * @return the head style
	 */
	private static HSSFCellStyle getHeadStyle(HSSFWorkbook work) {
		if (work == null) {
			return null;
		}
		HSSFCellStyle style = work.createCellStyle();
		HSSFFont font = work.createFont();
		style.setFont(font);
		// align center
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		font.setFontHeightInPoints(FONT_HEIGHT_12);
		font.setFontName(FONT_COURIER);

		return style;
	}
	
	/**
	 * @Method Desc： 设置列的style
	 * @param work
	 * @return
	 */
	private static HSSFCellStyle getDataStyle(HSSFWorkbook work) {
		if (work == null) {
			return null;
		}
		HSSFCellStyle style = work.createCellStyle();
		HSSFFont font = work.createFont();
		style.setFont(font);
		// align left
		style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		style.setWrapText(true);
		font.setFontName(FONT_COURIER);

		return style;
	}

}
