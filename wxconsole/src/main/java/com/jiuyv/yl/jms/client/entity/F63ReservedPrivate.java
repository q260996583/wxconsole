package com.jiuyv.yl.jms.client.entity;



// TODO: Auto-generated Javadoc
/**
 * The Class F63ReservedPrivate.
 */
public class F63ReservedPrivate {
	/** 63.1  自定义域1	AN3. */
	private String F1Reserved;
	/**	63.2   自定义域2	ANS…120（LLLVAR）*/
	private F63ReservedPrivateF2Extend F2Reserved;
	
	

	/**
	 * Gets the f1 reserved.
	 *63.1  自定义域1	AN3
	 * @return the f1Reserved
	 */
	public String getF1Reserved() {
		return F1Reserved;
	}

	/**
	 * Sets the f1 reserved.
	 *63.1  自定义域1	AN3
	 * @param f1Reserved the f1Reserved to set
	 */
	public void setF1Reserved(String f1Reserved) {
		F1Reserved = f1Reserved;
	}

	/**
	 * Gets the f2 reserved.
	 *63.2   自定义域2	ANS…120（LLLVAR）
	 * @return the f2 reserved
	 */
	public F63ReservedPrivateF2Extend getF2Reserved() {
		return F2Reserved;
	}

	/**
	 * Sets the f2 reserved.
	 *63.2   自定义域2	ANS…120（LLLVAR）
	 * @param f2Reserved the new f2 reserved
	 */
	public void setF2Reserved(F63ReservedPrivateF2Extend f2Reserved) {
		F2Reserved = f2Reserved;
	}
	
	

}
