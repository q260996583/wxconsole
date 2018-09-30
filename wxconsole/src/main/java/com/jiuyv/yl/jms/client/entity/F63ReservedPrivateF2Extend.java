package com.jiuyv.yl.jms.client.entity;


// TODO: Auto-generated Javadoc
/**
 * The Class F63ReservedPrivateF2.
 */
public class F63ReservedPrivateF2Extend {
	
	/** 63_2_1      发卡方保留域			ANS…20（LLVAR）. */
	private String F1IssuerReserved;
	
	/** 63_2_2      中国银联保留域			ANS…20（LLVAR). */
	private String F2CupsReserved;
	
	/** 63_2_3      受理机构保留域			ANS…20（LLVAR）. */
	private String F3AcquireReserved;
	/** 63_2_4      POS终端保留域			ANS…60（LLVAR）. */
	private String F4PosReserved;
	
	/**
	 * Gets the f1 issuer reserved.
	 * 63_2_1      发卡方保留域			ANS…20（LLVAR）
	 * @return the f1 issuer reserved
	 */
	public String getF1IssuerReserved() {
		return F1IssuerReserved;
	}
	
	/**
	 * Sets the f1 issuer reserved.
	 * 63_2_1      发卡方保留域			ANS…20（LLVAR）
	 * @param f1IssuerReserved the new f1 issuer reserved
	 */
	public void setF1IssuerReserved(String f1IssuerReserved) {
		F1IssuerReserved = f1IssuerReserved;
	}
	
	/**
	 * Gets the f2 cups reserved.
	 *63_2_2      中国银联保留域			ANS…20（LLVAR).
	 * @return the f2 cups reserved
	 */
	public String getF2CupsReserved() {
		return F2CupsReserved;
	}
	
	/**
	 * Sets the f2 cups reserved.
	 *63_2_2      中国银联保留域			ANS…20（LLVAR).
	 * @param f2CupsReserved the new f2 cups reserved
	 */
	public void setF2CupsReserved(String f2CupsReserved) {
		F2CupsReserved = f2CupsReserved;
	}
	
	/**
	 * Gets the f3 acquire reserved.
	 * 63_2_3      受理机构保留域			ANS…20（LLVAR）
	 * @return the f3 acquire reserved
	 */
	public String getF3AcquireReserved() {
		return F3AcquireReserved;
	}
	
	/**
	 * Sets the f3 acquire reserved.
	 * 63_2_3      受理机构保留域			ANS…20（LLVAR）
	 * @param f3AcquireReserved the new f3 acquire reserved
	 */
	public void setF3AcquireReserved(String f3AcquireReserved) {
		F3AcquireReserved = f3AcquireReserved;
	}
	
	/**
	 * Gets the f4 pos reserved.
	 *63_2_4      POS终端保留域			ANS…60（LLVAR）
	 * @return the f4 pos reserved
	 */
	public String getF4PosReserved() {
		return F4PosReserved;
	}
	
	/**
	 * Sets the f4 pos reserved.
	 *63_2_4      POS终端保留域			ANS…60（LLVAR）
	 * @param f4PosReserved the new f4 pos reserved
	 */
	public void setF4PosReserved(String f4PosReserved) {
		F4PosReserved = f4PosReserved;
	}
	
	
}
