package youle.posp.console.lottery;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.jiuyu.batchServer.bussiness.wxrobot.action.RobotManagerAction;
import com.jiuyv.common.ibatis.vo.ExtData;
import com.jiuyv.common.ibatis.vo.Filter;
import com.jiuyv.yl.console.lottery.entity.TblLotteryMerchant;
import com.jiuyv.yl.console.lottery.entity.TblLotteryOrder;
import com.jiuyv.yl.console.lottery.service.inter.ILotteryOrderService;
import com.jiuyv.yl.console.lottery.service.inter.TblLotteryMerchantService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:com/console/configs/spring/applicationContext.xml")
@TransactionConfiguration(defaultRollback=false,transactionManager="transactionManager")
public class LotteryOrderServiceTest {
	@Autowired
	ILotteryOrderService service;
	@Autowired
	TblLotteryMerchantService tblLotteryMerchantService;
	@Autowired
	RobotManagerAction robotManagerAction;
	@Test
	public void test() throws Exception {
		TblLotteryOrder order = new TblLotteryOrder();
		order.setLotteryId("201728825");
		order.setLotteryType("10");
		List list = service.selectByLotteryId(order);
		for(Object obj : list) {
			TblLotteryOrder vo = (TblLotteryOrder)obj;
			System.out.println(vo.getMerid());
		}
	}
	
	@Test
	public void queryMer() {
		TblLotteryMerchant merchant = new TblLotteryMerchant();
		merchant.setMerid("123");
		try {
			List list = tblLotteryMerchantService.selectByMer(merchant);
			TblLotteryMerchant mer = (TblLotteryMerchant)list.get(0);
			System.out.println(mer.getAmt());
			Long amt = mer.getAmt()==null?0:mer.getAmt();
			amt += 1000000000;
			mer.setAmt(amt);
			//tblLotteryMerchantService.updateMer(mer);
			String seq = tblLotteryMerchantService.getMerSeq();
			System.out.println(seq);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void queryMerTest() throws Exception {
		robotManagerAction.findLotterMerInfo();
	}
}
