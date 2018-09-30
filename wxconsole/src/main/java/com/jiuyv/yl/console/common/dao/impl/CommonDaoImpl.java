package com.jiuyv.yl.console.common.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jiuyv.yl.console.common.dao.inter.ICommonDao;
import com.jiuyv.yl.console.orgmngr.entity.BankAccntVo;
import com.jiuyv.yl.console.orgmngr.entity.SpecMccRateVo;
import com.jiuyv.yl.console.orgmngr.entity.TblSysOrgInfoVo;
import com.jiuyv.yl.console.publicdao.PublicModuleDao;
import com.jiuyv.yl.console.report.entity.BankClearSecRptVo;
import com.jiuyv.yl.console.common.entity.SecCodeVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

public class CommonDaoImpl extends PublicModuleDao implements ICommonDao{

	public static final String selectSysOrg="common.select_sysorg";
	private static final String SYS_DATE = "common.getDate";
	private static final String SYS_DATE_TIME = "common.getDateTime";
	private static final String SYS_DATE_TIME_DATE = "common.getDateForDate";
	private static final String SELECT_BANK_INFO="common.selectBankInfo";
	private static final String SELECT_MCC_DESC = "common.selectMccDesc";
    private static final String SELECT_NEXT_SEQ="common.getNextValueOfSequence";
    private static final String SELECT_SPECIAL_DESC = "common.selectSpecialDesc";
	@Override
	public ExtData<TblSysOrgInfoVo> findSysOrg(List<Filter> Filters, Page page)
			throws Exception {
		return this.getExtendSqlMapClientTemplate().queryExtendForExtData(selectSysOrg, Filters, page);
	}

	@Override
	public String getDate() throws Exception {
		return (String) getExtendSqlMapClientTemplate().queryForObject(SYS_DATE);
	}

	@Override
	public String getDateTime() throws Exception {
		return (String) getExtendSqlMapClientTemplate().queryForObject(SYS_DATE_TIME);
	}

	@Override
	public Date getDateForDate() {
		return (Date) getExtendSqlMapClientTemplate().queryForObject(SYS_DATE_TIME_DATE);
	}

	@Override
	public ExtData<BankAccntVo> findBankInfo(List<Filter> filters)
			throws Exception {
		return getExtendSqlMapClientTemplate().queryExtendForExtDataALL(SELECT_BANK_INFO,filters);
	}

	@Override
	public ExtData<BankClearSecRptVo> findMccDesc(List<Filter> filters,
			Page pageInfo) throws Exception {
		return getExtendSqlMapClientTemplate().queryExtendForExtData(SELECT_MCC_DESC,filters,pageInfo);
	}

	
	@Override
	public String getNextValueOfSequence(String sequenceName) throws Exception {
		 return (String)this.getExtendSqlMapClientTemplate().queryForObject(SELECT_NEXT_SEQ,sequenceName);
	}

	@Override
	public ExtData<SpecMccRateVo> findSpecial(List<Filter> Filters, Page page)
			throws Exception {
		return getExtendSqlMapClientTemplate().queryExtendForExtData(SELECT_SPECIAL_DESC,Filters,page);
	}
	
	/**
     * 新增序列号
     * @param seqCode 序列名
     * @param initValue 起始值
     */
    public void insertSysSeq(String seqCode, Long initValue) {
    	Map<String,Object> params = new HashMap<String, Object>();
    	params.put("seqCode", seqCode);
    	params.put("initValue", initValue);
		getExtendSqlMapClientTemplate().insert("common.insertSysSeq", params );
    }
    
    /**
     * 获取 TBL_SYS_SEQ 中连续编号
     * select for update 
     * @param seqCode 序列名
     * @return
     * @throws Exception
     */
    public Long currSysSeqNo(String seqCode) {
    	Map<String,Object> params = new HashMap<String, Object>();
    	params.put("seqCode", seqCode);
    	return (Long) getExtendSqlMapClientTemplate().queryForObject("common.currSysSeqNo", params);
    }
	
    /**
     * 序列自增
     * @param seqCode
     * @param currSeqNo 
     * @return 影响行数
     */
    public int updateSysSeqNo(String seqCode, Long currSeqNo) {
    	Map<String,Object> params = new HashMap<String, Object>();
    	params.put("seqCode", seqCode);
    	params.put("currSeqNo", currSeqNo);
    	return getExtendSqlMapClientTemplate().update("common.updateSysSeqNo", params);
    }
	
   public List<SecCodeVo> findCodeByTypeAndNo(String codeType,List<String> codeNoList) {
	    Map<String,Object> params = new HashMap<String, Object>();
	   	params.put("codeType", codeType);
	   	params.put("codeNoList", codeNoList);
	   	return getExtendSqlMapClientTemplate().queryForList("common.findCodeByTypeAndNo", params);
   }
   
   /**
    * 根据codeType查询SecCode
    * @param string
    * @return
    */
	public List<SecCodeVo> findCodeByType(String codeType) {
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("codeType", codeType);
		return getExtendSqlMapClientTemplate().queryForList("common.findCodeByType", params);
	}

	@Override
	public int updateCodeName(SecCodeVo vo) {
		return getExtendSqlMapClientTemplate().update("common.updateCodeName", vo);
	}
}
