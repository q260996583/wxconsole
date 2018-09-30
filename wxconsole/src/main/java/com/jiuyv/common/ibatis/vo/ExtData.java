package com.jiuyv.common.ibatis.vo;

import java.util.Collection;
import java.util.List;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;



/**
 * service返回对象定义.
 * 包含 status, success, totalProperty, root, syserr, errors信息。
 * @param <T> 范型
 */
public class ExtData<T> {
    
    /** The status. */
    private int status;
    
    /** The success. */
    private boolean success;
    
    /** The total property. */
    private long totalProperty;
    
    /** The syserr. */
    private String syserr;
    
    /** The root. */
    private List<T> root;
    
    /** The errors. */
    private Collection<ErrorClass> errors;

    /**
     * Instantiates a new ext data.
     */
    public ExtData() {
        super();
    }

    /**
     * Instantiates a new ext data.
     * 
     * @param status the status
     * @param success the success
     * @param totalProperty the total property
     * @param syserr the syserr
     * @param root the root
     * @param errors the errors
     */
    public ExtData(int status, boolean success, int totalProperty,
        String syserr, List<T> root, Collection<ErrorClass> errors) {
        super();
        this.status = status;
        this.success = success;
        this.totalProperty = totalProperty;
        this.syserr = syserr;
        this.root = root;
        this.errors = errors;
    }

    /**
     * Gets the status.
     * 
     * @return the status
     */
    public int getStatus() {
        return status;
    }

    /**
     * Sets the status.
     * 
     * @param status the new status
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * Checks if is success.
     * 
     * @return true, if is success
     */
    public boolean isSuccess() {
        return success;
    }

    /**
     * Sets the success.
     * 
     * @param success the new success
     */
    public void setSuccess(boolean success) {
        this.success = success;
    }

    /**
     * Gets the total property.
     * 
     * @return the total property
     */
    public long getTotalProperty() {
        return totalProperty;
    }

    /**
     * Sets the total property.
     * 
     * @param totalProperty the new total property
     */
    public void setTotalProperty(long totalProperty) {
        this.totalProperty = totalProperty;
    }

    /**
     * Gets the syserr.
     * 
     * @return the syserr
     */
    public String getSyserr() {
        return syserr;
    }

    /**
     * Sets the syserr.
     * 
     * @param syserr the new syserr
     */
    public void setSyserr(String syserr) {
        this.syserr = syserr;
    }

    /**
     * Gets the root.
     * 
     * @return the root
     */
    public List<T> getRoot() {
        return root;
    }

    /**
     * Sets the root.
     * 
     * @param root the new root
     */
    public void setRoot(List<T> root) {
        this.root = root;
    }

    /**
     * Gets the errors.
     * 
     * @return the errors
     */
    public Collection<ErrorClass> getErrors() {
        return errors;
    }

    /**
     * Sets the errors.
     * 
     * @param errors the new errors
     */
    public void setErrors(Collection<ErrorClass> errors) {
        this.errors = errors;
    }
    
	/**
	 * @return String
	 */
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}

}
