package com.jiuyv.common.exception;

import java.util.List;

public class BillBatchException extends Exception {
    public BillBatchException(String errMessage){
        super(errMessage);
    }
    private boolean isRollback;
  
    public boolean isRollback() {
        return isRollback;
    }
    
    public void setRollback(boolean isRollback) {
        this.isRollback = isRollback;
    }
    public BillBatchException(String errMessage,List<BillBatchRowException> errList,boolean isRollBack){
        super(errMessage);
        this.errList=errList;
        this.isRollback=isRollBack;
    }
    private List<BillBatchRowException> errList;
    
    public List<BillBatchRowException> getErrList() {
        return errList;
    }
    public void setErrList(List<BillBatchRowException> errList) {
        this.errList = errList;
    }
}
