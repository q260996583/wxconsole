package com.jiuyv.yl.console.common.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jiuyv.yl.console.common.dao.inter.ICmMediaResDao;
import com.jiuyv.yl.console.common.entity.CmMediaResVo;


/**
 * The Class CmMediaResDaoImpl.
 *
 * @author 
 * @version 1.0.0
 * @since 2016-2-22
 * @company Shanghai JiuYv Software Systems CO.,LTD.
 */
public class CmMediaResDaoImpl extends BaseDaoImpl<CmMediaResVo> implements ICmMediaResDao {

	
	public CmMediaResDaoImpl () {
		fetchAfterUpdate = false;
	}
	
	/**
	 * @see com.jiuyv.yl.console.common.dao.inter.ICmMediaResDao#findByKey(java.lang.Long)
	 * @param medSeq
	 * @return
	 * 
	 */
	public CmMediaResVo findByKey(Long medSeq) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("medSeq", medSeq);
		return (CmMediaResVo) getExtendSqlMapClientTemplate().queryForObject(ns() + ".findByKey", param);
	}

	
	/**
	 * @see com.jiuyv.yl.console.common.dao.inter.ICmMediaResDao#findThumbByPath(java.lang.String)
	 * @param medPath
	 * @return
	 * 
	 */
	public CmMediaResVo findThumbByPath(String medPath) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("medPath", medPath);
		
		List<CmMediaResVo> reslist = getExtendSqlMapClientTemplate().queryForList(ns() + ".findThumbByPath", param);
		if ( reslist != null && reslist.size() > 0 ) {
			return reslist.get(0);
		}
		return null;
	}

	
	/**
	 * @see com.jiuyv.yl.console.common.dao.inter.ICmMediaResDao#findContentByPath(java.lang.String)
	 * @param medPath
	 * @return
	 * 
	 */
	public CmMediaResVo findContentByPath(String medPath) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("medPath", medPath);
		
		List<CmMediaResVo> reslist = getExtendSqlMapClientTemplate().queryForList(ns() + ".findContentByPath", param);
		if ( reslist != null && reslist.size() > 0 ) {
			return reslist.get(0);
		}
		return null;
	}

	/**
	 * 
	 */
	public CmMediaResVo findThumbByMedSeqRefNo(String medSeq, String refNo) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("medSeq", medSeq);
		param.put("refNo", refNo);
		List<CmMediaResVo> reslist = getExtendSqlMapClientTemplate().queryForList(ns() + ".findThumbByMedSeqRefNo", param);
		if ( reslist != null && reslist.size() > 0 ) {
			return reslist.get(0);
		}
		return null;
	}

	
	/**
	 * 
	 */
	public CmMediaResVo findContentByMedSeqRefNo(String medSeq, String refNo) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("medSeq", medSeq);
		param.put("refNo", refNo);
		
		List<CmMediaResVo> reslist = getExtendSqlMapClientTemplate().queryForList(ns() + ".findContentByMedSeqRefNo", param);
		if ( reslist != null && reslist.size() > 0 ) {
			return reslist.get(0);
		}
		return null;
	}
	
	
	/**
	 * @see com.jiuyv.yl.console.common.dao.inter.ICmMediaResDao#updateByKey(com.jiuyv.yl.console.common.entity.CmMediaResVo)
	 * @param vo
	 * @return
	 * 
	 */
	public int updateByKey(CmMediaResVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * @see com.jiuyv.yl.console.common.dao.impl.BaseDaoImpl#ns()
	 * @return
	 * 
	 */
	protected String ns() {
		return "TBL_CM_MEDIA_RES";
	}

	/**
	 * @see com.jiuyv.yl.console.common.dao.impl.BaseDaoImpl#seq()
	 * @return
	 * 
	 */
	protected String seq() {
		return null;
	}

}
