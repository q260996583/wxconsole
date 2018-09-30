package com.jiuyv.common.exception;

public class BillBatchRowException extends BaseException {
    private String errType;
    private String errColumn;    
    public String getErrType() {
        return errType;
    }


    public void setErrType(String errType) {
        this.errType = errType;
    }


    public BillBatchRowException(String errorCode, String errorMessage) {
        super(errorCode, errorMessage);
     }
     
   
    @Override
    public String toString() {
        // TODO Auto-generated method stub
        String errMeg="<p>第<font color='red'>"+(errRownum+1)+"</font>行记录出错,出错原因是<font color='red'>"+this.getErrType()+"</font>,";
        if(this.getErrColumn()!=null)
            errMeg+="错误在<font color='red'>"+this.getErrColumn()+"</font>列</p> <br/>";
        return  errMeg;
    }


    public BillBatchRowException(String errorCode, Throwable throwable) {
        
        super(errorCode,throwable);
    }

    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private int errRownum;

  


    public String getErrColumn() {
        return errColumn;
    }


    public void setErrColumn(String errColumn) {
        this.errColumn = errColumn;
    }


    public int getErrRownum() {
        return errRownum;
    }


    public void setErrRownum(int errRownum) {
        this.errRownum = errRownum;
    }


  
}
