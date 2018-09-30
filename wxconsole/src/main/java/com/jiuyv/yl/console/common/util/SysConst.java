package com.jiuyv.yl.console.common.util;
/**
 * 定义系统所需要的静态路径
 * 
 * @author WangPeng
 * 
 */
public class SysConst {
	

	/**
	 * 应答报文 成功 0000  当为 非0000 均为失败
	 */
	public static String CORE_RES_SUCCESS="0000";
	
	/**
	 * 1字节报文性质
	 * 
	 * “X”-表示xml类型报文。
	 * 
	 */
	public static String CORE_MES_TYPE="X";
	
	/**
	 * 3字节包头长度
	 * 
	 * 为通讯头的全长，即上图灰色部分长度，固定为“057”。
	 * 
	 * @return
	 */
	public static String CORE_HEADER_LENGTH="057";
	
	/**
	 * 加密情况标志固定3字节。密码加密标志：表示通讯加密方式，固定3字节长度，第一字节：报文内账户密码等密码加密标志;第二字节：MAC加密标志;第三字节：报文加密标志。在无加密无校验的情况下可填写“000”。•详见第6节 加密说明。
	 * 不加密为 000 
	 */
	public static String CORE_ECP_MARK_000="000";
	/**
	 * 加密情况标志固定3字节。密码加密标志：表示通讯加密方式，固定3字节长度，第一字节：报文内账户密码等密码加密标志;第二字节：MAC加密标志;第三字节：报文加密标志。在无加密无校验的情况下可填写“000”。•详见第6节 加密说明。
	 * 100
	 */
	public static String CORE_ECP_MARK_100="100";
	/**
	 * 加密情况标志固定3字节。密码加密标志：表示通讯加密方式，固定3字节长度，第一字节：报文内账户密码等密码加密标志;第二字节：MAC加密标志;第三字节：报文加密标志。在无加密无校验的情况下可填写“000”。•详见第6节 加密说明。
	 * 110
	 */
	public static String CORE_ECP_MARK_110="110";
	/**
	 * 加密情况标志固定3字节。密码加密标志：表示通讯加密方式，固定3字节长度，第一字节：报文内账户密码等密码加密标志;第二字节：MAC加密标志;第三字节：报文加密标志。在无加密无校验的情况下可填写“000”。•详见第6节 加密说明。
	 * 111
	 */
	public static String CORE_ECP_MARK_111="111";
	/**
	 * 加密情况标志固定3字节。密码加密标志：表示通讯加密方式，固定3字节长度，第一字节：报文内账户密码等密码加密标志;第二字节：MAC加密标志;第三字节：报文加密标志。在无加密无校验的情况下可填写“000”。•详见第6节 加密说明。
	 * 001
	 */
	public static String CORE_ECP_MARK_001="001";
	/**
	 * 加密情况标志固定3字节。密码加密标志：表示通讯加密方式，固定3字节长度，第一字节：报文内账户密码等密码加密标志;第二字节：MAC加密标志;第三字节：报文加密标志。在无加密无校验的情况下可填写“000”。•详见第6节 加密说明。
	 * 011
	 */
	public static String CORE_ECP_MARK_011="011";
	
	
	/**
	 * 加密情况标志固定3字节。密码加密标志：表示通讯加密方式，固定3字节长度，第一字节：报文内账户密码等密码加密标志;第二字节：MAC加密标志;第三字节：报文加密标志。在无加密无校验的情况下可填写“000”。•详见第6节 加密说明。
	 * 默认加密为200 
	 */
	public static String CORE_ECP_MARK_200="200";
	
	/**
	 * 加密情况标志固定3字节。密码加密标志：表示通讯加密方式，固定3字节长度，第一字节：报文内账户密码等密码加密标志;第二字节：MAC加密标志;第三字节：报文加密标志。在无加密无校验的情况下可填写“000”。•详见第6节 加密说明。
	 * 如果是MD5 和3DES 加密 使用211
	 */
	public static String CORE_ECP_MARK_211="211";
	
	
	/**
	 * 8字节服务商代码
	 * 为与第三方存管系统连接的服务商的编号用于确定是哪家服务商。该编号可以由银行分配
	 */
	public static String CORE_CONTACT_CODE="80010000";
	//public static String CORE_CONTACT_CODE="10270000";
	
	/**
	 * 5字节交易码
	 *     为第三方管系统内部交易编码。
	 *   交易标记为： 30010  
	 */
	public static String CORE_TXN_CODE_30010="30010";
	
	/**
	 * 5字节交易码
	 *     为第三方管系统内部交易编码。
	 *   交易标记为： 34901  服务商签到(34901)
	 */
	public static String CORE_TXN_CODE_34901="34901";
	
	/**
	 * 5字节交易码
	 *     为第三方管系统内部交易编码。
	 *   交易标记为： 36700  密钥交换(36700)
	 */
	public static String CORE_TXN_CODE_36700="36700";
	
	/**
	 * 版本号<Ver>
	 * 
	 * 
	 * 
	 */
	public static String CORE_XML_VER="1.0";
	
	/**
	 * 应用系统类型<SysType>
	 * 
	 * 
	 * 
	 */
	public static String CORE_XML_SYSTYPE="5";
	
	/**
	 * 业务功能码<InstrCd>
	 * 
	 * 
	 * 
	 */
	public static String CORE_XML_INSTRCD_36700="36700";
	
	/**
	 * 交易发起方<TradSrc>
	 * 
	 * 
	 * 
	 */
	public static String CORE_XML_TRADSRC="0";
	
	/**
	 * 服务商机构类型<SvInst>
	 * 
	 * 
	 * 
	 */
	public static String CORE_XML_SENDER_INSTTYPE="0";
	
	/**
	 * 服务商机构号<SvInst>
	 * 
	 * 
	 * 
	 */
	public static String CORE_XML_SENDER_INSTID="80010000";
	//public static String CORE_XML_SENDER_INSTID="10270000";
	
	/**
	 * 银行机构信息<BkInst>
	 * 
	 * 
	 * 
	 */
	public static String CORE_XML_RECVER_INSTTYPE="1";
	
	/**
	 * 银行机构信息<BkInst>
	 * 
	 * 
	 * 
	 */
	public static String CORE_XML_RECVER_INSTID="1042900";
	
	/**
	 * 最后分片标志<IsLast>
	 * 
	 * 
	 * 
	 */
	public static String CORE_XML_ISLAST="0";
	
	
}
