package com.jiuyv.yl.console.common.dao.inter;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import com.jiuyv.yl.console.orgmngr.entity.BankAccntVo;
import com.jiuyv.yl.console.orgmngr.entity.SpecMccRateVo;
import com.jiuyv.yl.console.orgmngr.entity.TblSysOrgInfoVo;
import com.jiuyv.yl.console.report.entity.BankClearSecRptVo;
import com.jiuyv.yl.console.common.entity.SecCodeVo;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.common.ibatis.vo.Page;

public interface ICommonDao {
	public ExtData<TblSysOrgInfoVo> findSysOrg(List<Filter> Filters, Page page)	throws Exception;
	
	/**
	 * 取系统日期
	 * 
	 * @param page
	 *            the page
	 * @param filters
	 *            the filters
	 * @return the ext data<SysCtrlVo>
	 * @throws Exception
	 */
	String getDate() throws Exception;

	/**
	 * 取系统时间
	 * 
	 * @return
	 * @throws Exception
	 */
	String getDateTime() throws Exception;

	/**
	 * 取系统时间,返回Date
	 * 
	 * @return
	 * @throws Exception
	 */
	Date getDateForDate();
	
	/**
	 * 检索银行信息
	 * @param filters
	 * @return
	 * @throws Exception
	 */
	ExtData<BankAccntVo>  findBankInfo(List<Filter> filters) throws Exception;
	
	ExtData<BankClearSecRptVo> findMccDesc(List<Filter> filters, Page pageInfo)throws Exception;
    String getNextValueOfSequence(String sequenceName)throws Exception;

    ExtData<SpecMccRateVo> findSpecial(List<Filter> Filters, Page page)	throws Exception;
    
    
    /**
     * 新增序列号
     * @param seqCode 序列名
     * @param initValue 起始值
     */
    void insertSysSeq(String seqCode, Long initValue) ;
    
    /**
     * 获取 TBL_SYS_SEQ 中连续编号
     * select for update 
     * @param seqCode 序列名
     * @return
     * @throws Exception
     */
    Long currSysSeqNo(String seqCode);
	
    /**
     * 序列自增
     * @param seqCode
     * @param currSeqNo 
     * @return 影响行数
     */
    int updateSysSeqNo(String seqCode, Long currSeqNo) ;
    
    
    List<SecCodeVo> findCodeByTypeAndNo(String codeType,List<String> codeNoList);

    /**
     * 根据codeType查询SecCode
     * @param string
     * @return
     */
	List<SecCodeVo> findCodeByType(String codeType);
	
	int updateCodeName(SecCodeVo vo);
}
