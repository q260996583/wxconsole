package com.jiuyv.yl.console.common.service.impl;

import java.math.BigDecimal;
import java.util.List;

import com.jiuyv.yl.console.common.dao.inter.ICommonDao;
import com.jiuyv.yl.console.common.entity.SecCodeVo;
import com.jiuyv.yl.console.common.service.inter.ICommonService;
import com.jiuyv.yl.console.orgmngr.entity.BankAccntVo;
import com.jiuyv.yl.console.orgmngr.entity.SpecMccRateVo;
import com.jiuyv.yl.console.orgmngr.entity.TblSysOrgInfoVo;
import com.jiuyv.yl.console.report.entity.BankClearSecRptVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.util.BizCheck;
import com.jiuyv.common.exception.BaseException;

public class CommonServiceImpl implements ICommonService{
	private ICommonDao dao;
	public ICommonDao getDao() {
		return dao;
	}
	public void setDao(ICommonDao dao) {
		this.dao = dao;
	}
	@Override
	public ExtData<TblSysOrgInfoVo> findSysOrg(List<Filter> Filters,
			Page page) throws Exception {
		return dao.findSysOrg(Filters, page);
	}
	@Override
	public ExtData<BankAccntVo> findBankInfo(List<Filter> filters)
			throws Exception {
		return dao.findBankInfo(filters);
	}
	@Override
	public ExtData<BankClearSecRptVo> findMccDesc(List<Filter> filters,
			Page page) throws Exception {
		ExtData<BankClearSecRptVo> data= dao.findMccDesc(filters,page);
		// TODO to delete 
		List<BankClearSecRptVo> list = data.getRoot();
		for(BankClearSecRptVo vo:list){
			BigDecimal givenNumberToLong = BigDecimal.valueOf(1000) ;
			if (vo.getRate() != null) {
				vo.setRateBackup(BigDecimal.valueOf(vo.getRate()).divide(givenNumberToLong)) ;
			}
		}
		return data;
	}
	@Override
	public ExtData<SpecMccRateVo> findSpecial(List<Filter> filters, Page page)
			throws Exception {
		return dao.findSpecial(filters,page);
	}
	
	/**
	 * 查询序列的下个值
	 * 使用表维护的sequence, TBL_SYS_SEQ.
	 * 消耗性能以保证序列的连续性.
	 * @param seqCode
	 * @return
	 * @throws BaseException
	 */
	public Long findNextSeqNo(String seqCode) throws BaseException {
		BizCheck.notBlank(seqCode, "", "序列名称不能为空");
		Long currValue = dao.currSysSeqNo(seqCode);
		if ( currValue == null ) {
			currValue = 1l;
			dao.insertSysSeq(seqCode, currValue);
		}
		int er = dao.updateSysSeqNo(seqCode, currValue);
		// 锁定记录时此判断无意义
		BizCheck.isTrue(er==1, "", "更新序列失败. ");
		return currValue;
	}
	
	@Override
	public List<SecCodeVo> findCodeByType(String codeType) throws BaseException {
		return dao.findCodeByType(codeType);
	}

	@Override
	public int updateCodeName(SecCodeVo vo) {
		return dao.updateCodeName(vo);
	}
}
