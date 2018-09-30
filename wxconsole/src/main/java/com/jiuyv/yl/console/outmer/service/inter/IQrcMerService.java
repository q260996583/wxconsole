/**
 * 
 * 上海申鑫电子支付股份有限公司
 * Copyright (c) 2015-2017 ShenXinPay Property,Inc.All Rights Reserved.
 */
package com.jiuyv.yl.console.outmer.service.inter;

import java.util.List;

import com.jiuyv.common.exception.BaseException;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.common.entity.CmMediaResVo;
import com.jiuyv.yl.console.outmer.entity.MhtAttachDefBean;
import com.jiuyv.yl.console.outmer.entity.MhtAttachInfoAddVo;
import com.jiuyv.yl.console.outmer.entity.QrcMerchantVo;
import com.jiuyv.yl.console.security.entity.SecurityUserDetail;

/**
 * 
 * @author wxb
 * @version $Id: IQrcMerSerevice.java, v 0.1 2017年6月6日 上午10:28:15 wxb Exp $
 */
public interface IQrcMerService {
    
    ExtData<QrcMerchantVo> findOutQrcMer(List<Filter> filters, Page pageInfo) throws Exception;
    
    ExtData<QrcMerchantVo> findOutQrcMerAdd(List<Filter> filters, Page pageInfo) throws Exception;
    
    void insertQrcMerAdd(QrcMerchantVo mer) throws Exception ;
    
    
    void updateQrcMerAdd(QrcMerchantVo mer) throws Exception ;
    
    void doSubmitQrcMerchantAdd(QrcMerchantVo addVo) throws Exception;
    
    public void delQrcMerAdd(QrcMerchantVo merchantVo);
    
    /**
     * 加载商户附件定义信息
     * @return
     * @throws BaseException
     */
    ExtData<MhtAttachDefBean> loadQrcMhtAttachDef() throws BaseException;
    
    /**
     * 保存商户进件附件信息
     * @param user 
     * @param merVo
     * @param validateList
     * @return
     * @throws BaseException
     */
    ExtData<MhtAttachInfoAddVo> doSaveQrcMhtAttachInfoAdd(SecurityUserDetail user, QrcMerchantVo merVo,
            List<MhtAttachInfoAddVo> validateList) throws BaseException;
    
    /**
     * 加载商户进件附件列表
     * @param addOrgCode
     * @return
     * @throws BaseException
     */
    ExtData<MhtAttachInfoAddVo> loadQrcMhtAttachInfoAdd(String addOrgCode) throws BaseException;
    
    /**
     * 查询待审批进件
     * @param sdOutMerApplyVo
     * @return
     * @throws Exception
     */
    ExtData<QrcMerchantVo> findOutQrcMerApply(List<Filter> filters, Page pageInfo) throws Exception;
    
    /**
     * 校验进件附件信息
     * @param reqParam
     * @return
     */
    ExtData<MhtAttachInfoAddVo> checkQrcMhtAttachInfoAdd(String reqParam);
    
    
    void doUpdateOutQrcMerApplyStatus(QrcMerchantVo qrcMerApplyVo) throws Exception;
    
    void insertQrcMerInfo(QrcMerchantVo mer) throws Exception ;
    
    CmMediaResVo findMerAttachImgs(MhtAttachInfoAddVo vo)throws Exception;
    
    List<MhtAttachInfoAddVo> findMerAttachSeq(QrcMerchantVo addVo)throws Exception;
    
    void updateQrcMerAddStatus(QrcMerchantVo qrcMerApplyVo) throws Exception;
}
