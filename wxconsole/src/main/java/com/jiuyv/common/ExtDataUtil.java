package com.jiuyv.common;



import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.validation.FieldError;

import com.jiuyv.common.ibatis.vo.ErrorClass;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.web.interceptor.ext.ErrorMap;
import com.jiuyv.common.exception.BaseException;


/**
 * ExtData 对象工厂.
 * 也存放了一些生成ErrorMap的静态方法。
 * @author cowyk
 */
public final class ExtDataUtil {
    /** 字符串固定数 */
    private static final int FIX_NUM = 17;

    /**
     * 建立包含单条数据的对象.
     *
     * @param obj 单个对象
     *
     * @return the ext data
     */
    public static <T> ExtData<T> genWithSingleData(T obj) {
        List<T> data = new ArrayList<T>();
        data.add(obj);

        return genWithData(data);
    }

    /**
     * 根据FieldError对象集合生成ExtData对象.
     *
     * @param fldErrs the fld errs
     *
     * @return the ext data
     */
    public static ExtData genWithFieldErrors(Collection<FieldError> fldErrs) {
        if ((fldErrs == null) || (fldErrs.size() == 0)) {
            return null;
        }

        ErrorMap errors = new ErrorMap();

        for (FieldError fldErr : fldErrs) {
            if (fldErr == null) {
                continue;
            }

            String fld = fldErr.getField();
            errors.addError(fld, fldErr.getDefaultMessage());
        }

        return genWithErrors(errors.getErrorCol());
    }

    /**
     * 根据域错误生成错误Map。
     *
     * @param fldErrs bean检查错误
     * @param rownum 行号
     * @param errorMap 错误信息Map
     */
    public static void fillErrorsWithFieldError(
        Collection<FieldError> fldErrs, int rownum, ErrorMap errorMap) {
        if ((fldErrs == null) || (fldErrs.size() == 0) || (errorMap == null)) {
            return;
        }

        for (FieldError fldErr : fldErrs) {
            if (fldErr == null) {
                continue;
            }

            errorMap.addError(rownum, fldErr.getField(),
                fldErr.getDefaultMessage());
        }
    }

    /**
     * 建立包含系统异常的对象.
     *
     * @param syserr the syserr
     *
     * @return the ext data
     */
    public static ExtData genWithExceptions(String syserr) {
        return getExtData(0, null, 0, false, syserr, null);
    }
    
    /**
     * 建立包含信息的操作成功对象.
     *
     * @param syserr the syserr
     *
     * @return the ext data
     */
    public static ExtData genWithSuccessInfo(String info) {
        return getExtData(0, null, 0, true, info, null);
    }

    /**
     * 建立包含系统异常的对象.
     *
     * @param t 系统异常
     *
     * @return the ext data
     */
    public static ExtData genWithExceptions(Throwable t) {
        if ((t != null) && t instanceof BaseException) {
            BaseException be = (BaseException) t;

            if ((be.getErrorClasses() != null) &&
                    (be.getErrorClasses().size() != 0)) {
                return getExtData(0, null, 0, false, null, be.getErrorClasses());
            }

            // generate errorMsg
            return getExtData(0, null, 0, false, be.getMessage(), null);
        }

        return getExtData(0, null, 0, false, "unknow.system.error", null);
    }

    /**
     * 建立包含正常数据的对象.
     *
     * @param root the root
     *
     * @return the ext data
     */
    public static ExtData genWithData(List root) {
        return getExtData(0, root, root.size(), true, null, null);
    }

    /**
     * 建立包含业务出错信息的对象.
     *
     * @param errors the errors
     *
     * @return the ext data
     */
    public static ExtData genWithErrors(Collection<ErrorClass> errors) {
        return getExtData(0, null, 0, false, null, errors);
    }
    
    /**
     * 建立包含业务出错信息的对象.
     *
     * @param errors the errors
     *
     * @return the ext data
     */
    public static ExtData genWithErrors(String syserr, Collection<ErrorClass> errors) {
    	return getExtData(0, null, 0, false, syserr, errors);
    }

    /**
     * 建立ExtData对象.
     *
     * @param status the status
     * @param root the root
     * @param totalproperty the totalproperty
     * @param success the success
     * @param syserr the syserr
     * @param errors the errors
     *
     * @return the ext data
     */
    private static ExtData getExtData(int status, List root, int totalproperty,
        boolean success, String syserr, Collection<ErrorClass> errors) {
        ExtData data = new ExtData();
        data.setErrors(errors);
        data.setRoot(root);
        data.setStatus(status);
        data.setSuccess(success);
        data.setSyserr(syserr);
        data.setTotalProperty(totalproperty);

        return data;
    }

   
}
