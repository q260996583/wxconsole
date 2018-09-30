package com.jiuyv.common.execl;

import java.text.SimpleDateFormat;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * The Enum CellDataRender.
 *
 * @company Shanghai JinYu Software Systems CO.,LTD.
 * @author 
 * @since 2014-5-26 12:20:58
 * @version 1.0.0
 */
public enum CellDataRender {
	
	/** 日期 d/m/y. */
	date,
	/** 时间 d/m/y hh:mm. */
	time,
	/** 金额（分）#,##0.00. */
	money,
	/** 比例（万分之一）. */
	rate,
	/** 比例（十万分之一）. */
	rate3,
	/** 比例（百万万分之一）. */
	rate4,
	/** 百分比 0.00%*/
	percent,
	/** 日期 d/m/. */
	date4,
	/** 时间 d/m hh:mm:ss. */
	time10,
	/** 默认格式 */
	defaultText;
	
	public void render(Object val , HSSFCell cell, Map<String,Object> param, HSSFWorkbook wb, Map<String, HSSFCellStyle> styles) {
		SimpleDateFormat sdf8 = param.get("SDF_DATE") == null ? new SimpleDateFormat("yyyyMMdd"):(SimpleDateFormat)param.get("SDF_DATE");
		SimpleDateFormat sdf4 = param.get("SDF_DATE") == null ? new SimpleDateFormat("MMdd"):(SimpleDateFormat)param.get("SDF_DATE");
		param.put("SDF_DATE", sdf8);
		SimpleDateFormat sdf14 = param.get("SDF_DATETIME") == null ? new SimpleDateFormat("yyyyMMddHHmmss"):(SimpleDateFormat)param.get("SDF_DATETIME");
		SimpleDateFormat sdf10 = param.get("SDF_DATETIME") == null ? new SimpleDateFormat("MMddHHmmss"):(SimpleDateFormat)param.get("SDF_DATETIME");
		param.put("SDF_DATETIME", sdf14);
		try {
			switch ( this ){
			case date: 
				cell.setCellStyle(styles.get("dateStyle"));
				String dateVal = String.valueOf(val);
				if ( dateVal.length() == 8 ) {
					cell.setCellValue(sdf8.parse(dateVal));
				}
				break;
			case time:
				cell.setCellStyle(styles.get("timeStyle"));
				String timeVal = String.valueOf(val);
				if ( timeVal.length() == 14 ) {
					cell.setCellValue(sdf14.parse(timeVal));
				}
				break;
			case money:
				cell.setCellStyle(styles.get("moneyStyle"));
				cell.setCellValue( (Long)val / 100.0);
				break;
			case rate: 
				cell.setCellStyle(styles.get("rateStyle"));
				cell.setCellValue( (Long)val / 1000000.00);
				break;
			case rate3: 
				cell.setCellStyle(styles.get("rate3Style"));
				cell.setCellValue( (Long)val / 100000.00);
				break;
			case rate4: 
				cell.setCellStyle(styles.get("rate4Style"));
				cell.setCellValue( (Long)val / 1000000.00);
				break;
			case percent:
				cell.setCellStyle(styles.get("percentStyle"));
				cell.setCellValue( (Long)val / 10000.00);
				break;
			case date4: 
				cell.setCellStyle(styles.get("date4Style"));
				String date4Val = String.valueOf(val);
				if ( date4Val.trim().length() == 4 ) {
					cell.setCellValue(sdf4.parse(date4Val));
				}
				break;
			case time10:
				cell.setCellStyle(styles.get("time10Style"));
				String time10Val = String.valueOf(val);
				if ( time10Val.length() == 10 ) {
					cell.setCellValue(sdf10.parse(time10Val));
				}
				break;
			case defaultText: 
			default: 
				// cell.setCellStyle(styles.get("bodyStyle"));
				cell.setCellValue(String.valueOf(val));
			}
		} catch (Exception e) {
			cell.setCellValue(String.valueOf(val));
		}
	}
	
	/**
	 * Render Data for SXSSF workbook
	 * @param val
	 * @param cell
	 * @param param
	 * @param wb
	 */
	/*public void render(Object val , Cell cell, Map<String,Object> param, SXSSFWorkbook wb, Map<String, CellStyle> styles) {
		SimpleDateFormat sdf8 = param.get("SDF_DATE") == null ? new SimpleDateFormat("yyyyMMdd"):(SimpleDateFormat)param.get("SDF_DATE");
		param.put("SDF_DATE", sdf8);
		SimpleDateFormat sdf14 = param.get("SDF_DATETIME") == null ? new SimpleDateFormat("yyyyMMddHHmmss"):(SimpleDateFormat)param.get("SDF_DATETIME");
		param.put("SDF_DATETIME", sdf14);
		try {
			switch ( this ){
			case date: 
				cell.setCellStyle(styles.get("dateStyle"));
				String dateVal = String.valueOf(val);
				if ( dateVal.length() == 8 ) {
					cell.setCellValue(sdf8.parse(dateVal));
				}
				break;
			case time:
				cell.setCellStyle(styles.get("timeStyle"));
				String timeVal = String.valueOf(val);
				if ( timeVal.length() == 14 ) {
					cell.setCellValue(sdf14.parse(timeVal));
				}
				break;
			case money:
				cell.setCellStyle(styles.get("moneyStyle"));
				cell.setCellValue( (Long)val / 100.0);
				break;
			case rate: 
				cell.setCellStyle(styles.get("rateStyle"));
				cell.setCellValue( (Long)val / 1000000.00);
				break;
			case percent:
				cell.setCellStyle(styles.get("percentStyle"));
				cell.setCellValue( (Long)val / 10000.00);
				break;
			case defaultText: 
			default: 
				// cell.setCellStyle(styles.get("bodyStyle"));
				cell.setCellValue(String.valueOf(val));
			}
		} catch (Exception e) {
			cell.setCellValue(String.valueOf(val));
		}
	}*/
}
