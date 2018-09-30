package com.jiuyv.yl.jms.client.entity;

import javax.validation.constraints.Digits;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;

import com.jiuyu.posp.protocol.F54AdditionalAmount;
import com.jiuyu.posp.protocol.F60Extend;
import com.jiuyu.posp.protocol.F61Extend;

import javax.validation.constraints.Pattern;

// TODO: Auto-generated Javadoc
/**
 * The Class ISO8583Bean128.
 */
public class ISO8583Bean128 {

	/** 报文类型4位数字 版本号+3位标识符. */
	@Digits(integer = 4, fraction = 0, message = "00005")
	private String messagecode;
	
	/** beanvalidator错误代码基本是1+3位域号+1位错误代码(一般5为非法,3为长度域非法,4为长度域不对). */

	/** 扩展位元表 */
	private byte[] f01bitmap;

	/** 域2 主张号 LLVAR n..19 用Sting存储 */
	/** 10024 长度值大于19 */
	@Length(min = 0, max = 19, message = "10024")
	/**10025 主账号出现非法字符*/
	@Digits(integer = 19, fraction = 0, message = "10025")
	private String f02PrimaryAccountNumber;

	/** 域3交易处理码 n6 用String存储. */
	/** 10035 非法交易处理吗或非法字符 */
	@Digits(integer = 6, fraction = 0, message = "10035")
	private String f03ProcessCode;

	/** 域4 交易金额 n12 用Long存储. */
	/** 10045 非法字符 */
	@Digits(integer = 12, fraction = 0, message = "10045")
	private Long f04AmountTrans;

	/** 域5 清算金额 n12 用Long存储. */
	/** 10055 非法字符 */
	@Digits(integer = 12, fraction = 0, message = "10055")
	private Long f05AmoutSettle;

	/** 域6 持卡人扣账金额 n12 用Long存储. */
	/** 10065 非法字符 */
	@Digits(integer = 12, fraction = 0, message = "10065")
	private Long f06AmoutCardholderBilling;

	/** 域7 交易传输时间 MMDDhhmmss N10 用String存储. */
	/** 10075 非法数字或字符 */
	@Digits(integer = 10, fraction = 0, message = "10075")
	@Length(min = 10, max = 10, message = "10075")
	private String f07TransDateTime;

	/** 域8 持卡人签单费金额 n8 用Long存储. */
	private Long f08AmountCardholerBillingFee;

	/** 域9 清算汇率 n8 用Long存储. */
	/** 10095 非法字符 */
	@Digits(integer = 8, fraction = 0, message = "10095")
	@Length(min = 8, max = 8, message = "10095")
	private Long f09ConvertRateSettle;

	/** 域10 持卡人扣款汇率 n8 用Long存储. */
	/** 10105 非法字符 */
	@Digits(integer = 8, fraction = 0, message = "10105")
	@Length(min = 8, max = 8, message = "10105")
	private Long f10ConvertRateCardholerBilling;

	/** 域11 系统跟踪号 n6 用Long存储. */
	/** 10115 非法字符 */
	@Digits(integer = 6, fraction = 0, message = "10115")
	private Long f11SystemTraceAuditNumber;

	/** 域12 受卡方所在地时间 hhmmss n6 用string存储. */
	/** 10125 非法字符 */
	@Digits(integer = 6, fraction = 0, message = "10125")
	@Length(min = 6, max = 6, message = "10125")
	private String f12TimeLocalTrans;

	/** 域13 受卡方所在地日期 MMDD n4 用String存储 . */
	/** 10135 非法字符 */
	@Digits(integer = 4, fraction = 0, message = "10135")
	@Length(min = 4, max = 4, message = "10135")
	private String f13DateLocalTrans;

	/** 域14 卡有效奇 YYMM n4 用String存储. */
	/** 10145 非法字符 */
	@Digits(integer = 4, fraction = 0, message = "10145")
	@Length(min = 4, max = 4, message = "10145")
	private String f14DateExpiration;

	/** 域15 清算日期 MMDD n4 用String存储. */
	/** 10155 非法字符 */
	@Digits(integer = 4, fraction = 0, message = "10155")
	@Length(min = 4, max = 4, message = "10155")
	private String f15DateSettle;

	/** 域16 兑换日期 MMDD n4 用String存储. */
	/** 10165 非法字符 */
	@Digits(integer = 4, fraction = 0, message = "10165")
	@Length(min = 4, max = 4, message = "10165")
	private String f16DateConversion;

	/** 域17 受理日期 MMDD MMDD n4 用String存储. */
	/** 10175 非法字符 */
	@Digits(integer = 4, fraction = 0, message = "10175")
	@Length(min = 4, max = 4, message = "10175")
	private String f17DateCapture;

	/** 域18 商户类型 n4 用String存储. */
	/** 10185 非法字符 */
	@Digits(integer = 4, fraction = 0, message = "10185")
	private String f18MerchantsType;

	/** 域19 受理机构国家代码 n3 用String存储. */
	/** 10195 非法字符 */
	@Digits(integer = 3, fraction = 0, message = "10195")
	private String f19AcquringInstCountryCode;

	/** 域20 扩展主张号国家代码 n3 用 String存储. */
	private String f20PrimaryAccCountryCode;

	/** 域21 发送机构国家代码 n3 用String存储. */
	private String f21ForwordingInstCountryCode;

	/** 域22 服务点输入方式 n3 用String存储. */
	/** 10225 非法字符 */
	@Digits(integer = 3, fraction = 0, message = "10225")
	private String f22PointOfServiceDataMode;

	/** 域23 IC卡序列号 n3 用String存储. */
	/** 10235 非法字符 */
	@Digits(integer = 3, fraction = 0, message = "10235")
	private String f23CardSeqNumber;

	/** 域24 网络国际标识符 n3 用String存储. */
	private String f24NetInterID;

	/** 域25 功能代码 n2 用String存储 . */
	/** 10255 非法字符 */
	@Digits(integer = 2, fraction = 0, message = "10255")
	private String f25FunctionCode;

	/** 域26 服务点PIN获取码 n2 用String存储. */
	/** 10265 非法字符 */
	@Digits(integer = 2, fraction = 0, message = "10265")
	private String f26CardAcceptorBusCode;

	/** 域27 授权标识响应长度 n1 String存储. */
	private String f27AppCodeLen;

	/** 域28 交易费 x+n8 用String存储. */
	/** 10285 非数字字符 */
	@Pattern(regexp = "[C,D,c,d][0-9]{0,8}", message = "10285")
	private String f28AmoutTransFee;

	/** 域29 清算费金额 x+n8 用String存储. */
	private String f29AmoutSettleFee;

	/** 域30 交易处理费金额 x+n8 用String存储. */
	private String f30AmountTransProcessFee;

	/** 域31 清算处理费金额 x+n8 用String存储. */
	private String f31AmountSettleProcessFee;

	/** 域32 受理机构标识码 LLVAR n..11. 用String存储 */
	/** 10324 长度值大于11 */
	@Length(min = 0, max = 11, message = "10324")
	private String f32AcquringInstiIdCode;

	/** 域33 发送机构标识 LLVAR n..11 用String存储. */
	/** 10334 长度值大于11 */
	@Length(min = 0, max = 11, message = "10334")
	private String f33ForwordInstIdCode;

	/** 域34 扩展主账号 LLVAR ns..28 string存储. */
	private String f34PriAcctNumExt;

	/** 域35 二磁道数据 LLVAR z..37 String存储. */
	/** 10354 长度值大于37 */
	@Size(min = 0, max = 37, message = "10354")
	private String f35Track2Data;

	/** 域36 三磁道数据 LLLVAR z..104 byte[]存储. */
	/** 10364 长度值大于104 */
	@Size(min = 0, max = 104, message = "10364")
	private String f36Track3Data;

	/** 域37 检索参考号 an12 string存储. */
	/** 10375 非法字符 */
	@Pattern(regexp = "^[A-Za-z0-9]+$", message = "10375")
	private String f37RetrivalRefreNum;

	/** 域38 授权标识应答码. an6 String存储 */
	/** 10385 非法字符 */
	@Pattern(regexp = "^[A-Za-z0-9]+$", message = "10385")
	private String f38AuthIdRes;

	/** 域39 应答码 an2 String存储. */
	/** 10395 非法字符 */
	@Pattern(regexp = "^[A-Za-z0-9]+$", message = "10395")
	private String f39Rescode;

	/** 域40 服务限制代码 an3 string存储. */
	private String f40ServiceRestrCode;

	/** 域41 受卡机终端标识码 ans8 String存储. */
	private String f41CardAcceptTermID;

	/** 域42 受卡方标识码 ans15 String存储. */
	private String f42CardAcceptID;

	/** 域43 受卡方名称地址 ans40 String存储. */
	private String f43CardAcceptNameLoc;

	/** 域44 附加响应数据 LLVAR ans。。25 . */
	/** 长度值大于25 */
	@Length(min = 0, max = 25, message = "10444")
	private F44Extend f44AddResData;

	/** 域45 第1磁道数据. */
	private String f45Track1Data;

	/** 域46 附加数据-iso LLLVAR ans...999. */
	private String f46AdditionalDataIso;

	/** 域47附加数据-国家 LLLVAR ans...999. */
	private String f47AdditionalDataNation;

	/** 域48 发起方附加数据 LLLVAR ans...999.  */
	private byte[] f48AdditionDataPrivate;

	/** 域49 交易货币代码. an3 string存储 */
	/** 10495 非法字符 */
	@Pattern(regexp = "^[A-Za-z0-9]+$", message = "10495")
	private String f49CurrencyCodeTrans;

	/** 域50 清算货币代码 an3 string存储. */
	/** 10505 非法字符 */
	@Pattern(regexp = "^[A-Za-z0-9]+$", message = "10505")
	private String f50CurrencyCodeSettle;

	/** 域51 持卡人帐户货币代码 an3 string存储. */
	/** 10515 非法字符 */
	@Pattern(regexp = "^[A-Za-z0-9]+$", message = "10515")
	private String f51CurrencyCodeCardHolderBill;

	/** 域52 个人识别码 b64 byte[]存储. */
	private byte[] f52PinData;

	/** 域53 安全控制信息 n16 String存储. */
	/** 10535 非法字符 */
	@Digits(integer = 6, fraction = 0, message = "10535")
	private String f53SecurityRelatedControlInfo;

	/** 域54 余额信息 LLLVAR an..040. */
	/** 10545 非法字符 */
	@Pattern(regexp = "^[A-Za-z0-9]+$", message = "10545")
	/**10544 长度值大于40*/
	@Length(min = 0, max = 40, message = "10544")
	private F54AdditionalAmount f54AdditionalAmount;

	/** 域55IC卡数据域 LLLVAR ans。。。999 byte[]存储. */
	private byte[] f55ICCSystemData;

	/** 域56 行业保留使用 LLLVAR ans。。。999 byte[]存储. */
	private byte[] f56ReservedIso;

	/** 域57 附加交易信息 LLLVAR ans。。。999 byte[]存储. */
	private byte[] f57AdditionalInfo;

	/** 域58 IC卡数据域（pboc） LLLVAR ans。。。999 byte[]存储. */
	private byte[] f58IcPbocData;

	/** 域59 私有保留使用 LLLVAR ans。。。999 byte[]存储. */
	private byte[] f59ReservedPrivate;

	/** 域60 服务点附加信息 LLLVAR ans。。。999 byte[]存储. */
	private F60Extend f60PosAdditionalInfo;

	/** 域61 原始信息域 Original Message LLLVAR N...029(LLLVAR) . */
	private F61Extend f61OriginalMessage;

	/** 域62 私有保留使用 LLLVAR ans。。。999 byte[]存储. */
	private byte[] f62ReservedPrivate;

	/** 域63 私有保留使用 ANS...163(LLLVAR)，3个字节的长度值＋最大163个字节的数据. */
	private F63ReservedPrivate f63ReservedPrivate;

	/** 域64 报文鉴别码 b64 byte[]存储. */
	private byte[] f64MessageAuthCode;

	/** 域66 清算代码 n1 string存储. */
	private String f66Settlementcode;

	/** 域67 扩展的支付代码 n2 String存储. */
	private String f67Extendedpaymentcode;

	/** 域68 接收机构国家代码 n3 String存储. */
	private String f68ReceiveInstCountryCode;

	/** 域69 清算机构国际代码 n3 String存储. */
	private String f69SettleInstCountryCode;

	/** 域70 网络管理代码 n3 String存储. */
	private String f70NetworkManInfoCode;

	/** 域71 报文编号 n4 String存储. */
	private String f71MessageNum;

	/** 域72 后 报文编号 n4 String存储. */
	private String f72MessageNumLast;

	/** 域73 动作日期 YYYMMDD String存储. */
	private String f73ActionDate;

	/** 域74 贷记笔数 n10 Long存储. */
	private Long f74CreditsNum;

	/** 域75 撤销 贷记笔数 n10 Long存储. */
	private Long f75CreditsRevertNum;

	/** 域76 借记笔数 n10 Long存储. */
	private Long f76DebitsNum;

	/** 域77 撤销 借记笔数 n10 Long存储. */
	private Long f77DebitsRevertNum;

	/** 域78 转帐笔数 n10 Long存储. */
	private Long f78TransferNum;

	/** 域79 撤销转帐笔数 n10 Long存储. */
	private Long f79TransferRevertNum;

	/** 域80 查询笔数 n10 Long存储. */
	private Long f80InquiresNum;

	/** 域81 授权笔数 n10 Long存储. */
	private Long f81AuthNum;

	/** 域82 贷记处理费金额 n12 Long存储. */
	private Long f82CreditsProcessFeeAmt;

	/** 域83 贷记交易费金额 n12 Long存储. */
	private Long f83CreditsTransFeeAmt;

	/** 域84 借记处理费金额 n12 Long存储. */
	private Long f84DebitsProcessFeeAmt;

	/** 域85 借记记交易费金额 n12 Long存储. */
	private Long f85DebitsTransFeeAmt;

	/** 域86 贷记金额 n16 Long存储. */
	private Long f86CreditsAmt;

	/** 域87 撤销 贷记金额 n16 Long存储. */
	private Long f87CreditsRevertAmt;

	/** 域88 借记金额 n16 Long存储. */
	private Long f88DebitsAmt;

	/** 域89 撤销借记金额 n16 Long存储. */
	private Long f89DebitsRevertAmt;

	/** 域90 原始数据元 n42 String存储. */
	private String f90OrigDataElement;

	/** 域91 文件更新代码 an1 String存储. */
	private String f91FileUpdateCode;

	/** 域92 文件保密代码 an2 String存储. */
	private String f92FileSecurityCode;

	/** 域93 响应指示符 an5 String存储. */
	private String f93ResponseIndicator;

	/** 域94 服务指示符 an7 String存储. */
	private String f94ServiceIndicator;

	/** 域95 替换金额 an42 String存储. */
	private String f95ReplacementAmt;

	/** 域96 报文安全码 b64 byte[]存储. */
	private byte[] f96MessageSecurityCode;

	/** 域97 净清算额 x+n16 String存储. */
	private String f97NetSettleAmt;

	/** 域98 收款人 ans25 String存储. */
	private String f98Payee;

	/** 域99 清算机构标识码 LLVAR n..11 String存储 */
	private String f99SettleInstIdCode;

	/** 域100 接收机构标识码 LLVAR n..11 String存储 */
	private String f100ReceiveInstIdCode;

	/** 域101 文件名称 LLVAR ans..17 String存储 */
	private String f101FileName;

	/** 域102 帐户标识1 LLVAR ans..28 String存储 */
	private String f102AccountId1;

	/** 域103 帐户标识2 LLVAR ans..28 String存储 */
	private String f103AccountId2;

	/** 域104 交易说明 LLVAR ans..100 String存储 */
	private String f104TransDescription;

	/** 域105 行业保留使用 LLVAR ans..999 String存储 */
	private String f105ReservedForIsoUse;

	/** 域106 行业保留使用 LLVAR ans..999 String存储 */
	private String f106ReservedForIsoUse;

	/** 域107 行业保留使用 LLVAR ans..999 String存储 */
	private String f107ReservedForIsoUse;

	/** 域108 行业保留使用 LLVAR ans..999 String存储 */
	private String f108ReservedForIsoUse;

	/** 域109 行业保留使用 LLVAR ans..999 String存储 */
	private String f109ReservedForIsoUse;

	/** 域110 行业保留使用 LLVAR ans..999 String存储 */
	private String f110ReservedForIsoUse;

	/** 域111 行业保留使用 LLVAR ans..999 String存储 */
	private String f111ReservedForIsoUse;

	/** 域112 行业保留使用 LLVAR ans..999 String存储 */
	private String f112ReservedForIsoUse;

	/** 域113 行业保留使用 LLVAR ans..999 String存储 */
	private String f113ReservedForIsoUse;

	/** 域114 行业保留使用 LLVAR ans..999 String存储 */
	private String f114ReservedForIsoUse;

	/** 域115 行业保留使用 LLVAR ans..999 String存储 */
	private String f115ReservedForIsoUse;

	/** 域116 行业保留使用 LLVAR ans..999 String存储 */
	private String f116ReservedForBusiUse;

	/** 域117 行业保留使用 LLVAR ans..999 String存储 */
	private String f117ReservedForBusiUse;

	/** 域118 行业保留使用 LLVAR ans..999 String存储 */
	private String f118ReservedForBusiUse;

	/** 域119行业保留使用 LLVAR ans..999 String存储 */
	private String f119ReservedForBusiUse;

	/** 域120 行业保留使用 LLVAR ans..999 String存储 */
	private String f120ReservedForBusiUse;

	/** 域121 交换中心私用使用 LLVAR ans..999 String存储 */
	private String f121ReservedForSwitchCenter;

	/** 域122 受理方私用使用 LLVAR ans..999 String存储 */
	private String f122ReservedForAcquire;

	/** 域123 发卡机构私用使用 LLVAR ans..999 String存储 */
	private String f123ReservedForIssuer;

	/** 域124 发卡机构私用使用 LLVAR ans..999 String存储 */
	private String f124ReservedForBusiUse;

	/** 域125 发卡机构私用使用 LLVAR ans..999 String存储 */
	private String f125ReservedForBusiUse;

	/** 域126 发卡机构私用使用 LLVAR ans..999 String存储 */
	private String f126ReservedForBusiUse;

	/** 域127 发卡机构私用使用 LLVAR ans..999 String存储 */
	private String f127ReservedForBusiUse;

	/** 域128 报文鉴别码 b64 byte[]存储. */
	private byte[] f128MessageAuthCode;

	/**
	 * Gets the 报文类型4位数字 版本号+3位标识符.
	 *
	 * @return the messagecode 报文类型4位数字 版本号+3位标识符
	 */
	public String getMessagecode() {
		return messagecode;
	}

	/**
	 * Sets the 报文类型4位数字 版本号+3位标识符.
	 *
	 * @param messagecode the messagecode to set 报文类型4位数字 版本号+3位标识符
	 */
	public void setMessagecode(String messagecode) {
		this.messagecode = messagecode;
	}

	/**
	 * Gets the beanvalidator错误代码基本是1+3位域号+1位错误代码(一般5为非法,3为长度域非法,4为长度域不对).
	 *
	 * @return the beanvalidator错误代码基本是1+3位域号+1位错误代码(一般5为非法,3为长度域非法,4为长度域不对)
	 */
	public byte[] getF01bitmap() {
		if (this.f01bitmap != null) {

			return this.f01bitmap.clone();
		}
		return null;
	}

	/**
	 * Sets the beanvalidator错误代码基本是1+3位域号+1位错误代码(一般5为非法,3为长度域非法,4为长度域不对).
	 *
	 * @param bitmap the new beanvalidator错误代码基本是1+3位域号+1位错误代码(一般5为非法,3为长度域非法,4为长度域不对)
	 */
	public void setF01bitmap(byte[] bitmap) {
		if (bitmap != null) {
			this.f01bitmap = bitmap.clone();
		}
	}

	/**
	 * Gets the 域2 主张号 LLVAR n.
	 *
	 * @return 域2 主张号 LLVAR n..19 用Sting存储
	 */
	public String getF02PrimaryAccountNumber() {
		return f02PrimaryAccountNumber;
	}

	/**
	 * Sets the 域2 主张号 LLVAR n.
	 *
	 * @param f02PrimaryAccountNumber the new 域2 主张号 LLVAR n
	 */
	public void setF02PrimaryAccountNumber(String f02PrimaryAccountNumber) {
		this.f02PrimaryAccountNumber = f02PrimaryAccountNumber;
	}

	/**
	 * Gets the 域3交易处理码 n6 用String存储.
	 *
	 * @return the f3ProcessCode 域3交易处理码 n6 用String存储
	 */
	public String getF03ProcessCode() {
		return f03ProcessCode;
	}

	/**
	 * Sets the 域3交易处理码 n6 用String存储.
	 *
	 * @param f03ProcessCode the new 域3交易处理码 n6 用String存储
	 */
	public void setF03ProcessCode(String f03ProcessCode) {
		this.f03ProcessCode = f03ProcessCode;
	}

	/**
	 * Gets the 域4 交易金额 n12 用Long存储.
	 *
	 * @return the f4AmountTrans 域4 交易金额 n12 用Long存储
	 */
	public Long getF04AmountTrans() {
		return f04AmountTrans;
	}

	/**
	 * Sets the 域4 交易金额 n12 用Long存储.
	 *
	 * @param f04AmountTrans the new 域4 交易金额 n12 用Long存储
	 */
	public void setF04AmountTrans(Long f04AmountTrans) {
		this.f04AmountTrans = f04AmountTrans;
	}

	/**
	 * Gets the 域5 清算金额 n12 用Long存储.
	 *
	 * @return the f5AmoutSettle 域5 清算金额 n12 用Long存储
	 */
	public Long getF05AmoutSettle() {
		return f05AmoutSettle;
	}

	/**
	 * Sets the 域5 清算金额 n12 用Long存储.
	 *
	 * @param f05AmoutSettle the new 域5 清算金额 n12 用Long存储
	 */
	public void setF05AmoutSettle(Long f05AmoutSettle) {
		this.f05AmoutSettle = f05AmoutSettle;
	}

	/**
	 * Gets the 域6 持卡人扣账金额 n12 用Long存储.
	 *
	 * @return the f6AmoutCardholderBilling 域6 持卡人扣账金额 n12 用Long存储
	 */
	public Long getF06AmoutCardholderBilling() {
		return f06AmoutCardholderBilling;
	}

	/**
	 * Sets the 域6 持卡人扣账金额 n12 用Long存储.
	 *
	 * @param f06AmoutCardholderBilling the new 域6 持卡人扣账金额 n12 用Long存储
	 */
	public void setF06AmoutCardholderBilling(Long f06AmoutCardholderBilling) {
		this.f06AmoutCardholderBilling = f06AmoutCardholderBilling;
	}

	/**
	 * Gets the 域7 交易传输时间 MMDDhhmmss N10 用String存储.
	 *
	 * @return the f7TransDateTime 域7 交易传输时间 MMDDhhmmss N10 用String存储
	 */
	public String getF07TransDateTime() {
		return f07TransDateTime;
	}

	/**
	 * Sets the 域7 交易传输时间 MMDDhhmmss N10 用String存储.
	 *
	 * @param f07TransDateTime the new 域7 交易传输时间 MMDDhhmmss N10 用String存储
	 */
	public void setF07TransDateTime(String f07TransDateTime) {
		this.f07TransDateTime = f07TransDateTime;
	}

	/**
	 * Gets the 域8 持卡人签单费金额 n8 用Long存储.
	 *
	 * @return the f8AmountCardholerBillingFee 域8 持卡人签单费金额 n8 用Long存储
	 */
	public Long getF08AmountCardholerBillingFee() {
		return f08AmountCardholerBillingFee;
	}

	/**
	 * Sets the 域8 持卡人签单费金额 n8 用Long存储.
	 *
	 * @param f08AmountCardholerBillingFee the new 域8 持卡人签单费金额 n8 用Long存储
	 */
	public void setF08AmountCardholerBillingFee(
			Long f08AmountCardholerBillingFee) {
		this.f08AmountCardholerBillingFee = f08AmountCardholerBillingFee;
	}

	/**
	 * Gets the 域9 清算汇率 n8 用Long存储.
	 *
	 * @return the f9ConvertRateSettle 域9 清算汇率 n8 用Long存储
	 */
	public Long getF09ConvertRateSettle() {
		return f09ConvertRateSettle;
	}

	/**
	 * Sets the 域9 清算汇率 n8 用Long存储.
	 *
	 * @param f09ConvertRateSettle the new 域9 清算汇率 n8 用Long存储
	 */
	public void setF09ConvertRateSettle(Long f09ConvertRateSettle) {
		this.f09ConvertRateSettle = f09ConvertRateSettle;
	}

	/**
	 * Gets the 域10 持卡人扣款汇率 n8 用Long存储.
	 *
	 * @return the f10ConvertRateCardholerBilling 域10 持卡人扣款汇率 n8 用Long存储
	 */
	public Long getF10ConvertRateCardholerBilling() {
		return f10ConvertRateCardholerBilling;
	}

	/**
	 * Sets the 域10 持卡人扣款汇率 n8 用Long存储.
	 *
	 * @param f10ConvertRateCardholerBilling the f10ConvertRateCardholerBilling to set 域10 持卡人扣款汇率 n8
	 * 用Long存储
	 */
	public void setF10ConvertRateCardholerBilling(
			Long f10ConvertRateCardholerBilling) {
		this.f10ConvertRateCardholerBilling = f10ConvertRateCardholerBilling;
	}

	/**
	 * Gets the 域11 系统跟踪号 n6 用Long存储.
	 *
	 * @return the f11SystemTraceAuditNumber 域11 系统跟踪号 n6 用Long存储
	 */
	public Long getF11SystemTraceAuditNumber() {
		return f11SystemTraceAuditNumber;
	}

	/**
	 * Sets the 域11 系统跟踪号 n6 用Long存储.
	 *
	 * @param f11SystemTraceAuditNumber the f11SystemTraceAuditNumber to set 域11 系统跟踪号 n6 用Long存储
	 */
	public void setF11SystemTraceAuditNumber(Long f11SystemTraceAuditNumber) {
		this.f11SystemTraceAuditNumber = f11SystemTraceAuditNumber;
	}

	/**
	 * Gets the 域12 受卡方所在地时间 hhmmss n6 用string存储.
	 *
	 * @return the f12TimeLocalTrans 域12 受卡方所在地时间 hhmmss n6 用string存储
	 */
	public String getF12TimeLocalTrans() {
		return f12TimeLocalTrans;
	}

	/**
	 * Sets the 域12 受卡方所在地时间 hhmmss n6 用string存储.
	 *
	 * @param f12TimeLocalTrans the f12TimeLocalTrans to set 域12 受卡方所在地时间 hhmmss n6 用string存储
	 */
	public void setF12TimeLocalTrans(String f12TimeLocalTrans) {
		this.f12TimeLocalTrans = f12TimeLocalTrans;
	}

	/**
	 * Gets the 域13 受卡方所在地日期 MMDD n4 用String存储 .
	 *
	 * @return the f13DateLocalTrans 域13 受卡方所在地日期 MMDD n4 用String存储
	 */
	public String getF13DateLocalTrans() {
		return f13DateLocalTrans;
	}

	/**
	 * Sets the 域13 受卡方所在地日期 MMDD n4 用String存储 .
	 *
	 * @param f13DateLocalTrans the f13DateLocalTrans to set 域13 受卡方所在地日期 MMDD n4 用String存储
	 */
	public void setF13DateLocalTrans(String f13DateLocalTrans) {
		this.f13DateLocalTrans = f13DateLocalTrans;
	}

	/**
	 * Gets the 域14 卡有效奇 YYMM n4 用String存储.
	 *
	 * @return the f14DateExpiration 域14 卡有效奇 YYMM n4 用String存储
	 */
	public String getF14DateExpiration() {
		return f14DateExpiration;
	}

	/**
	 * Sets the 域14 卡有效奇 YYMM n4 用String存储.
	 *
	 * @param f14DateExpiration the f14DateExpiration to set 域14 卡有效奇 YYMM n4 用String存储
	 */
	public void setF14DateExpiration(String f14DateExpiration) {
		this.f14DateExpiration = f14DateExpiration;
	}

	/**
	 * Gets the 域15 清算日期 MMDD n4 用String存储.
	 *
	 * @return the f15DateSettle 域15 清算日期 MMDD n4 用String存储
	 */
	public String getF15DateSettle() {
		return f15DateSettle;
	}

	/**
	 * Sets the 域15 清算日期 MMDD n4 用String存储.
	 *
	 * @param f15DateSettle the f15DateSettle to set 域15 清算日期 MMDD n4 用String存储
	 */
	public void setF15DateSettle(String f15DateSettle) {
		this.f15DateSettle = f15DateSettle;
	}

	/**
	 * Gets the 域16 兑换日期 MMDD n4 用String存储.
	 *
	 * @return the f16DateConversion 域16 兑换日期 MMDD n4 用String存储
	 */
	public String getF16DateConversion() {
		return f16DateConversion;
	}

	/**
	 * Sets the 域16 兑换日期 MMDD n4 用String存储.
	 *
	 * @param f16DateConversion the f16DateConversion to set 域16 兑换日期 MMDD n4 用String存储
	 */
	public void setF16DateConversion(String f16DateConversion) {
		this.f16DateConversion = f16DateConversion;
	}

	/**
	 * Gets the 域17 受理日期 MMDD MMDD n4 用String存储.
	 *
	 * @return the f17DateCapture 域17 受理日期 MMDD MMDD n4 用String存储.
	 */
	public String getF17DateCapture() {
		return f17DateCapture;
	}

	/**
	 * Sets the 域17 受理日期 MMDD MMDD n4 用String存储.
	 *
	 * @param f17DateCapture the f17DateCapture to set 域17 受理日期 MMDD MMDD n4 用String存储.
	 */
	public void setF17DateCapture(String f17DateCapture) {
		this.f17DateCapture = f17DateCapture;
	}

	/**
	 * Gets the 域18 商户类型 n4 用String存储.
	 *
	 * @return the f18MerchantsType 域18 商户类型 n4 用String存储
	 */
	public String getF18MerchantsType() {
		return f18MerchantsType;
	}

	/**
	 * Sets the 域18 商户类型 n4 用String存储.
	 *
	 * @param f18MerchantsType the f18MerchantsType to set 域18 商户类型 n4 用String存储
	 */
	public void setF18MerchantsType(String f18MerchantsType) {
		this.f18MerchantsType = f18MerchantsType;
	}

	/**
	 * Gets the 域19 受理机构国家代码 n3 用String存储.
	 *
	 * @return the f19AcquringInstCountryCode 域19 受理机构国家代码 n3 用String存储
	 */
	public String getF19AcquringInstCountryCode() {
		return f19AcquringInstCountryCode;
	}

	/**
	 * Sets the 域19 受理机构国家代码 n3 用String存储.
	 *
	 * @param f19AcquringInstCountryCode the f19AcquringInstCountryCode to set 域19 受理机构国家代码 n3
	 * 用String存储
	 */
	public void setF19AcquringInstCountryCode(String f19AcquringInstCountryCode) {
		this.f19AcquringInstCountryCode = f19AcquringInstCountryCode;
	}

	/**
	 * Gets the 域20 扩展主张号国家代码 n3 用 String存储.
	 *
	 * @return the f20PrimaryAccCountryCode 域20 扩展主张号国家代码 n3 用 String存储
	 */
	public String getF20PrimaryAccCountryCode() {
		return f20PrimaryAccCountryCode;
	}

	/**
	 * Sets the 域20 扩展主张号国家代码 n3 用 String存储.
	 *
	 * @param f20PrimaryAccCountryCode the f20PrimaryAccCountryCode to set 域20 扩展主张号国家代码 n3 用
	 * String存储
	 */
	public void setF20PrimaryAccCountryCode(String f20PrimaryAccCountryCode) {
		this.f20PrimaryAccCountryCode = f20PrimaryAccCountryCode;
	}

	/**
	 * Gets the 域21 发送机构国家代码 n3 用String存储.
	 *
	 * @return the f21ForwordingInstCountryCode 域21 发送机构国家代码 n3 用String存储
	 */
	public String getF21ForwordingInstCountryCode() {
		return f21ForwordingInstCountryCode;
	}

	/**
	 * Sets the 域21 发送机构国家代码 n3 用String存储.
	 *
	 * @param f21ForwordingInstCountryCode the f21ForwordingInstCountryCode to set 域21 发送机构国家代码 n3
	 * 用String存储
	 */
	public void setF21ForwordingInstCountryCode(
			String f21ForwordingInstCountryCode) {
		this.f21ForwordingInstCountryCode = f21ForwordingInstCountryCode;
	}

	/**
	 * Gets the 域22 服务点输入方式 n3 用String存储.
	 *
	 * @return the f22PointOfServiceDataMode 域22 服务点输入方式 n3 用String存储
	 */
	public String getF22PointOfServiceDataMode() {
		return f22PointOfServiceDataMode;
	}

	/**
	 * Sets the 域22 服务点输入方式 n3 用String存储.
	 *
	 * @param f22PointOfServiceDataMode the f22PointOfServiceDataMode to set 域22 服务点输入方式 n3 用String存储
	 */
	public void setF22PointOfServiceDataMode(String f22PointOfServiceDataMode) {
		this.f22PointOfServiceDataMode = f22PointOfServiceDataMode;
	}

	/**
	 * Gets the 域23 IC卡序列号 n3 用String存储.
	 *
	 * @return the f23CardSeqNumber 域23 IC卡序列号 n3 用String存储
	 */
	public String getF23CardSeqNumber() {
		return f23CardSeqNumber;
	}

	/**
	 * Sets the 域23 IC卡序列号 n3 用String存储.
	 *
	 * @param f23CardSeqNumber the f23CardSeqNumber to set 域23 IC卡序列号 n3 用String存储
	 */
	public void setF23CardSeqNumber(String f23CardSeqNumber) {
		this.f23CardSeqNumber = f23CardSeqNumber;
	}

	/**
	 * Gets the 域24 网络国际标识符 n3 用String存储.
	 *
	 * @return the f24NetInterID 域24 网络国际标识符 n3 用String存储
	 */
	public String getF24NetInterID() {
		return f24NetInterID;
	}

	/**
	 * Sets the 域24 网络国际标识符 n3 用String存储.
	 *
	 * @param f24NetInterID the f24NetInterID to set 域24 网络国际标识符 n3 用String存储
	 */
	public void setF24NetInterID(String f24NetInterID) {
		this.f24NetInterID = f24NetInterID;
	}

	/**
	 * Gets the 域25 功能代码 n2 用String存储 .
	 *
	 * @return the f25FunctionCode 域25 功能代码 n2 用String存储
	 */
	public String getF25FunctionCode() {
		return f25FunctionCode;
	}

	/**
	 * Sets the 域25 功能代码 n2 用String存储 .
	 *
	 * @param f25FunctionCode the f25FunctionCode to set 域25 功能代码 n2 用String存储
	 */
	public void setF25FunctionCode(String f25FunctionCode) {
		this.f25FunctionCode = f25FunctionCode;
	}

	/**
	 * Gets the 域26 服务点PIN获取码 n2 用String存储.
	 *
	 * @return the f26CardAcceptorBusCode 域26 服务点PIN获取码 n2 用String存储
	 */
	public String getF26CardAcceptorBusCode() {
		return f26CardAcceptorBusCode;
	}

	/**
	 * Sets the 域26 服务点PIN获取码 n2 用String存储.
	 *
	 * @param f26CardAcceptorBusCode the f26CardAcceptorBusCode to set 域26 服务点PIN获取码 n2 用String存储
	 */
	public void setF26CardAcceptorBusCode(String f26CardAcceptorBusCode) {
		this.f26CardAcceptorBusCode = f26CardAcceptorBusCode;
	}

	/**
	 * Gets the 域27 授权标识响应长度 n1 String存储.
	 *
	 * @return the f27AppCodeLen 域27 授权标识响应长度 n1 String存储
	 */
	public String getF27AppCodeLen() {
		return f27AppCodeLen;
	}

	/**
	 * Sets the 域27 授权标识响应长度 n1 String存储.
	 *
	 * @param f27AppCodeLen the f27AppCodeLen to set 域27 授权标识响应长度 n1 String存储
	 */
	public void setF27AppCodeLen(String f27AppCodeLen) {
		this.f27AppCodeLen = f27AppCodeLen;
	}

	/**
	 * Gets the 域28 交易费 x+n8 用String存储.
	 *
	 * @return the f28AmoutTransFee 域28 交易费 x+n8 用String存储
	 */
	public String getF28AmoutTransFee() {
		return f28AmoutTransFee;
	}

	/**
	 * Sets the 域28 交易费 x+n8 用String存储.
	 *
	 * @param f28AmoutTransFee the f28AmoutTransFee to set 域28 交易费 x+n8 用String存储
	 */
	public void setF28AmoutTransFee(String f28AmoutTransFee) {
		this.f28AmoutTransFee = f28AmoutTransFee;
	}

	/**
	 * Gets the 域29 清算费金额 x+n8 用String存储.
	 *
	 * @return the f29AmoutSettleFee 域29 清算费金额 x+n8 用String存储
	 */
	public String getF29AmoutSettleFee() {
		return f29AmoutSettleFee;
	}

	/**
	 * Sets the 域29 清算费金额 x+n8 用String存储.
	 *
	 * @param f29AmoutSettleFee the f29AmoutSettleFee to set 域29 清算费金额 x+n8 用String存储
	 */
	public void setF29AmoutSettleFee(String f29AmoutSettleFee) {
		this.f29AmoutSettleFee = f29AmoutSettleFee;
	}

	/**
	 * Gets the 域30 交易处理费金额 x+n8 用String存储.
	 *
	 * @return the f30AmountTransProcessFee 域30 交易处理费金额 x+n8 用String存储
	 */
	public String getF30AmountTransProcessFee() {
		return f30AmountTransProcessFee;
	}

	/**
	 * Sets the 域30 交易处理费金额 x+n8 用String存储.
	 *
	 * @param f30AmountTransProcessFee the f30AmountTransProcessFee to set 域30 交易处理费金额 x+n8 用String存储
	 */
	public void setF30AmountTransProcessFee(String f30AmountTransProcessFee) {
		this.f30AmountTransProcessFee = f30AmountTransProcessFee;
	}

	/**
	 * Gets the 域31 清算处理费金额 x+n8 用String存储.
	 *
	 * @return the f31AmountSettleProcessFee 域31 清算处理费金额 x+n8 用String存储
	 */
	public String getF31AmountSettleProcessFee() {
		return f31AmountSettleProcessFee;
	}

	/**
	 * Sets the 域31 清算处理费金额 x+n8 用String存储.
	 *
	 * @param f31AmountSettleProcessFee the f31AmountSettleProcessFee to set 域31 清算处理费金额 x+n8
	 * 用String存储
	 */
	public void setF31AmountSettleProcessFee(String f31AmountSettleProcessFee) {
		this.f31AmountSettleProcessFee = f31AmountSettleProcessFee;
	}

	/**
	 * Gets the 域32 受理机构标识码 LLVAR n.
	 *
	 * @return the f32AcquringInstiIdCode 域32 受理机构标识码 LLVAR n..11. 用String存储
	 */
	public String getF32AcquringInstiIdCode() {
		return f32AcquringInstiIdCode;
	}

	/**
	 * Sets the 域32 受理机构标识码 LLVAR n.
	 *
	 * @param f32AcquringInstiIdCode the f32AcquringInstiIdCode to set 域32 受理机构标识码 LLVAR n..11.
	 * 用String存储
	 */
	public void setF32AcquringInstiIdCode(String f32AcquringInstiIdCode) {
		this.f32AcquringInstiIdCode = f32AcquringInstiIdCode;
	}

	/**
	 * Gets the 域33 发送机构标识 LLVAR n.
	 *
	 * @return the f33ForwordInstIdCode 域33 发送机构标识 LLVAR n..11 用String存储
	 */
	public String getF33ForwordInstIdCode() {
		return f33ForwordInstIdCode;
	}

	/**
	 * Sets the 域33 发送机构标识 LLVAR n.
	 *
	 * @param f33ForwordInstIdCode the f33ForwordInstIdCode to set 域33 发送机构标识 LLVAR n..11
	 * 用String存储
	 */
	public void setF33ForwordInstIdCode(String f33ForwordInstIdCode) {
		this.f33ForwordInstIdCode = f33ForwordInstIdCode;
	}

	/**
	 * Gets the 域34 扩展主账号 LLVAR ns.
	 *
	 * @return the f34PriAcctNumExt 域34 扩展主账号 LLVAR ns..28 string存储
	 */
	public String getF34PriAcctNumExt() {
		return f34PriAcctNumExt;
	}

	/**
	 * Sets the 域34 扩展主账号 LLVAR ns.
	 *
	 * @param f34PriAcctNumExt the f34PriAcctNumExt to set 域34 扩展主账号 LLVAR ns..28 string存储
	 */
	public void setF34PriAcctNumExt(String f34PriAcctNumExt) {
		this.f34PriAcctNumExt = f34PriAcctNumExt;
	}

	/**
	 * Gets the 域35 二磁道数据 LLVAR z.
	 *
	 * @return the f35Track2Data 域35 二磁道数据 LLVAR z..37 String存储
	 */
	public String getF35Track2Data() {

		return this.f35Track2Data;
	}

	/**
	 * Sets the 域35 二磁道数据 LLVAR z.
	 *
	 * @param f35Track2Data the f35Track2Data to set 域35 二磁道数据 LLVAR z..37 String存储
	 */
	public void setF35Track2Data(String f35Track2Data) {
		this.f35Track2Data = f35Track2Data;
	}

	/**
	 * Gets the 域36 三磁道数据 LLLVAR z.
	 *
	 * @return the f36Track3Data 域36 三磁道数据 LLLVAR z..104 String存储
	 */
	public String getF36Track3Data() {
		return this.f36Track3Data;
	}

	/**
	 * Sets the 域36 三磁道数据 LLLVAR z.
	 *
	 * @param f36Track3Data the f36Track3Data to set 域36 三磁道数据 LLLVAR z..104 String存储
	 */
	public void setF36Track3Data(String f36Track3Data) {

		this.f36Track3Data = f36Track3Data;
	}

	/**
	 * Gets the 域37 检索参考号 an12 string存储.
	 *
	 * @return the f37RetrivalRefreNum 域37 检索参考号 an12 string存储
	 */
	public String getF37RetrivalRefreNum() {
		return f37RetrivalRefreNum;
	}

	/**
	 * Sets the 域37 检索参考号 an12 string存储.
	 *
	 * @param f37RetrivalRefreNum the f37RetrivalRefreNum to set 域37 检索参考号 an12 string存储
	 */
	public void setF37RetrivalRefreNum(String f37RetrivalRefreNum) {
		this.f37RetrivalRefreNum = f37RetrivalRefreNum;
	}

	/**
	 * Gets the 域38 授权标识应答码.
	 *
	 * @return the f38AuthIdRes 域38 授权标识应答码. an6 String存储
	 */
	public String getF38AuthIdRes() {
		return f38AuthIdRes;
	}

	/**
	 * Sets the 域38 授权标识应答码.
	 *
	 * @param f38AuthIdRes the f38AuthIdRes to set 域38 授权标识应答码. an6 String存储
	 */
	public void setF38AuthIdRes(String f38AuthIdRes) {
		this.f38AuthIdRes = f38AuthIdRes;
	}

	/**
	 * Gets the 域39 应答码 an2 String存储.
	 *
	 * @return the f39Rescode 域39 应答码 an2 String存储
	 */
	public String getF39Rescode() {
		return f39Rescode;
	}

	/**
	 * Sets the 域39 应答码 an2 String存储.
	 *
	 * @param f39Rescode the f39Rescode to set 域39 应答码 an2 String存储
	 */
	public void setF39Rescode(String f39Rescode) {
		this.f39Rescode = f39Rescode;
	}

	/**
	 * Gets the 域40 服务限制代码 an3 string存储.
	 *
	 * @return the f40ServiceRestrCode 域40 服务限制代码 an3 string存储
	 */
	public String getF40ServiceRestrCode() {
		return f40ServiceRestrCode;
	}

	/**
	 * Sets the 域40 服务限制代码 an3 string存储.
	 *
	 * @param f40ServiceRestrCode the f40ServiceRestrCode to set 域40 服务限制代码 an3 string存储
	 */
	public void setF40ServiceRestrCode(String f40ServiceRestrCode) {
		this.f40ServiceRestrCode = f40ServiceRestrCode;
	}

	/**
	 * Gets the 域41 受卡机终端标识码 ans8 String存储.
	 *
	 * @return the f41CardAcceptTermID 域41 受卡机终端标识码 ans8 String存储
	 */
	public String getF41CardAcceptTermID() {
		return f41CardAcceptTermID;
	}

	/**
	 * Sets the 域41 受卡机终端标识码 ans8 String存储.
	 *
	 * @param f41CardAcceptTermID the f41CardAcceptTermID to set 域41 受卡机终端标识码 ans8 String存储
	 */
	public void setF41CardAcceptTermID(String f41CardAcceptTermID) {
		this.f41CardAcceptTermID = f41CardAcceptTermID;
	}

	/**
	 * Gets the 域42 受卡方标识码 ans15 String存储.
	 *
	 * @return the f42CardAcceptID 域42 受卡方标识码 ans15 String存储
	 */
	public String getF42CardAcceptID() {
		return f42CardAcceptID;
	}

	/**
	 * Sets the 域42 受卡方标识码 ans15 String存储.
	 *
	 * @param f42CardAcceptID the f42CardAcceptID to set 域42 受卡方标识码 ans15 String存储
	 */
	public void setF42CardAcceptID(String f42CardAcceptID) {
		this.f42CardAcceptID = f42CardAcceptID;
	}

	/**
	 * Gets the 域43 受卡方名称地址 ans40 String存储.
	 *
	 * @return the f43CardAcceptNameLoc 域43 受卡方名称地址 ans40 String存储
	 */
	public String getF43CardAcceptNameLoc() {
		return f43CardAcceptNameLoc;
	}

	/**
	 * Sets the 域43 受卡方名称地址 ans40 String存储.
	 *
	 * @param f43CardAcceptNameLoc the f43CardAcceptNameLoc to set 域43 受卡方名称地址 ans40 String存储
	 */
	public void setF43CardAcceptNameLoc(String f43CardAcceptNameLoc) {
		this.f43CardAcceptNameLoc = f43CardAcceptNameLoc;
	}

	/**
	 * Gets the 域44 附加响应数据 LLVAR ans。。25 .
	 *
	 * @return the f44AddResData 域44 附加响应数据 LLVAR ans。。25
	 */
	public F44Extend getF44AddResData() {
		return f44AddResData;
	}

	/**
	 * Sets the 域44 附加响应数据 LLVAR ans。。25 .
	 *
	 * @param f44AddResData the f44AddResData to set 域44 附加响应数据 LLVAR ans。。25
	 */
	public void setF44AddResData(F44Extend f44AddResData) {
		this.f44AddResData = f44AddResData;
	}

	/**
	 * Gets the 域45 第1磁道数据.
	 *
	 * @return the f45Track1Data 域45 第1磁道数据
	 */
	public String getF45Track1Data() {
		return f45Track1Data;
	}

	/**
	 * Sets the 域45 第1磁道数据.
	 *
	 * @param f45Track1Data the f45Track1Data to set 域45 第1磁道数据
	 */
	public void setF45Track1Data(String f45Track1Data) {
		this.f45Track1Data = f45Track1Data;
	}

	/**
	 * Gets the 域46 附加数据-iso LLLVAR ans.
	 *
	 * @return the f46AdditionalDataIso 域46 附加数据-iso LLLVAR ans...999
	 */
	public String getF46AdditionalDataIso() {
		return f46AdditionalDataIso;
	}

	/**
	 * Sets the 域46 附加数据-iso LLLVAR ans.
	 *
	 * @param f46AdditionalDataIso the f46AdditionalDataIso to set 域46 附加数据-iso LLLVAR ans...999
	 */
	public void setF46AdditionalDataIso(String f46AdditionalDataIso) {
		this.f46AdditionalDataIso = f46AdditionalDataIso;
	}

	/**
	 * Gets the 域47附加数据-国家 LLLVAR ans.
	 *
	 * @return the f47AdditionalDataNation 域47附加数据-国家 LLLVAR ans...999
	 */
	public String getF47AdditionalDataNation() {
		return f47AdditionalDataNation;
	}

	/**
	 * Sets the 域47附加数据-国家 LLLVAR ans.
	 *
	 * @param f47AdditionalDataNation the f47AdditionalDataNation to set 域47附加数据-国家 LLLVAR ans...999
	 */
	public void setF47AdditionalDataNation(String f47AdditionalDataNation) {
		this.f47AdditionalDataNation = f47AdditionalDataNation;
	}

	/**
	 * Gets the 域48 发起方附加数据 LLLVAR ans.
	 *
	 * @return the f48AdditionDataPrivate 域48 发起方附加数据 LLLVAR ans...999.
	 */
	public byte[] getF48AdditionDataPrivate() {
		if (f48AdditionDataPrivate!=null){
		return f48AdditionDataPrivate.clone();
		}
		return null;
	}

	/**
	 * Sets the 域48 发起方附加数据 LLLVAR ans.
	 *
	 * @param f48AdditionDataPrivate the f48AdditionDataPrivate to set 域48 发起方附加数据 LLLVAR
	 * ans...999.
	 */
	public void setF48AdditionDataPrivate(byte[] f48AdditionDataPrivate) {
		if (f48AdditionDataPrivate!=null){
		this.f48AdditionDataPrivate = f48AdditionDataPrivate.clone();
		}
	}

	/**
	 * Gets the 域49 交易货币代码.
	 *
	 * @return the f49CurrencyCodeTrans 域49 交易货币代码. an3 string存储
	 */
	public String getF49CurrencyCodeTrans() {
		return f49CurrencyCodeTrans;
	}

	/**
	 * Sets the 域49 交易货币代码.
	 *
	 * @param f49CurrencyCodeTrans the f49CurrencyCodeTrans to set 域49 交易货币代码. an3 string存储
	 */
	public void setF49CurrencyCodeTrans(String f49CurrencyCodeTrans) {
		this.f49CurrencyCodeTrans = f49CurrencyCodeTrans;
	}

	/**
	 * Gets the 域50 清算货币代码 an3 string存储.
	 *
	 * @return the f50CurrencyCodeSettle 域50 清算货币代码 an3 string存储.
	 */
	public String getF50CurrencyCodeSettle() {
		return f50CurrencyCodeSettle;
	}

	/**
	 * Sets the 域50 清算货币代码 an3 string存储.
	 *
	 * @param f50CurrencyCodeSettle the f50CurrencyCodeSettle to set 域50 清算货币代码 an3 string存储.
	 */
	public void setF50CurrencyCodeSettle(String f50CurrencyCodeSettle) {
		this.f50CurrencyCodeSettle = f50CurrencyCodeSettle;
	}

	/**
	 * Gets the 域51 持卡人帐户货币代码 an3 string存储.
	 *
	 * @return the f51CurrencyCodeCardHolderBill 域51 持卡人帐户货币代码 an3 string存储
	 */
	public String getF51CurrencyCodeCardHolderBill() {
		return f51CurrencyCodeCardHolderBill;
	}

	/**
	 * Sets the 域51 持卡人帐户货币代码 an3 string存储.
	 *
	 * @param f51CurrencyCodeCardHolderBill the f51CurrencyCodeCardHolderBill to set 域51 持卡人帐户货币代码 an3
	 * string存储
	 */
	public void setF51CurrencyCodeCardHolderBill(
			String f51CurrencyCodeCardHolderBill) {
		this.f51CurrencyCodeCardHolderBill = f51CurrencyCodeCardHolderBill;
	}

	/**
	 * Gets the 域52 个人识别码 b64 byte[]存储.
	 *
	 * @return the f52PinData 域52 个人识别码 b64 byte[]存储
	 */
	public byte[] getF52PinData() {
		if (this.f52PinData != null) {
			return this.f52PinData.clone();
		}
		return null;
	}

	/**
	 * Sets the 域52 个人识别码 b64 byte[]存储.
	 *
	 * @param f52PinData the f52PinData to set 域52 个人识别码 b64 byte[]存储
	 */
	public void setF52PinData(byte[] f52PinData) {
		if (f52PinData != null) {
			this.f52PinData = f52PinData.clone();

		}
	}

	/**
	 * Gets the 域53 安全控制信息 n16 String存储.
	 *
	 * @return the f53SecurityRelatedControlInfo 域53 安全控制信息 n16 String存储
	 */
	public String getF53SecurityRelatedControlInfo() {
		return f53SecurityRelatedControlInfo;
	}

	/**
	 * Sets the 域53 安全控制信息 n16 String存储.
	 *
	 * @param f53SecurityRelatedControlInfo the f53SecurityRelatedControlInfo to set 域53 安全控制信息 n16
	 * String存储
	 */
	public void setF53SecurityRelatedControlInfo(
			String f53SecurityRelatedControlInfo) {
		this.f53SecurityRelatedControlInfo = f53SecurityRelatedControlInfo;
	}

	/**
	 * Gets the 域54 余额信息 LLLVAR an.
	 *
	 * @return the f54AdditionalAmount 域54 余额信息 LLLVAR an..040.
	 */
	public F54AdditionalAmount getF54AdditionalAmount() {
		return f54AdditionalAmount;
	}

	/**
	 * Sets the 域54 余额信息 LLLVAR an.
	 *
	 * @param f54AdditionalAmount the f54AdditionalAmount to set 域54 余额信息 LLLVAR an..040.
	 */
	public void setF54AdditionalAmount(F54AdditionalAmount f54AdditionalAmount) {
		this.f54AdditionalAmount = f54AdditionalAmount;
	}

	/**
	 * Gets the 域55IC卡数据域 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @return the f55ICCSystemData 域55IC卡数据域 LLLVAR ans。。。999 byte[]存储
	 */
	public byte[] getF55ICCSystemData() {
		if (this.f55ICCSystemData != null) {
			return this.f55ICCSystemData.clone();
		}
		return null;
	}

	/**
	 * Sets the 域55IC卡数据域 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @param f55iccSystemData the f55ICCSystemData to set 域55IC卡数据域 LLLVAR ans。。。999
	 * byte[]存储
	 */
	public void setF55ICCSystemData(byte[] f55iccSystemData) {
		if (f55iccSystemData != null) {
			this.f55ICCSystemData = f55iccSystemData.clone();
		}
	}

	/**
	 * Gets the 域56 行业保留使用 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @return the f56ReservedIso 域56 行业保留使用 LLLVAR ans。。。999 byte[]存储
	 */
	public byte[] getF56ReservedIso() {
		if (this.f56ReservedIso != null) {
			return this.f56ReservedIso.clone();
		}
		return null;
	}

	/**
	 * Sets the 域56 行业保留使用 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @param f56ReservedIso the f56ReservedIso to set 域56 行业保留使用 LLLVAR ans。。。999 byte[]存储
	 */
	public void setF56ReservedIso(byte[] f56ReservedIso) {
		if (f56ReservedIso != null) {
		this.f56ReservedIso = f56ReservedIso.clone();}
	}

	/**
	 * Gets the 域57 附加交易信息 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @return the f57AdditionalInfo 域57 附加交易信息 LLLVAR ans。。。999 byte[]存储
	 */
	public byte[] getF57AdditionalInfo() {
		if (this.f57AdditionalInfo != null) {
			return this.f57AdditionalInfo.clone();
		}
		return null;

	}

	/**
	 * Sets the 域57 附加交易信息 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @param f57AdditionalInfo the f57AdditionalInfo to set 域57 附加交易信息 LLLVAR ans。。。999
	 * byte[]存储
	 */
	public void setF57AdditionalInfo(byte[] f57AdditionalInfo) {
		if (f57AdditionalInfo != null) {
			this.f57AdditionalInfo = f57AdditionalInfo.clone();
		}
	}

	/**
	 * Gets the 域58 IC卡数据域（pboc） LLLVAR ans。。。999 byte[]存储.
	 *
	 * @return the f58IcPbocData 域58 IC卡数据域（pboc） LLLVAR ans。。。999 byte[]存储
	 */
	public byte[] getF58IcPbocData() {
		if (this.f58IcPbocData != null) {
			return this.f58IcPbocData.clone();
		}
		return null;
	}

	/**
	 * Sets the 域58 IC卡数据域（pboc） LLLVAR ans。。。999 byte[]存储.
	 *
	 * @param f58IcPbocData the f58IcPbocData to set 域58 IC卡数据域（pboc） LLLVAR ans。。。999
	 * byte[]存储
	 */
	public void setF58IcPbocData(byte[] f58IcPbocData) {
		if (f58IcPbocData != null) {
			this.f58IcPbocData = f58IcPbocData.clone();
		}
	}

	/**
	 * Gets the 域59 私有保留使用 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @return the f59ReservedPrivate 域59 私有保留使用 LLLVAR ans。。。999 byte[]存储
	 */
	public byte[] getF59ReservedPrivate() {
		if (this.f59ReservedPrivate != null) {
			return this.f59ReservedPrivate.clone();
		}
		return null;

	}

	/**
	 * Sets the 域59 私有保留使用 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @param f59ReservedPrivate the f59ReservedPrivate to set 域59 私有保留使用 LLLVAR ans。。。999
	 * byte[]存储
	 */
	public void setF59ReservedPrivate(byte[] f59ReservedPrivate) {
		if (f59ReservedPrivate != null) {
		this.f59ReservedPrivate = f59ReservedPrivate.clone();}
	}

	/**
	 * Gets the 域60 服务点附加信息 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @return the f60PosAdditionalInfo 域60 服务点附加信息 LLLVAR ans。。。999 String 存储
	 */
	public F60Extend getF60PosAdditionalInfo() {
		return this.f60PosAdditionalInfo;
	}

	/**
	 * Sets the 域60 服务点附加信息 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @param f60PosAdditionalInfo the f60PosAdditionalInfo to set 域60 服务点附加信息 LLLVAR ans。。。999
	 * String 存储
	 */
	public void setF60PosAdditionalInfo(F60Extend f60PosAdditionalInfo) {
		this.f60PosAdditionalInfo = f60PosAdditionalInfo;
	}

	/**
	 * Gets the 域61 Original Message LLLVAR N.
	 *
	 * @return the 域61 Original Message LLLVAR N
	 */
	public F61Extend getF61OriginalMessage() {
		return f61OriginalMessage;
	}

	/**
	 * Sets the 域61 Original Message LLLVAR N.
	 *
	 * @param f61OriginalMessage the new 域61 Original Message LLLVAR N
	 */
	public void setF61OriginalMessage(F61Extend f61OriginalMessage) {
		this.f61OriginalMessage = f61OriginalMessage;
	}

	/**
	 * Gets the 域62 私有保留使用 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @return the f62ReservedPrivate 域62 私有保留使用 LLLVAR ans。。。999 byte[]存储
	 */
	public byte[] getF62ReservedPrivate() {
		if (this.f62ReservedPrivate != null) {
			return this.f62ReservedPrivate.clone();
		}
		return null;

	}

	/**
	 * Sets the 域62 私有保留使用 LLLVAR ans。。。999 byte[]存储.
	 *
	 * @param f62ReservedPrivate the f62ReservedPrivate to set 域62 私有保留使用 LLLVAR ans。。。999
	 * byte[]存储
	 */
	public void setF62ReservedPrivate(byte[] f62ReservedPrivate) {
		if (f62ReservedPrivate!=null){
		this.f62ReservedPrivate = f62ReservedPrivate.clone();}
	}



	/**
	 * @return the f63ReservedPrivate
	 * 域63 私有保留使用 ANS...163(LLLVAR)，3个字节的长度值＋最大163个字节的数据
	 */
	public F63ReservedPrivate getF63ReservedPrivate() {
		return f63ReservedPrivate;
	}

	/**
	 * @param f63ReservedPrivate the f63ReservedPrivate to set
	 * 域63 私有保留使用 ANS...163(LLLVAR)，3个字节的长度值＋最大163个字节的数据
	 */
	public void setF63ReservedPrivate(F63ReservedPrivate f63ReservedPrivate) {
		this.f63ReservedPrivate = f63ReservedPrivate;
	}

	/**
	 * Gets the 域64 报文鉴别码 b64 byte[]存储.
	 *
	 * @return the f64MessageAuthCode 域64 报文鉴别码 b64 byte[]存储
	 */
	public byte[] getF64MessageAuthCode() {
		if (this.f64MessageAuthCode != null) {
			return this.f64MessageAuthCode.clone();
		}
		return null;
	}

	/**
	 * Sets the 域64 报文鉴别码 b64 byte[]存储.
	 *
	 * @param f64MessageAuthCode the f64MessageAuthCode to set 域64 报文鉴别码 b64 byte[]存储
	 */
	public void setF64MessageAuthCode(byte[] f64MessageAuthCode) {
		if (f64MessageAuthCode!=null){
		this.f64MessageAuthCode = f64MessageAuthCode.clone();}
	}

	/**
	 * Gets the 域66 清算代码 n1 string存储.
	 *
	 * @return the f66Settlementcode 域66 清算代码 n1 string存储.
	 */
	public String getF66Settlementcode() {
		return f66Settlementcode;
	}

	/**
	 * Sets the 域66 清算代码 n1 string存储.
	 *
	 * @param f66Settlementcode the f66Settlementcode to set 域66 清算代码 n1 string存储.
	 */
	public void setF66Settlementcode(String f66Settlementcode) {
		this.f66Settlementcode = f66Settlementcode;
	}

	/**
	 * Gets the 域67 扩展的支付代码 n2 String存储.
	 *
	 * @return the f67Extendedpaymentcode 域67 扩展的支付代码 n2 String存储.
	 */
	public String getF67Extendedpaymentcode() {
		return f67Extendedpaymentcode;
	}

	/**
	 * Sets the 域67 扩展的支付代码 n2 String存储.
	 *
	 * @param f67Extendedpaymentcode the f67Extendedpaymentcode to set 域67 扩展的支付代码 n2 String存储.
	 */
	public void setF67Extendedpaymentcode(String f67Extendedpaymentcode) {
		this.f67Extendedpaymentcode = f67Extendedpaymentcode;
	}

	/**
	 * Gets the 域68 接收机构国家代码 n3 String存储.
	 *
	 * @return the f68ReceiveInstCountryCode 域68 接收机构国家代码 n3 String存储.
	 */
	public String getF68ReceiveInstCountryCode() {
		return f68ReceiveInstCountryCode;
	}

	/**
	 * Sets the 域68 接收机构国家代码 n3 String存储.
	 *
	 * @param f68ReceiveInstCountryCode the f68ReceiveInstCountryCode to set 域68 接收机构国家代码 n3 String存储.
	 */
	public void setF68ReceiveInstCountryCode(String f68ReceiveInstCountryCode) {
		this.f68ReceiveInstCountryCode = f68ReceiveInstCountryCode;
	}

	/**
	 * Gets the 域69 清算机构国际代码 n3 String存储.
	 *
	 * @return the f69SettleInstCountryCode 域69 清算机构国际代码 n3 String存储.
	 */
	public String getF69SettleInstCountryCode() {
		return f69SettleInstCountryCode;
	}

	/**
	 * Sets the 域69 清算机构国际代码 n3 String存储.
	 *
	 * @param f69SettleInstCountryCode the f69SettleInstCountryCode to set 域69 清算机构国际代码 n3 String存储.
	 */
	public void setF69SettleInstCountryCode(String f69SettleInstCountryCode) {
		this.f69SettleInstCountryCode = f69SettleInstCountryCode;
	}

	/**
	 * Gets the 域70 网络管理代码 n3 String存储.
	 *
	 * @return the f70NetworkManInfoCode 域70 网络管理代码 n3 String存储.
	 */
	public String getF70NetworkManInfoCode() {
		return f70NetworkManInfoCode;
	}

	/**
	 * Sets the 域70 网络管理代码 n3 String存储.
	 *
	 * @param f70NetworkManInfoCode the f70NetworkManInfoCode to set 域70 网络管理代码 n3 String存储.
	 */
	public void setF70NetworkManInfoCode(String f70NetworkManInfoCode) {
		this.f70NetworkManInfoCode = f70NetworkManInfoCode;
	}

	/**
	 * Gets the 域71 报文编号 n4 String存储.
	 *
	 * @return the f71MessageNum 域71 报文编号 n4 String存储.
	 */
	public String getF71MessageNum() {
		return f71MessageNum;
	}

	/**
	 * Sets the 域71 报文编号 n4 String存储.
	 *
	 * @param f71MessageNum the f71MessageNum to set 域71 报文编号 n4 String存储.
	 */
	public void setF71MessageNum(String f71MessageNum) {
		this.f71MessageNum = f71MessageNum;
	}

	/**
	 * Gets the 域72 后 报文编号 n4 String存储.
	 *
	 * @return the f72MessageNumLast 域72 报文编号 n4 String存储.
	 */
	public String getF72MessageNumLast() {
		return f72MessageNumLast;
	}

	/**
	 * Sets the 域72 后 报文编号 n4 String存储.
	 *
	 * @param f72MessageNumLast the f72MessageNumLast to set 域72 后 报文编号 n4 String存储.
	 */
	public void setF72MessageNumLast(String f72MessageNumLast) {
		this.f72MessageNumLast = f72MessageNumLast;
	}

	/**
	 * Gets the 域73 动作日期 YYYMMDD String存储.
	 *
	 * @return the f73ActionDate 域73 动作日期 YYYMMDD String存储
	 */
	public String getF73ActionDate() {
		return f73ActionDate;
	}

	/**
	 * Sets the 域73 动作日期 YYYMMDD String存储.
	 *
	 * @param f73ActionDate the f73ActionDate to set 域73 动作日期 YYYMMDD String存储
	 */
	public void setF73ActionDate(String f73ActionDate) {
		this.f73ActionDate = f73ActionDate;
	}

	/**
	 * Gets the 域74 贷记笔数 n10 Long存储.
	 *
	 * @return the f74CreditsNum 域74 贷记笔数 n10 Long存储
	 */
	public Long getF74CreditsNum() {
		return f74CreditsNum;
	}

	/**
	 * Sets the 域74 贷记笔数 n10 Long存储.
	 *
	 * @param f74CreditsNum the f74CreditsNum to set 域74 贷记笔数 n10 Long存储
	 */
	public void setF74CreditsNum(Long f74CreditsNum) {
		this.f74CreditsNum = f74CreditsNum;
	}

	/**
	 * Gets the 域75 撤销 贷记笔数 n10 Long存储.
	 *
	 * @return the f75CreditsRevertNum 域75 撤销 贷记笔数 n10 Long存储
	 */
	public Long getF75CreditsRevertNum() {
		return f75CreditsRevertNum;
	}

	/**
	 * Sets the 域75 撤销 贷记笔数 n10 Long存储.
	 *
	 * @param f75CreditsRevertNum the f75CreditsRevertNum to set 域75 撤销 贷记笔数 n10 Long存储
	 */
	public void setF75CreditsRevertNum(Long f75CreditsRevertNum) {
		this.f75CreditsRevertNum = f75CreditsRevertNum;
	}

	/**
	 * Gets the 域76 借记笔数 n10 Long存储.
	 *
	 * @return the f76DebitsNum 域76 借记笔数 n10 Long存储
	 */
	public Long getF76DebitsNum() {
		return f76DebitsNum;
	}

	/**
	 * Sets the 域76 借记笔数 n10 Long存储.
	 *
	 * @param f76DebitsNum the f76DebitsNum to set 域76 借记笔数 n10 Long存储
	 */
	public void setF76DebitsNum(Long f76DebitsNum) {
		this.f76DebitsNum = f76DebitsNum;
	}

	/**
	 * Gets the 域77 撤销 借记笔数 n10 Long存储.
	 *
	 * @return the f77DebitsRevertNum 域77 撤销 借记笔数 n10 Long存储
	 */
	public Long getF77DebitsRevertNum() {
		return f77DebitsRevertNum;
	}

	/**
	 * Sets the 域77 撤销 借记笔数 n10 Long存储.
	 *
	 * @param f77DebitsRevertNum the f77DebitsRevertNum to set 域77 撤销 借记笔数 n10 Long存储
	 */
	public void setF77DebitsRevertNum(Long f77DebitsRevertNum) {
		this.f77DebitsRevertNum = f77DebitsRevertNum;
	}

	/**
	 * Gets the 域78 转帐笔数 n10 Long存储.
	 *
	 * @return the f78TransferNum 域78 转帐笔数 n10 Long存储
	 */
	public Long getF78TransferNum() {
		return f78TransferNum;
	}

	/**
	 * Sets the 域78 转帐笔数 n10 Long存储.
	 *
	 * @param f78TransferNum the f78TransferNum to set 域78 转帐笔数 n10 Long存储
	 */
	public void setF78TransferNum(Long f78TransferNum) {
		this.f78TransferNum = f78TransferNum;
	}

	/**
	 * Gets the 域79 撤销转帐笔数 n10 Long存储.
	 *
	 * @return the f79TransferRevertNum 域79 撤销转帐笔数 n10 Long存储
	 */
	public Long getF79TransferRevertNum() {
		return f79TransferRevertNum;
	}

	/**
	 * Sets the 域79 撤销转帐笔数 n10 Long存储.
	 *
	 * @param f79TransferRevertNum the f79TransferRevertNum to set 域79 撤销转帐笔数 n10 Long存储
	 */
	public void setF79TransferRevertNum(Long f79TransferRevertNum) {
		this.f79TransferRevertNum = f79TransferRevertNum;
	}

	/**
	 * Gets the 域80 查询笔数 n10 Long存储.
	 *
	 * @return the f80InquiresNum 域80 查询笔数 n10 Long存储
	 */
	public Long getF80InquiresNum() {
		return f80InquiresNum;
	}

	/**
	 * Sets the 域80 查询笔数 n10 Long存储.
	 *
	 * @param f80InquiresNum the f80InquiresNum to set 域80 查询笔数 n10 Long存储
	 */
	public void setF80InquiresNum(Long f80InquiresNum) {
		this.f80InquiresNum = f80InquiresNum;
	}

	/**
	 * Gets the 域81 授权笔数 n10 Long存储.
	 *
	 * @return the f81AuthNum 域81 授权笔数 n10 Long存储
	 */
	public Long getF81AuthNum() {
		return f81AuthNum;
	}

	/**
	 * Sets the 域81 授权笔数 n10 Long存储.
	 *
	 * @param f81AuthNum the f81AuthNum to set 域81 授权笔数 n10 Long存储
	 */
	public void setF81AuthNum(Long f81AuthNum) {
		this.f81AuthNum = f81AuthNum;
	}

	/**
	 * Gets the 域82 贷记处理费金额 n12 Long存储.
	 *
	 * @return the f82CreditsProcessFeeAmt 域82 贷记处理费金额 n12 Long存储
	 */
	public Long getF82CreditsProcessFeeAmt() {
		return f82CreditsProcessFeeAmt;
	}

	/**
	 * Sets the 域82 贷记处理费金额 n12 Long存储.
	 *
	 * @param f82CreditsProcessFeeAmt the f82CreditsProcessFeeAmt to set 域82 贷记处理费金额 n12 Long存储
	 */
	public void setF82CreditsProcessFeeAmt(Long f82CreditsProcessFeeAmt) {
		this.f82CreditsProcessFeeAmt = f82CreditsProcessFeeAmt;
	}

	/**
	 * Gets the 域83 贷记交易费金额 n12 Long存储.
	 *
	 * @return the f83CreditsTransFeeAmt 域83 贷记交易费金额 n12 Long存储
	 */
	public Long getF83CreditsTransFeeAmt() {
		return f83CreditsTransFeeAmt;
	}

	/**
	 * Sets the 域83 贷记交易费金额 n12 Long存储.
	 *
	 * @param f83CreditsTransFeeAmt the f83CreditsTransFeeAmt to set 域83 贷记交易费金额 n12 Long存储
	 */
	public void setF83CreditsTransFeeAmt(Long f83CreditsTransFeeAmt) {
		this.f83CreditsTransFeeAmt = f83CreditsTransFeeAmt;
	}

	/**
	 * Gets the 域84 借记处理费金额 n12 Long存储.
	 *
	 * @return the f84DebitsProcessFeeAmt 域84 借记处理费金额 n12 Long存储
	 */
	public Long getF84DebitsProcessFeeAmt() {
		return f84DebitsProcessFeeAmt;
	}

	/**
	 * Sets the 域84 借记处理费金额 n12 Long存储.
	 *
	 * @param f84DebitsProcessFeeAmt the f84DebitsProcessFeeAmt to set 域84 借记处理费金额 n12 Long存储
	 */
	public void setF84DebitsProcessFeeAmt(Long f84DebitsProcessFeeAmt) {
		this.f84DebitsProcessFeeAmt = f84DebitsProcessFeeAmt;
	}

	/**
	 * Gets the 域85 借记记交易费金额 n12 Long存储.
	 *
	 * @return the f85DebitsTransFeeAmt 域85 借记记交易费金额 n12 Long存储
	 */
	public Long getF85DebitsTransFeeAmt() {
		return f85DebitsTransFeeAmt;
	}

	/**
	 * Sets the 域85 借记记交易费金额 n12 Long存储.
	 *
	 * @param f85DebitsTransFeeAmt the f85DebitsTransFeeAmt to set 域85 借记记交易费金额 n12 Long存储
	 */
	public void setF85DebitsTransFeeAmt(Long f85DebitsTransFeeAmt) {
		this.f85DebitsTransFeeAmt = f85DebitsTransFeeAmt;
	}

	/**
	 * Gets the 域86 贷记金额 n16 Long存储.
	 *
	 * @return the f86CreditsAmt 域86 贷记金额 n16 Long存储
	 */
	public Long getF86CreditsAmt() {
		return f86CreditsAmt;
	}

	/**
	 * Sets the 域86 贷记金额 n16 Long存储.
	 *
	 * @param f86CreditsAmt the f86CreditsAmt to set 域86 贷记金额 n16 Long存储
	 */
	public void setF86CreditsAmt(Long f86CreditsAmt) {
		this.f86CreditsAmt = f86CreditsAmt;
	}

	/**
	 * Gets the 域87 撤销 贷记金额 n16 Long存储.
	 *
	 * @return the f87CreditsRevertAmt 域87 撤销 贷记金额 n16 Long存储
	 */
	public Long getF87CreditsRevertAmt() {
		return f87CreditsRevertAmt;
	}

	/**
	 * Sets the 域87 撤销 贷记金额 n16 Long存储.
	 *
	 * @param f87CreditsRevertAmt the f87CreditsRevertAmt to set 域87 撤销 贷记金额 n16 Long存储
	 */
	public void setF87CreditsRevertAmt(Long f87CreditsRevertAmt) {
		this.f87CreditsRevertAmt = f87CreditsRevertAmt;
	}

	/**
	 * Gets the 域88 借记金额 n16 Long存储.
	 *
	 * @return the f88DebitsAmt 域88 借记金额 n16 Long存储
	 */
	public Long getF88DebitsAmt() {
		return f88DebitsAmt;
	}

	/**
	 * Sets the 域88 借记金额 n16 Long存储.
	 *
	 * @param f88DebitsAmt the f88DebitsAmt to set 域88 借记金额 n16 Long存储
	 */
	public void setF88DebitsAmt(Long f88DebitsAmt) {
		this.f88DebitsAmt = f88DebitsAmt;
	}

	/**
	 * Gets the 域89 撤销借记金额 n16 Long存储.
	 *
	 * @return the f89DebitsRevertAmt 域89 撤销借记金额 n16 Long存储
	 */
	public Long getF89DebitsRevertAmt() {
		return f89DebitsRevertAmt;
	}

	/**
	 * Sets the 域89 撤销借记金额 n16 Long存储.
	 *
	 * @param f89DebitsRevertAmt the f89DebitsRevertAmt to set 域89 撤销借记金额 n16 Long存储
	 */
	public void setF89DebitsRevertAmt(Long f89DebitsRevertAmt) {
		this.f89DebitsRevertAmt = f89DebitsRevertAmt;
	}

	/**
	 * Gets the 域90 原始数据元 n42 String存储.
	 *
	 * @return the f90OrigDataElement 域90 原始数据元 n42 String存储
	 */
	public String getF90OrigDataElement() {
		return f90OrigDataElement;
	}

	/**
	 * Sets the 域90 原始数据元 n42 String存储.
	 *
	 * @param f90OrigDataElement the f90OrigDataElement to set 域90 原始数据元 n42 String存储
	 */
	public void setF90OrigDataElement(String f90OrigDataElement) {
		this.f90OrigDataElement = f90OrigDataElement;
	}

	/**
	 * Gets the 域91 文件更新代码 an1 String存储.
	 *
	 * @return the f91FileUpdateCode 域91 文件更新代码 an1 String存储
	 */
	public String getF91FileUpdateCode() {
		return f91FileUpdateCode;
	}

	/**
	 * Sets the 域91 文件更新代码 an1 String存储.
	 *
	 * @param f91FileUpdateCode the f91FileUpdateCode to set 域91 文件更新代码 an1 String存储
	 */
	public void setF91FileUpdateCode(String f91FileUpdateCode) {
		this.f91FileUpdateCode = f91FileUpdateCode;
	}

	/**
	 * Gets the 域92 文件保密代码 an2 String存储.
	 *
	 * @return the f92FileSecurityCode 域92 文件保密代码 an2 String存
	 */
	public String getF92FileSecurityCode() {
		return f92FileSecurityCode;
	}

	/**
	 * Sets the 域92 文件保密代码 an2 String存储.
	 *
	 * @param f92FileSecurityCode the f92FileSecurityCode to set 域92 文件保密代码 an2 String存
	 */
	public void setF92FileSecurityCode(String f92FileSecurityCode) {
		this.f92FileSecurityCode = f92FileSecurityCode;
	}

	/**
	 * Gets the 域93 响应指示符 an5 String存储.
	 *
	 * @return the f93ResponseIndicator 域93 响应指示符 an5 String存储
	 */
	public String getF93ResponseIndicator() {
		return f93ResponseIndicator;
	}

	/**
	 * Sets the 域93 响应指示符 an5 String存储.
	 *
	 * @param f93ResponseIndicator the f93ResponseIndicator to set 域93 响应指示符 an5 String存储
	 */
	public void setF93ResponseIndicator(String f93ResponseIndicator) {
		this.f93ResponseIndicator = f93ResponseIndicator;
	}

	/**
	 * Gets the 域94 服务指示符 an7 String存储.
	 *
	 * @return the f94ServiceIndicator 域94 服务指示符 an7 String存储
	 */
	public String getF94ServiceIndicator() {
		return f94ServiceIndicator;
	}

	/**
	 * Sets the 域94 服务指示符 an7 String存储.
	 *
	 * @param f94ServiceIndicator the f94ServiceIndicator to set 域94 服务指示符 an7 String存储
	 */
	public void setF94ServiceIndicator(String f94ServiceIndicator) {
		this.f94ServiceIndicator = f94ServiceIndicator;
	}

	/**
	 * Gets the 域95 替换金额 an42 String存储.
	 *
	 * @return the f95ReplacementAmt 域95 替换金额 an42 String存储
	 */
	public String getF95ReplacementAmt() {
		return f95ReplacementAmt;
	}

	/**
	 * Sets the 域95 替换金额 an42 String存储.
	 *
	 * @param f95ReplacementAmt the f95ReplacementAmt to set 域95 替换金额 an42 String存储
	 */
	public void setF95ReplacementAmt(String f95ReplacementAmt) {
		this.f95ReplacementAmt = f95ReplacementAmt;
	}

	/**
	 * Gets the 域96 报文安全码 b64 byte[]存储.
	 *
	 * @return the f96MessageSecurityCode 域96 报文安全码 b64 byte[]存储
	 */
	public byte[] getF96MessageSecurityCode() {
		if (f96MessageSecurityCode == null) {
			return null;
		}
		return f96MessageSecurityCode.clone();

	}

	/**
	 * Sets the 域96 报文安全码 b64 byte[]存储.
	 *
	 * @param f96MessageSecurityCode the f96MessageSecurityCode to set 域96 报文安全码 b64 byte[]存储
	 */
	public void setF96MessageSecurityCode(byte[] f96MessageSecurityCode) {
		if (f96MessageSecurityCode!=null){
		this.f96MessageSecurityCode = f96MessageSecurityCode.clone();}
	}

	/**
	 * Gets the 域97 净清算额 x+n16 String存储.
	 *
	 * @return the f97NetSettleAmt 域97 净清算额 x+n16 String存储
	 */
	public String getF97NetSettleAmt() {
		return f97NetSettleAmt;
	}

	/**
	 * Sets the 域97 净清算额 x+n16 String存储.
	 *
	 * @param f97NetSettleAmt the f97NetSettleAmt to set 域97 净清算额 x+n16 String存储
	 */
	public void setF97NetSettleAmt(String f97NetSettleAmt) {
		this.f97NetSettleAmt = f97NetSettleAmt;
	}

	/**
	 * Gets the 域98 收款人 ans25 String存储.
	 *
	 * @return the f98Payee 域98 收款人 ans25 String存储
	 */
	public String getF98Payee() {
		return f98Payee;
	}

	/**
	 * Sets the 域98 收款人 ans25 String存储.
	 *
	 * @param f98Payee the f98Payee to set 域98 收款人 ans25 String存储
	 */
	public void setF98Payee(String f98Payee) {
		this.f98Payee = f98Payee;
	}

	/**
	 * Gets the 域99 清算机构标识码 LLVAR n.
	 *
	 * @return the f99SettleInstIdCode 域99 清算机构标识码 LLVAR n..11 String存储
	 */
	public String getF99SettleInstIdCode() {
		return f99SettleInstIdCode;
	}

	/**
	 * Sets the 域99 清算机构标识码 LLVAR n.
	 *
	 * @param f99SettleInstIdCode the f99SettleInstIdCode to set 域99 清算机构标识码 LLVAR n..11
	 * String存储
	 */
	public void setF99SettleInstIdCode(String f99SettleInstIdCode) {
		this.f99SettleInstIdCode = f99SettleInstIdCode;
	}

	/**
	 * Gets the 域100 接收机构标识码 LLVAR n.
	 *
	 * @return the f100ReceiveInstIdCode 域100 接收机构标识码 LLVAR n..11 String存储
	 */
	public String getF100ReceiveInstIdCode() {
		return f100ReceiveInstIdCode;
	}

	/**
	 * Sets the 域100 接收机构标识码 LLVAR n.
	 *
	 * @param f100ReceiveInstIdCode the f100ReceiveInstIdCode to set 域100 接收机构标识码 LLVAR n..11
	 * String存储
	 */
	public void setF100ReceiveInstIdCode(String f100ReceiveInstIdCode) {
		this.f100ReceiveInstIdCode = f100ReceiveInstIdCode;
	}

	/**
	 * Gets the 域101 文件名称 LLVAR ans.
	 *
	 * @return the f101FileName 域101 文件名称 LLVAR ans..17 String存储
	 */
	public String getF101FileName() {
		return f101FileName;
	}

	/**
	 * Sets the 域101 文件名称 LLVAR ans.
	 *
	 * @param f101FileName the f101FileName to set 域101 文件名称 LLVAR ans..17 String存储
	 */
	public void setF101FileName(String f101FileName) {
		this.f101FileName = f101FileName;
	}

	/**
	 * Gets the 域102 帐户标识1 LLVAR ans.
	 *
	 * @return the f102AccountId1 域102 帐户标识1 LLVAR ans..28 String存储
	 */
	public String getF102AccountId1() {
		return f102AccountId1;
	}

	/**
	 * Sets the 域102 帐户标识1 LLVAR ans.
	 *
	 * @param f102AccountId1 the f102AccountId1 to set 域102 帐户标识1 LLVAR ans..28 String存储
	 */
	public void setF102AccountId1(String f102AccountId1) {
		this.f102AccountId1 = f102AccountId1;
	}

	/**
	 * Gets the 域103 帐户标识2 LLVAR ans.
	 *
	 * @return the f103AccountId2 域103 帐户标识2 LLVAR ans..28 String存储
	 */
	public String getF103AccountId2() {
		return f103AccountId2;
	}

	/**
	 * Sets the 域103 帐户标识2 LLVAR ans.
	 *
	 * @param f103AccountId2 the f103AccountId2 to set 域103 帐户标识2 LLVAR ans..28 String存储
	 */
	public void setF103AccountId2(String f103AccountId2) {
		this.f103AccountId2 = f103AccountId2;
	}

	/**
	 * Gets the 域104 交易说明 LLVAR ans.
	 *
	 * @return the f104TransDescription 域104 交易说明 LLVAR ans..100 String存储
	 */
	public String getF104TransDescription() {
		return f104TransDescription;
	}

	/**
	 * Sets the 域104 交易说明 LLVAR ans.
	 *
	 * @param f104TransDescription the f104TransDescription to set 域104 交易说明 LLVAR ans..100
	 * String存储
	 */
	public void setF104TransDescription(String f104TransDescription) {
		this.f104TransDescription = f104TransDescription;
	}

	/**
	 * Gets the 域105 行业保留使用 LLVAR ans.
	 *
	 * @return the f105ReservedForIsoUse 域105 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF105ReservedForIsoUse() {
		return f105ReservedForIsoUse;
	}

	/**
	 * Sets the 域105 行业保留使用 LLVAR ans.
	 *
	 * @param f105ReservedForIsoUse the f105ReservedForIsoUse to set 域105 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF105ReservedForIsoUse(String f105ReservedForIsoUse) {
		this.f105ReservedForIsoUse = f105ReservedForIsoUse;
	}

	/**
	 * Gets the 域106 行业保留使用 LLVAR ans.
	 *
	 * @return the f106ReservedForIsoUse 域106 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF106ReservedForIsoUse() {
		return f106ReservedForIsoUse;
	}

	/**
	 * Sets the 域106 行业保留使用 LLVAR ans.
	 *
	 * @param f106ReservedForIsoUse the f106ReservedForIsoUse to set 域106 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF106ReservedForIsoUse(String f106ReservedForIsoUse) {
		this.f106ReservedForIsoUse = f106ReservedForIsoUse;
	}

	/**
	 * Gets the 域107 行业保留使用 LLVAR ans.
	 *
	 * @return the f107ReservedForIsoUse 域107 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF107ReservedForIsoUse() {
		return f107ReservedForIsoUse;
	}

	/**
	 * Sets the 域107 行业保留使用 LLVAR ans.
	 *
	 * @param f107ReservedForIsoUse the f107ReservedForIsoUse to set 域107 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF107ReservedForIsoUse(String f107ReservedForIsoUse) {
		this.f107ReservedForIsoUse = f107ReservedForIsoUse;
	}

	/**
	 * Gets the 域108 行业保留使用 LLVAR ans.
	 *
	 * @return the f108ReservedForIsoUse 域108 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF108ReservedForIsoUse() {
		return f108ReservedForIsoUse;
	}

	/**
	 * Sets the 域108 行业保留使用 LLVAR ans.
	 *
	 * @param f108ReservedForIsoUse the f108ReservedForIsoUse to set 域108 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF108ReservedForIsoUse(String f108ReservedForIsoUse) {
		this.f108ReservedForIsoUse = f108ReservedForIsoUse;
	}

	/**
	 * Gets the 域109 行业保留使用 LLVAR ans.
	 *
	 * @return the f109ReservedForIsoUse 域109 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF109ReservedForIsoUse() {
		return f109ReservedForIsoUse;
	}

	/**
	 * Sets the 域109 行业保留使用 LLVAR ans.
	 *
	 * @param f109ReservedForIsoUse the f109ReservedForIsoUse to set 域109 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF109ReservedForIsoUse(String f109ReservedForIsoUse) {
		this.f109ReservedForIsoUse = f109ReservedForIsoUse;
	}

	/**
	 * Gets the 域110 行业保留使用 LLVAR ans.
	 *
	 * @return the f110ReservedForIsoUse 域110 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF110ReservedForIsoUse() {
		return f110ReservedForIsoUse;
	}

	/**
	 * Sets the 域110 行业保留使用 LLVAR ans.
	 *
	 * @param f110ReservedForIsoUse the f110ReservedForIsoUse to set 域110 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF110ReservedForIsoUse(String f110ReservedForIsoUse) {
		this.f110ReservedForIsoUse = f110ReservedForIsoUse;
	}

	/**
	 * Gets the 域111 行业保留使用 LLVAR ans.
	 *
	 * @return the f111ReservedForIsoUse 域111 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF111ReservedForIsoUse() {
		return f111ReservedForIsoUse;
	}

	/**
	 * Sets the 域111 行业保留使用 LLVAR ans.
	 *
	 * @param f111ReservedForIsoUse the f111ReservedForIsoUse to set 域111 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF111ReservedForIsoUse(String f111ReservedForIsoUse) {
		this.f111ReservedForIsoUse = f111ReservedForIsoUse;
	}

	/**
	 * Gets the 域112 行业保留使用 LLVAR ans.
	 *
	 * @return the f112ReservedForIsoUse 域112 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF112ReservedForIsoUse() {
		return f112ReservedForIsoUse;
	}

	/**
	 * Sets the 域112 行业保留使用 LLVAR ans.
	 *
	 * @param f112ReservedForIsoUse the f112ReservedForIsoUse to set 域112 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF112ReservedForIsoUse(String f112ReservedForIsoUse) {
		this.f112ReservedForIsoUse = f112ReservedForIsoUse;
	}

	/**
	 * Gets the 域113 行业保留使用 LLVAR ans.
	 *
	 * @return the f113ReservedForIsoUse 域113 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF113ReservedForIsoUse() {
		return f113ReservedForIsoUse;
	}

	/**
	 * Sets the 域113 行业保留使用 LLVAR ans.
	 *
	 * @param f113ReservedForIsoUse the f113ReservedForIsoUse to set 域113 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF113ReservedForIsoUse(String f113ReservedForIsoUse) {
		this.f113ReservedForIsoUse = f113ReservedForIsoUse;
	}

	/**
	 * Gets the 域114 行业保留使用 LLVAR ans.
	 *
	 * @return the f114ReservedForIsoUse 域114 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF114ReservedForIsoUse() {
		return f114ReservedForIsoUse;
	}

	/**
	 * Sets the 域114 行业保留使用 LLVAR ans.
	 *
	 * @param f114ReservedForIsoUse the f114ReservedForIsoUse to set 域114 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF114ReservedForIsoUse(String f114ReservedForIsoUse) {
		this.f114ReservedForIsoUse = f114ReservedForIsoUse;
	}

	/**
	 * Gets the 域115 行业保留使用 LLVAR ans.
	 *
	 * @return the f115ReservedForIsoUse 域115 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF115ReservedForIsoUse() {
		return f115ReservedForIsoUse;
	}

	/**
	 * Sets the 域115 行业保留使用 LLVAR ans.
	 *
	 * @param f115ReservedForIsoUse the f115ReservedForIsoUse to set 域115 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF115ReservedForIsoUse(String f115ReservedForIsoUse) {
		this.f115ReservedForIsoUse = f115ReservedForIsoUse;
	}

	/**
	 * Gets the 域116 行业保留使用 LLVAR ans.
	 *
	 * @return the f116ReservedForBusiUse 域116 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF116ReservedForBusiUse() {
		return f116ReservedForBusiUse;
	}

	/**
	 * Sets the 域116 行业保留使用 LLVAR ans.
	 *
	 * @param f116ReservedForBusiUse the f116ReservedForBusiUse to set 域116 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF116ReservedForBusiUse(String f116ReservedForBusiUse) {
		this.f116ReservedForBusiUse = f116ReservedForBusiUse;
	}

	/**
	 * Gets the 域117 行业保留使用 LLVAR ans.
	 *
	 * @return the f117ReservedForBusiUse 域117 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF117ReservedForBusiUse() {
		return f117ReservedForBusiUse;
	}

	/**
	 * Sets the 域117 行业保留使用 LLVAR ans.
	 *
	 * @param f117ReservedForBusiUse the f117ReservedForBusiUse to set 域117 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF117ReservedForBusiUse(String f117ReservedForBusiUse) {
		this.f117ReservedForBusiUse = f117ReservedForBusiUse;
	}

	/**
	 * Gets the 域118 行业保留使用 LLVAR ans.
	 *
	 * @return the f118ReservedForBusiUse 域118 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF118ReservedForBusiUse() {
		return f118ReservedForBusiUse;
	}

	/**
	 * Sets the 域118 行业保留使用 LLVAR ans.
	 *
	 * @param f118ReservedForBusiUse the f118ReservedForBusiUse to set 域118 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF118ReservedForBusiUse(String f118ReservedForBusiUse) {
		this.f118ReservedForBusiUse = f118ReservedForBusiUse;
	}

	/**
	 * Gets the 域119行业保留使用 LLVAR ans.
	 *
	 * @return the f119ReservedForBusiUse 域119行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF119ReservedForBusiUse() {
		return f119ReservedForBusiUse;
	}

	/**
	 * Sets the 域119行业保留使用 LLVAR ans.
	 *
	 * @param f119ReservedForBusiUse the f119ReservedForBusiUse to set 域119行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF119ReservedForBusiUse(String f119ReservedForBusiUse) {
		this.f119ReservedForBusiUse = f119ReservedForBusiUse;
	}

	/**
	 * Gets the 域120 行业保留使用 LLVAR ans.
	 *
	 * @return the f120ReservedForBusiUse 域120 行业保留使用 LLVAR ans..999 String存储
	 */
	public String getF120ReservedForBusiUse() {
		return f120ReservedForBusiUse;
	}

	/**
	 * Sets the 域120 行业保留使用 LLVAR ans.
	 *
	 * @param f120ReservedForBusiUse the f120ReservedForBusiUse to set 域120 行业保留使用 LLVAR ans..999
	 * String存储
	 */
	public void setF120ReservedForBusiUse(String f120ReservedForBusiUse) {
		this.f120ReservedForBusiUse = f120ReservedForBusiUse;
	}

	/**
	 * Gets the 域121 交换中心私用使用 LLVAR ans.
	 *
	 * @return the f121ReservedForSwitchCenter 域121 交换中心私用使用 LLVAR ans..999
	 * String存储
	 */
	public String getF121ReservedForSwitchCenter() {
		return f121ReservedForSwitchCenter;
	}

	/**
	 * Sets the 域121 交换中心私用使用 LLVAR ans.
	 *
	 * @param f121ReservedForSwitchCenter the f121ReservedForSwitchCenter to set 域121 交换中心私用使用 LLVAR
	 * ans..999 String存储
	 */
	public void setF121ReservedForSwitchCenter(
			String f121ReservedForSwitchCenter) {
		this.f121ReservedForSwitchCenter = f121ReservedForSwitchCenter;
	}

	/**
	 * Gets the 域122 受理方私用使用 LLVAR ans.
	 *
	 * @return the f122ReservedForAcquire 域122 受理方私用使用 LLVAR ans..999 String存储
	 */
	public String getF122ReservedForAcquire() {
		return f122ReservedForAcquire;
	}

	/**
	 * Sets the 域122 受理方私用使用 LLVAR ans.
	 *
	 * @param f122ReservedForAcquire the f122ReservedForAcquire to set 域122 受理方私用使用 LLVAR ans..999
	 * String存储
	 */
	public void setF122ReservedForAcquire(String f122ReservedForAcquire) {
		this.f122ReservedForAcquire = f122ReservedForAcquire;
	}

	/**
	 * Gets the 域123 发卡机构私用使用 LLVAR ans.
	 *
	 * @return the f123ReservedForIssuer 域123 发卡机构私用使用 LLVAR ans..999 String存储
	 */
	public String getF123ReservedForIssuer() {
		return f123ReservedForIssuer;
	}

	/**
	 * Sets the 域123 发卡机构私用使用 LLVAR ans.
	 *
	 * @param f123ReservedForIssuer the f123ReservedForIssuer to set 域123 发卡机构私用使用 LLVAR ans..999
	 * String存储
	 */
	public void setF123ReservedForIssuer(String f123ReservedForIssuer) {
		this.f123ReservedForIssuer = f123ReservedForIssuer;
	}

	/**
	 * Gets the 域124 发卡机构私用使用 LLVAR ans.
	 *
	 * @return the f124ReservedForBusiUse 域124 发卡机构私用使用 LLVAR ans..999 String存储
	 */
	public String getF124ReservedForBusiUse() {
		return f124ReservedForBusiUse;
	}

	/**
	 * Sets the 域124 发卡机构私用使用 LLVAR ans.
	 *
	 * @param f124ReservedForBusiUse the f124ReservedForBusiUse to set 域124 发卡机构私用使用 LLVAR ans..999
	 * String存储
	 */
	public void setF124ReservedForBusiUse(String f124ReservedForBusiUse) {
		this.f124ReservedForBusiUse = f124ReservedForBusiUse;
	}

	/**
	 * Gets the 域125 发卡机构私用使用 LLVAR ans.
	 *
	 * @return the f125ReservedForBusiUse 域125 发卡机构私用使用 LLVAR ans..999 String存储
	 */
	public String getF125ReservedForBusiUse() {
		return f125ReservedForBusiUse;
	}

	/**
	 * Sets the 域125 发卡机构私用使用 LLVAR ans.
	 *
	 * @param f125ReservedForBusiUse the f125ReservedForBusiUse to set 域125 发卡机构私用使用 LLVAR ans..999
	 * String存储
	 */
	public void setF125ReservedForBusiUse(String f125ReservedForBusiUse) {
		this.f125ReservedForBusiUse = f125ReservedForBusiUse;
	}

	/**
	 * Gets the 域126 发卡机构私用使用 LLVAR ans.
	 *
	 * @return the f126ReservedForBusiUse 域126 发卡机构私用使用 LLVAR ans..999 String存储
	 */
	public String getF126ReservedForBusiUse() {
		return f126ReservedForBusiUse;
	}

	/**
	 * Sets the 域126 发卡机构私用使用 LLVAR ans.
	 *
	 * @param f126ReservedForBusiUse the f126ReservedForBusiUse to set 域126 发卡机构私用使用 LLVAR ans..999
	 * String存储
	 */
	public void setF126ReservedForBusiUse(String f126ReservedForBusiUse) {
		this.f126ReservedForBusiUse = f126ReservedForBusiUse;
	}

	/**
	 * Gets the 域127 发卡机构私用使用 LLVAR ans.
	 *
	 * @return the f127ReservedForBusiUse 域127 发卡机构私用使用 LLVAR ans..999 String存储
	 */
	public String getF127ReservedForBusiUse() {
		return f127ReservedForBusiUse;
	}

	/**
	 * Sets the 域127 发卡机构私用使用 LLVAR ans.
	 *
	 * @param f127ReservedForBusiUse the f127ReservedForBusiUse to set 域127 发卡机构私用使用 LLVAR ans..999
	 * String存储
	 */
	public void setF127ReservedForBusiUse(String f127ReservedForBusiUse) {
		this.f127ReservedForBusiUse = f127ReservedForBusiUse;
	}

	/**
	 * Gets the 域128 报文鉴别码 b64 byte[]存储.
	 *
	 * @return the f128MessageAuthCode 域128 报文鉴别码 b64 byte[]存储
	 */
	public byte[] getF128MessageAuthCode() {
		if (f128MessageAuthCode==null){
			return null;
		}
		return f128MessageAuthCode.clone();
	}

	/**
	 * Sets the 域128 报文鉴别码 b64 byte[]存储.
	 *
	 * @param f128MessageAuthCode the f128MessageAuthCode to set 域128 报文鉴别码 b64 byte[]存储
	 */
	public void setF128MessageAuthCode(byte[] f128MessageAuthCode) {
		if (f128MessageAuthCode!=null){
		this.f128MessageAuthCode = f128MessageAuthCode.clone();}
	}

}
