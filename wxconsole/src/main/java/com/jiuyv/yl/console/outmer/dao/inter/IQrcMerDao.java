/**
 * 
 * 上海申鑫电子支付股份有限公司
 * Copyright (c) 2015-2017 ShenXinPay Property,Inc.All Rights Reserved.
 */
package com.jiuyv.yl.console.outmer.dao.inter;

import java.util.List;

import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.common.entity.CmMediaResVo;
import com.jiuyv.yl.console.outmer.entity.MhtAttachInfoAddVo;
import com.jiuyv.yl.console.outmer.entity.QrcMerchantVo;

/**
 * 
 * @author wxb
 * @version $Id: IQrcMerDao.java, v 0.1 2017年6月6日 上午10:34:38 wxb Exp $
 */
public interface IQrcMerDao {
    
    ExtData<QrcMerchantVo> findOutQrcMer(List<Filter> filters, Page pageInfo) throws Exception;
    
    ExtData<QrcMerchantVo> findOutQrcMerAdd(List<Filter> filters, Page pageInfo) throws Exception;
    
    /**
     * 增加商户
     * @param vo
     */
    void insertCoreMerchantVo(QrcMerchantVo vo);
    
    //修改商户进件
    void updateCoreMerchantVo(QrcMerchantVo vo);
    
    //提交商户进件
    void submitMerchantAdd(QrcMerchantVo merVo) throws Exception;
    
    public void delQrcMerAdd(QrcMerchantVo AddVo);
    
    /**
     * 查询待审批进件
     * @param sdOutMerApplyVo
     * @return
     * @throws Exception
     */
    ExtData<QrcMerchantVo> findOutQrcMerApply(List<Filter> filters, Page pageInfo) throws Exception;
    
    
    void doUpdateOutQrcMerApplyStatus(QrcMerchantVo qrcMerApplyVo) throws Exception;
    
    void insertQrcMerInfo(QrcMerchantVo vo);
    
    CmMediaResVo findMerAttachImgs(MhtAttachInfoAddVo vo) throws Exception;
    
    List<MhtAttachInfoAddVo> findMerAttachSeq(QrcMerchantVo vo) throws Exception;
    
    void updateQrcMerAddStatus(QrcMerchantVo qrcMerApplyVo) throws Exception;
}
