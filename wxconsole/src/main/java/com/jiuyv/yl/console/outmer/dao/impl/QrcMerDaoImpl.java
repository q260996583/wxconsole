/**
 * 
 * 上海申鑫电子支付股份有限公司
 * Copyright (c) 2015-2017 ShenXinPay Property,Inc.All Rights Reserved.
 */
package com.jiuyv.yl.console.outmer.dao.impl;

import java.util.List;

import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.yl.console.common.entity.CmMediaResVo;
import com.jiuyv.yl.console.outmer.dao.inter.IQrcMerDao;
import com.jiuyv.yl.console.outmer.entity.MhtAttachInfoAddVo;
import com.jiuyv.yl.console.outmer.entity.QrcMerchantVo;
import com.jiuyv.yl.console.publicdao.PublicModuleDao;

/**
 * 
 * @author wxb
 * @version $Id: QrcMerDaoImpl.java, v 0.1 2017年6月6日 上午10:36:50 wxb Exp $
 */
public class QrcMerDaoImpl extends PublicModuleDao implements IQrcMerDao {

    private static final String KEY_PROPERTY_NAME="instMerId";
    private static final String SELECT_ALL_QRCMER="outmer.selectAllQrcMer";
    
    private static final String SELECT_ALL_QRCMER_ADD="outmer.selectAllQrcMerAdd";
    
    private static final String UPDATE_QRCMERMER_ADD="outmer.updateQrcMerAdd";
    
    private static final String INSERT_QRCMER_ADD="outmer.insertQrcMerAdd";
    
    private static final String SUBMIT_QRCMER_ADD="outmer.submitQrcMerAdd";
    
    private static final String DELETE_QRCMER_ADD="outmer.deleteQrcMerAdd";
    private static final String SELECT_OUT_QRC_MER_APPLY="outmer.selectOutQrcMerApply";
    
    private static final String UPDATE_OUT_QRC_MER_APPLY_STATUS="outmer.updateOutQrcMerApplyStatus";
    
    private static final String INSERT_QRCMER_INFO="outmer.insertQrcMerInfo";
    
    private static final String SELECT_MER_ATTACH_IMGS="outmer.selectMerAttachImgs";
    
    private static final String SELECT_MER_ATTACH_SEQ="outmer.selectMerAttachSeq";
    
    private static final String UPDATE_QRC_MER_ADD_STATUS="outmer.updateQrcMerAddStatus";
    @Override
    public ExtData<QrcMerchantVo> findOutQrcMer(List<Filter> filters, Page pageInfo)throws Exception {
        ExtData<QrcMerchantVo> data=getExtendSqlMapClientTemplate().queryExtendForExtData(SELECT_ALL_QRCMER, filters, pageInfo);
        return  data;
    }

    @Override
    public ExtData<QrcMerchantVo> findOutQrcMerAdd(List<Filter> filters, Page pageInfo)throws Exception {
        ExtData<QrcMerchantVo> data=getExtendSqlMapClientTemplate().queryExtendForExtData(SELECT_ALL_QRCMER_ADD, filters, pageInfo);
        return  data;
    }

    @Override
    public void insertCoreMerchantVo(QrcMerchantVo vo) {
        getExtendSqlMapClientTemplate().insert(INSERT_QRCMER_ADD, vo);
    }

    @Override
    public void updateCoreMerchantVo(QrcMerchantVo vo) {
        getExtendSqlMapClientTemplate().update(UPDATE_QRCMERMER_ADD, vo);
    }

    @Override
    public void submitMerchantAdd(QrcMerchantVo merVo) throws Exception {
        getExtendSqlMapClientTemplate().update(SUBMIT_QRCMER_ADD, merVo);
    }

    @Override
    public void delQrcMerAdd(QrcMerchantVo AddVo) {
        getExtendSqlMapClientTemplate().delete(DELETE_QRCMER_ADD, AddVo);
    }

    @Override
    public ExtData<QrcMerchantVo> findOutQrcMerApply(List<Filter> filters, Page pageInfo)throws Exception {
        return getExtendSqlMapClientTemplate().queryExtendForExtData(SELECT_OUT_QRC_MER_APPLY, filters, pageInfo);
    }

    @Override
    public void doUpdateOutQrcMerApplyStatus(QrcMerchantVo qrcMerApplyVo) throws Exception {                                                                                                     
        getExtendSqlMapClientTemplate().update(UPDATE_OUT_QRC_MER_APPLY_STATUS,qrcMerApplyVo);
    }

    @Override
    public void insertQrcMerInfo(QrcMerchantVo vo) {
        getExtendSqlMapClientTemplate().insert(INSERT_QRCMER_INFO, vo);
    }

    @Override
    public CmMediaResVo findMerAttachImgs(MhtAttachInfoAddVo vo) throws Exception {
        CmMediaResVo data=(CmMediaResVo)getExtendSqlMapClientTemplate().queryForObject(SELECT_MER_ATTACH_IMGS,vo);
        return  data ;
    }

    @Override
    public List<MhtAttachInfoAddVo> findMerAttachSeq(QrcMerchantVo vo) throws Exception {
        List<MhtAttachInfoAddVo> data=getExtendSqlMapClientTemplate().queryForList(SELECT_MER_ATTACH_SEQ,vo);
        return  data ;
    }

    @Override
    public void updateQrcMerAddStatus(QrcMerchantVo qrcMerApplyVo) throws Exception {
        getExtendSqlMapClientTemplate().update(UPDATE_QRC_MER_ADD_STATUS,qrcMerApplyVo);
    }

   
}
