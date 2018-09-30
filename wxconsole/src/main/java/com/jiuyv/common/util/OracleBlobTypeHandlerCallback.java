package com.jiuyv.common.util;

import java.sql.SQLException;

import oracle.sql.BLOB;

import com.ibatis.sqlmap.client.extensions.ParameterSetter;
import com.ibatis.sqlmap.client.extensions.ResultGetter;
import com.ibatis.sqlmap.client.extensions.TypeHandlerCallback;

public class OracleBlobTypeHandlerCallback implements TypeHandlerCallback {

	public void setParameter(ParameterSetter setter, Object parameter)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	public Object getResult(ResultGetter getter) throws SQLException {
		BLOB blob = (BLOB) getter.getClob();
		if (blob == null || blob.length() == 0) {
			return "";
		} else
			return blob.getBytes(1L, (int) blob.length());

	}

	public Object valueOf(String s) {
		// TODO Auto-generated method stub
		return null;
	}

}
