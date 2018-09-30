package com.jiuyv.yl.jms.client;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;



/**
 * json属性不必一一对应的ObjectMapper.
 * 
 * @author dongyu 2012-6-12 Shanghai Huateng Co.
 */
public class NoProperisObjectMapper extends ObjectMapper {
	/**
	 * Instantiates a new no properis object mapper.
	 */
	public NoProperisObjectMapper() {
		this.disable(
				DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
		this.setSerializationInclusion(JsonInclude.Include.NON_NULL);
	}
}
