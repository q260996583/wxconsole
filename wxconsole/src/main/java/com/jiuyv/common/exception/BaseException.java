/*
 * Created on 2008-11-4
 *
 * TODO 基础异常类
 */
package com.jiuyv.common.exception;

import java.util.Collection;

import com.jiuyv.common.ibatis.vo.ErrorClass;



// TODO: Auto-generated Javadoc
/**
 * 基础异常.
 * 
 * @author 
 * @version 0.1
 */
public  class BaseException extends Exception {
	   /** 错误结果代码 */
    private String errorCode;
   
    /** 错误信息 */
    private String errorMessage;
    
    /** 错误信息集合 */
    private Collection<ErrorClass> errorClasses;

    /**
     * 构造函数
     * @param prompt 错误结果描述
     * @param errorCode 错误代码
     * @param throwable Throwable
     */
    public BaseException(String errorCode, Throwable throwable) {
        super(throwable.getMessage());
        this.errorCode = errorCode;
        this.errorMessage = throwable.getMessage();
    }

    /**
     * 构造函数
     * @param prompt 错误结果描述
     * @param errorCode 错误代码
     * @param throwable Throwable
     */
    public BaseException(String errorCode,String errorMessage ,Throwable throwable) {
        super(throwable.getMessage());
        this.errorCode = errorCode;
        this.errorMessage = errorMessage;
    }

    
    public BaseException(String exceptionMessAge){
    	 super(exceptionMessAge);
    	 this.errorCode = "系统内部异常";
    	 this.errorMessage = exceptionMessAge;
    }
    
    /**
     * 构造函数
     * @param prompt 错误信息描述
     * @param errorCode 错误代码
     * @param errorMessage 错误信息
     */
    public BaseException(String errorCode, String errorMessage) {
        super(errorMessage);
        this.errorCode = errorCode;
        this.errorMessage = errorMessage;
    }
    
    /**
     * 得到错误代码
     * @return errorCode
     */
    public String getErrorCode(){
        return errorCode;
    }

    /**
     * 得到错误信息
     * @return String
     */
    public String getMessage(){
        return errorMessage;
    }

    /**
     * 得到errorClasses
     * @return Collection<ErrorClass>
     */
    public Collection<ErrorClass> getErrorClasses() {
        return errorClasses;
    }

    /**
     * 存放errorClasses
     * @param errorClasses 错误信息集合
     */
    public void setErrorClasses(Collection<ErrorClass> errorClasses) {
        this.errorClasses = errorClasses;
    }
    
}
