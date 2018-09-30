package com.jiuyv.yl.jms.client;

import java.io.IOException;

import com.jiuyv.yl.console.trans.entity.CouponTransVo;
import com.jiuyv.yl.jms.client.PosPException;
import com.jiuyv.yl.jms.client.entity.ISO8583Bean128;
import com.jiuyu.posp.protocol.ISO8583Bean128Center;



/**
 * The Interface IMessageService.
 */
public interface IMessageService {

	/**
	 * Send message 发送消息.
	 *
	 * @param sendbean the sendbean
	 * @return the checks if is o8583 bean128
	 * @throws PosPException the pos p exception
	 * @throws IOException the IO exception
	 */
	ISO8583Bean128 sendMessage(ISO8583Bean128 sendbean)throws PosPException, IOException;
	
	ISO8583Bean128Center sendMessage(ISO8583Bean128Center sendbean)throws PosPException, IOException;

	ISO8583Bean128Center sendMessageCups(ISO8583Bean128Center sendbean)throws PosPException, IOException;
	ISO8583Bean128Center sendMessageCcp(ISO8583Bean128Center sendbean)throws PosPException, IOException;

	/**
	 * 大丰收退货请求
	 * @param sendbean
	 * @return
	 * @throws PosPException
	 * @throws IOException
	 */
	CouponTransVo sendMessagedfsgate(CouponTransVo sendbean)throws PosPException, IOException;

	
}
