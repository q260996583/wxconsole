package com.jiuyv.common.execl;

import java.util.HashMap;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CellStyle;

/**
 * A factory for creating DefaultCellStyle objects.
 */
public final class DefaultCellStyleFactory {

	/** 常量: FONT_BODY. */
	private static final short FONT_BODY = 10;

	/** 常量: FONT_TITLE. */
	private static final short FONT_TITLE = 14;

	/** 常量: FONT_SUB. */
	private static final short FONT_SUB = 10;

	/** 常量: FONT_COURIER. */
	private static final String FONT_COURIER = "Arial Unicode MS";

	private DefaultCellStyleFactory() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * 创建渲染用的样式
	 * @param wb
	 * @return
	 */
	public static Map<String, HSSFCellStyle> createStyles(HSSFWorkbook wb){
        Map<String, HSSFCellStyle> styles = new HashMap<String, HSSFCellStyle>();
        styles.put("headStyle", getHeadStyle(wb));
        styles.put("titleStyle", getTitleStyle(wb));
        styles.put("bodyStyle", getBodyStyle(wb));
        styles.put("subTitleStyle", getSubTitleStyle(wb));
        
        HSSFDataFormat dataFormat = wb.createDataFormat();
        HSSFCellStyle style1 = getBodyStyle(wb);
		style1.setDataFormat(dataFormat.getFormat("yyyy/mm/dd"));
        styles.put("dateStyle", style1);
        
        HSSFCellStyle style2 = getBodyStyle(wb);
		style2.setDataFormat(dataFormat.getFormat("yyyy/mm/dd hh:mm"));
        styles.put("timeStyle", style2);

        HSSFCellStyle style3 = getBodyStyle(wb);
        style3.setDataFormat(dataFormat.getFormat("#,##0.00"));
        style3.setAlignment(CellStyle.ALIGN_RIGHT);
        styles.put("moneyStyle", style3);
        
        HSSFCellStyle style4 = getBodyStyle(wb);
        style4.setAlignment(CellStyle.ALIGN_RIGHT);
        styles.put("rateStyle", style4);
        
        HSSFCellStyle style5 = getBodyStyle(wb);
        style5.setAlignment(CellStyle.ALIGN_RIGHT);
        style5.setDataFormat(dataFormat.getFormat("0.00%"));
        styles.put("percentStyle", style5);
        
        HSSFCellStyle style6 = getBodyStyle(wb);
        style6.setAlignment(CellStyle.ALIGN_RIGHT);
        style6.setDataFormat(dataFormat.getFormat("0.000%"));
        styles.put("rate3Style", style6);
        
        HSSFCellStyle style7 = getBodyStyle(wb);
		style7.setDataFormat(dataFormat.getFormat("mm/dd"));
        styles.put("date4Style", style7);
        
        HSSFCellStyle style8 = getBodyStyle(wb);
        style8.setDataFormat(dataFormat.getFormat("mm/dd hh:mm"));
        styles.put("time10Style", style8);
        
        HSSFCellStyle style9 = getBodyStyle(wb);
        style9.setAlignment(CellStyle.ALIGN_RIGHT);
        style9.setDataFormat(dataFormat.getFormat("0.0000%"));
        styles.put("rate4Style", style9);
        
        return styles;
    }
	
	/**
	 * Gets the head style.
	 * 
	 * @param work
	 *            the work
	 * 
	 * @return the head style
	 */
	public static HSSFCellStyle getHeadStyle(HSSFWorkbook work) {
		if (work == null) {
			return null;
		}
		HSSFCellStyle style = work.createCellStyle();
		HSSFFont font = work.createFont();
		style.setFont(font);
		// align center
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		font.setFontHeightInPoints(FONT_BODY);
		font.setFontName(FONT_COURIER);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		addBorder(style, HSSFCellStyle.BORDER_THIN, HSSFColor.BLACK.index);

		return style;
	}

	/**
	 * Gets the title style.
	 * 
	 * @param work
	 *            the work
	 * 
	 * @return the title style
	 */
	public static HSSFCellStyle getTitleStyle(HSSFWorkbook work) {
		if (work == null) {
			return null;
		}
		HSSFCellStyle style = work.createCellStyle();
		HSSFFont font = work.createFont();
		style.setFont(font);
		// align center
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		font.setFontHeightInPoints(FONT_TITLE);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		font.setFontName(FONT_COURIER);

		return style;
	}

	/**
	 * Gets the body style.
	 * 
	 * @param work
	 *            the work
	 * 
	 * @return the body style
	 */
	public static HSSFCellStyle getBodyStyle(HSSFWorkbook work) {
		if (work == null) {
			return null;
		}
		HSSFCellStyle style = work.createCellStyle();
		HSSFFont font = work.createFont();
		style.setFont(font);
		// align center
		font.setFontHeightInPoints(FONT_BODY);
		font.setFontName(FONT_COURIER);
		addBorder(style, HSSFCellStyle.BORDER_THIN, HSSFColor.BLACK.index);
		return style;
	}

	/**
	 * Gets the sub title style.
	 * 
	 * @param work
	 *            the work
	 * 
	 * @return the sub title style
	 */
	public static HSSFCellStyle getSubTitleStyle(HSSFWorkbook work) {
		if (work == null) {
			return null;
		}
		HSSFCellStyle style = work.createCellStyle();
		HSSFFont font = work.createFont();
		style.setFont(font);
		// align center
		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		font.setFontHeightInPoints(FONT_SUB);
		font.setFontName(FONT_COURIER);

		return style;
	}

	/**
	 * Adds the border.
	 * 
	 * @param style
	 *            the style
	 * @param border
	 *            the border
	 * @param color
	 *            the color
	 */
	public static void addBorder(HSSFCellStyle style, short border, short color) {
		if (style != null) {
			style.setBorderBottom(border);
			style.setBottomBorderColor(color);
			style.setBorderLeft(border);
			style.setLeftBorderColor(color);
			style.setBorderRight(border);
			style.setRightBorderColor(color);
			style.setBorderTop(border);
			style.setTopBorderColor(color);
		}
	}

}
