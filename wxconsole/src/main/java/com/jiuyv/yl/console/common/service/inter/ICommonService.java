package com.jiuyv.yl.console.common.service.inter;

import java.util.List;

import com.jiuyv.yl.console.common.entity.SecCodeVo;
import com.jiuyv.yl.console.orgmngr.entity.BankAccntVo;
import com.jiuyv.yl.console.orgmngr.entity.SpecMccRateVo;
import com.jiuyv.yl.console.orgmngr.entity.TblSysOrgInfoVo;
import com.jiuyv.yl.console.report.entity.BankClearSecRptVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;
import com.jiuyv.common.exception.BaseException;

public interface ICommonService {
	ExtData<TblSysOrgInfoVo> findSysOrg(List<Filter> Filters, Page page)	throws Exception;
	/**
	 * 检索银行信息
	 * @param filters
	 * @return
	 * @throws Exception
	 */
	ExtData<BankAccntVo>  findBankInfo(List<Filter> filters) throws Exception;
	/**
	 * 检索MCC信息
	 * @param filters
	 * @return
	 * @throws Exception
	 */
	ExtData<BankClearSecRptVo> findMccDesc(List<Filter> filters, Page page)throws Exception;
	/**
	 * 特殊计费
	 * @param filters
	 * @return
	 * @throws Exception
	 */
	ExtData<SpecMccRateVo> findSpecial(List<Filter> filters, Page page)throws Exception;
	
	
	/**
	 * 查询序列的下个值
	 * 使用表维护的sequence, TBL_SYS_SEQ.
	 * 消耗性能以保证序列的连续性.
	 * @param seqCode
	 * @return
	 * @throws BaseException
	 */
	Long findNextSeqNo(String seqCode) throws BaseException;
	
	List<SecCodeVo> findCodeByType(String codeType) throws BaseException;
	
	int updateCodeName(SecCodeVo vo);
}
