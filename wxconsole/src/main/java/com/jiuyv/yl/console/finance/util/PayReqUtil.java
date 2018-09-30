package com.jiuyv.yl.console.finance.util;

import java.io.ByteArrayOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;

import com.jiuyv.common.exception.BaseException;
import com.jiuyv.common.execl.CellDataType;
import com.jiuyv.common.txt.CSVUtil;
import com.jiuyv.yl.console.finance.entity.FinanceDict;
import com.jiuyv.yl.console.finance.entity.MhtBalanceLogVo;
import com.jiuyv.yl.console.finance.entity.NetPayVo;
import com.jiuyv.yl.console.finance.entity.StlmPayReqVo;


/**
 * The Class PayReqUtil.
 *
 * @author 
 * @version 1.0.0
 * @since 2015-12-2
 * @company Shanghai JiuYv Software Systems CO.,LTD.
 */
public class PayReqUtil {

	/** 操作类型对应的余额操作方向 */
	private static Map<String,Long> oprDirection = new HashMap<String,Long>();
	
	static {
		oprDirection.put(FinanceDict.BalanceOprType.SETTLE_AMT, 1l);
		oprDirection.put(FinanceDict.BalanceOprType.TRANS_LOCK, -1l);
		oprDirection.put(FinanceDict.BalanceOprType.TRANS_UNLOCK, 1l);
		oprDirection.put(FinanceDict.BalanceOprType.AMT_LOCK, -1l);
		oprDirection.put(FinanceDict.BalanceOprType.AMT_UNLOCK, 1l);
		oprDirection.put(FinanceDict.BalanceOprType.SETTLE_ADJUST, 1l);
		oprDirection.put(FinanceDict.BalanceOprType.AMT_FAILED, 1l);
		oprDirection.put(FinanceDict.BalanceOprType.AMT_SUCCESS, 0l);
	}
	
	private static List<String> payList = new ArrayList<String>();
	
	static{
		payList.add("payType");
		payList.add("payAccntNo");
		payList.add("receviceAccntNo");
		payList.add("receviceAccntName");
		payList.add("receviceAccntBank");
		payList.add("receviceBranchBankName");
		payList.add("receviceBranchBankNo");
		payList.add("transAmtDesc");
		payList.add("purpose");
		payList.add("flag");
	}
	
	private static SimpleDateFormat sdf8 = new SimpleDateFormat("yyyyMMdd");
	
	private static SimpleDateFormat sdf14 = new SimpleDateFormat("yyyyMMddHHmmss");
	
	public static void doExportNetPay(List<NetPayVo> payVoList, ByteArrayOutputStream out) throws Exception{
		List<String> dataList = new ArrayList<String>();
		for (NetPayVo o :payVoList) {
			List<String> dataLine = new ArrayList<String>();
			String line = "";
			for (String prop : payList) {
				String value = StringUtils.defaultIfEmpty(BeanUtils.getProperty(o, prop), "");
				value = value.trim();
				dataLine.add(value);
			}
			for (String s :dataLine) {
				line += s + "|";
			}
			dataList.add(line);
		}
		CSVUtil.exportCSV(dataList, out);
	}
	
	/**
	 * 根据付款申请单列表生成文字信息
	 * 
	 * @param list
	 * @return
	 */
	public static String genPayReqAlertMsg(List<StlmPayReqVo> list) {
		if ( list == null ) {
			return "";
		}
		StringBuilder buf = new StringBuilder();
		for (int i=0; i < list.size() ; i++ ) {
			if ( i != 0 ) {
				buf.append(",");
			}
			StlmPayReqVo tmp = list.get(i);
			buf.append(tmp.getPayBillNo())
				.append("（").append(tmp.getBgnSday()).append("~")
				.append(tmp.getEndSday()).append(":").append(tmp.getBankTitle())
				.append("）");
			
		}
		return buf.toString();
	}
	
	/**
	 * 汇总商户数据到付款申请单对象
	 * 
	 * @param list
	 * @throws BaseException 
	 */
	public static void sumStlmPayReq(StlmPayReqVo stlmPayReqVo , List<MhtBalanceLogVo> list) throws BaseException {
		if ( stlmPayReqVo == null ) {
			return ;
		}
		Long flowFee = 0l;
		Long stlmAmt = 0l;
		Long stlmCount = 0l;
		Long realAmt = 0l;
		Long bankRealAmt = 0l;
		Long transAmt = 0l;
		if ( list != null ) {
			for ( MhtBalanceLogVo tmp: list) {
				realAmt += tmp.getBalance() * oprDirection.get(tmp.getOprType()); 
			}
		}
		stlmPayReqVo.setFlowFee(flowFee);
		// 清算金额填写的是应付金额
		stlmPayReqVo.setStlmAmt(stlmAmt);
		stlmPayReqVo.setStlmCount(stlmCount);
		stlmPayReqVo.setRealAmt(realAmt);
		stlmPayReqVo.setBankRealAmt(bankRealAmt);
		stlmPayReqVo.setTransAmt(transAmt);
	}
	
	private static HSSFCell generateCell(HSSFSheet sheet, int rowNum, int columnNum, HSSFCellStyle style, String val, CellDataType prop,  Map<String, HSSFCellStyle> styles){
		if (val == null) {
			return null;
		}
		HSSFRow row = sheet.getRow(rowNum);
		if (row == null) {
			row = sheet.createRow(rowNum);
		}
		HSSFCell cell = row.createCell(columnNum);
		if (prop == null) {
			cell.setCellValue(val);
		} else {
			try {
				switch ( prop.getRender() ){
				case date: 
					String dateVal = String.valueOf(val);
					if ( dateVal.length() == 8 ) {
						cell.setCellValue(sdf8.parse(dateVal));
					}
					break;
				case time:
					String timeVal = String.valueOf(val);
					if ( timeVal.length() == 14 ) {
						cell.setCellValue(sdf14.parse(timeVal));
					}
					break;
				case money:
					cell.setCellValue( Long.valueOf(val) / 100.0);
					break;
				case rate: 
					cell.setCellValue( Long.valueOf(val) / 1000000.00);
					break;
				case rate3: 
					cell.setCellValue( Long.valueOf(val) / 100000.00);
					break;
				case percent:
					cell.setCellValue( Long.valueOf(val) / 10000.00);
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
        return cell;
	}
	
}
