package com.jiuyv.yl.console.lottery.entity;

import java.math.BigDecimal;

public class TblLotteryOrderShow {

    private String lotteryId;

    private String lotteryType;

    private String merid;

    private String totalSingleDouble = "";

    private String totalBigSmall = "";

    private String totalTailBigSmall = "";

    private String dragonTigger = "";

    private String leopard = "";

    private String field1 = "";

    private String field2 = "";

    private String field3 = "";

    private String field4 = "";

    private String field5 = "";

    private Long winAmt = 0L;
    
    private String nickname;
    
    private Long transAmt = 0L;
    
    public Long getTransAmt() {
		return transAmt;
	}

	public void setTransAmt(Long transAmt) {
		this.transAmt = transAmt;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Long getWinAmt() {
		return winAmt;
	}

	public void setWinAmt(Long winAmt) {
		this.winAmt = winAmt;
	}

    public String getLotteryId() {
        return lotteryId;
    }

    public void setLotteryId(String lotteryId) {
        this.lotteryId = lotteryId;
    }

    public String getLotteryType() {
        return lotteryType;
    }

    public void setLotteryType(String lotteryType) {
        this.lotteryType = lotteryType;
    }

    public String getMerid() {
        return merid;
    }

    public void setMerid(String merid) {
        this.merid = merid;
    }

    public String getTotalSingleDouble() {
        return totalSingleDouble;
    }

    public void setTotalSingleDouble(String totalSingleDouble) {
    	if(isNotNull(totalSingleDouble)) {
    		String[] totalStr = totalSingleDouble.split(",", -1);
    		for(String str : totalStr) {
    			if(isNotNull(str)) {
    				String amt = str.split("/")[1];
        			this.transAmt += Long.parseLong(amt);
    			}
    		}
    		this.totalSingleDouble += "," + totalSingleDouble;
    	}
    }

    public String getTotalBigSmall() {
        return totalBigSmall;
    }

    public void setTotalBigSmall(String totalBigSmall) {
    	if(isNotNull(totalBigSmall)) {
    		String[] totalStr = totalBigSmall.split(",", -1);
    		for(String str : totalStr) {
    			if(isNotNull(str)) {
    				String amt = str.split("/")[1];
        			this.transAmt += Long.parseLong(amt);
    			}
    		}
    		this.totalBigSmall += "," + totalBigSmall;
    	}
    }

    public String getTotalTailBigSmall() {
        return totalTailBigSmall;
    }

    public void setTotalTailBigSmall(String totalTailBigSmall) {
    	if(isNotNull(totalTailBigSmall)) {
    		String[] totalStr = totalTailBigSmall.split(",", -1);
    		for(String str : totalStr) {
    			if(isNotNull(str)) {
    				String amt = str.split("/")[1];
        			this.transAmt += Long.parseLong(amt);
    			}
    		}
    		this.totalTailBigSmall += "," + totalTailBigSmall;
    	}
    }

    public String getDragonTigger() {
        return dragonTigger;
    }

    public void setDragonTigger(String dragonTigger) {
    	if(isNotNull(dragonTigger)) {
    		String[] totalStr = dragonTigger.split(",", -1);
    		for(String str : totalStr) {
    			if(isNotNull(str)) {
    				String amt = str.split("/")[1];
        			this.transAmt += Long.parseLong(amt);
    			}
    		}
    		this.dragonTigger += "," + dragonTigger;
    	}
    }

    public String getLeopard() {
        return leopard;
    }

    public void setLeopard(String leopard) {
    	if(isNotNull(leopard)) {
    		String[] totalStr = leopard.split(",", -1);
    		for(String str : totalStr) {
    			if(isNotNull(str)) {
    				String amt = str.split("/")[1];
        			this.transAmt += Long.parseLong(amt);
    			}
    		}
    		this.leopard += "," + leopard;
    	}
    }

    public String getField1() {
        return field1;
    }

    public void setField1(String field1) {
    	if(isNotNull(field1)) {
    		String[] totalStr = field1.split(",", -1);
    		for(String str : totalStr) {
    			if(isNotNull(str)) {
    				String amt = str.split("/")[1];
        			this.transAmt += Long.parseLong(amt);
    			}
    		}
    		this.field1 += "," + field1;
    	}
    }

    public String getField2() {
        return field2;
    }

    public void setField2(String field2) {
    	if(isNotNull(field2)) {
    		String[] totalStr = field2.split(",", -1);
    		for(String str : totalStr) {
    			if(isNotNull(str)) {
    				String amt = str.split("/")[1];
        			this.transAmt += Long.parseLong(amt);
    			}
    		}
    		this.field2 += "," + field2;
    	}
    }

    public String getField3() {
        return field3;
    }

    public void setField3(String field3) {
    	if(isNotNull(field3)) {
    		String[] totalStr = field3.split(",", -1);
    		for(String str : totalStr) {
    			if(isNotNull(str)) {
    				String amt = str.split("/")[1];
        			this.transAmt += Long.parseLong(amt);
    			}
    		}
    		this.field3 += "," + field3;
    	}
    }

    public String getField4() {
        return field4;
    }

    public void setField4(String field4) {
    	if(isNotNull(field4)) {
    		String[] totalStr = field4.split(",", -1);
    		for(String str : totalStr) {
    			if(isNotNull(str)) {
    				String amt = str.split("/")[1];
        			this.transAmt += Long.parseLong(amt);
    			}
    		}
    		this.field4 += "," + field4;
    	}
    }

    public String getField5() {
        return field5;
    }

    public void setField5(String field5) {
    	if(isNotNull(field5)) {
    		String[] totalStr = field5.split(",", -1);
    		for(String str : totalStr) {
    			if(isNotNull(str)) {
    				String amt = str.split("/")[1];
        			this.transAmt += Long.parseLong(amt);
    			}
    		}
    		this.field5 += "," + field5;
    	}
    }
    
    public String getShow() {
    	//[张大姐][3小/20]
    	String vertifyMsg;
		vertifyMsg = "[" + this.getNickname() + "]:[";
		String tempMsg = "";
		if(isNotNull(this.getTotalSingleDouble())) {
			tempMsg += getSplitMsg(this.getTotalSingleDouble(), " ");
		}
		if(isNotNull(this.getTotalBigSmall())) {
			tempMsg += getSplitMsg(this.getTotalBigSmall(), " ");
		}
		if(isNotNull(this.getTotalTailBigSmall())) {
			tempMsg += getSplitMsg(this.getTotalTailBigSmall(), " 尾");
		}
		if(isNotNull(this.getDragonTigger())) {//龙虎
			tempMsg += getSplitMsg(this.getDragonTigger(), " ");
		}
		if(isNotNull(this.getLeopard())) {//豹
			tempMsg += getSplitMsg(this.getLeopard(), " ");
		}
		if(isNotNull(this.getField1())) {//域
			tempMsg += " 码1(" + this.getFieldShowMsg(this.getField1()) + ")";
		}
		if(isNotNull(this.getField2())) {//域
			tempMsg += " 码2(" + this.getFieldShowMsg(this.getField2()) + ")";
		}
		if(isNotNull(this.getField3())) {//域
			tempMsg += " 码3(" + this.getFieldShowMsg(this.getField3()) + ")";
		}
		if(isNotNull(this.getField4())) {//域
			tempMsg += " 码4(" + this.getFieldShowMsg(this.getField4()) + ")";
		}
		if(isNotNull(this.getField5())) {//域
			tempMsg += " 码5(" + this.getFieldShowMsg(this.getField5()) + ")";
		}
    	return vertifyMsg + tempMsg + "]";
    }
    
    public String getSplitMsg(String field, String title) {
    	String[] fieldSplit = field.split(",", -1);
    	String ret = "";
    	for(String str : fieldSplit) {
    		if(isNotNull(str)) {
    			ret += title + str.substring(0, str.length()-2);
    		}
    	}
    	return isNotNull(ret)?ret:"";
    }
    
    public String getShowWin() {
    	long retAmt = this.getWinAmt() - this.getTransAmt();
    	double floatAmt = new BigDecimal(retAmt).movePointLeft(2).doubleValue();
    	return this.getNickname() + ":" + floatAmt;
    }
    
	private String getFieldShowMsg(String field1) {
		String retMsg = "";
		String[] fsplit = field1.split(",", -1);
		for(String f : fsplit) {
			if(isNotNull(f)) {
				retMsg += " " + f.substring(0, f.length()-2);
			}
		}
		return isNotNull(retMsg.substring(1))?retMsg.substring(1):"";
	}
	
	public boolean isNotNull(String ms) {
		if(null != ms && !ms.isEmpty()) {
			return true;
		}
		return false;
	}
	
    public void addLotteryOrder(TblLotteryOrder order) {
    	if(isNotNull(order.getTotalSingleDouble()))
    		this.setTotalSingleDouble(order.getTotalSingleDouble());
    	if(isNotNull(order.getTotalBigSmall()))
    		this.setTotalBigSmall(order.getTotalBigSmall());
    	if(isNotNull(order.getTotalTailBigSmall()))
    		this.setTotalTailBigSmall(order.getTotalTailBigSmall());
    	if(isNotNull(order.getDragonTigger()))
    		this.setDragonTigger(order.getDragonTigger());
    	if(isNotNull(order.getLeopard()))
    		this.setLeopard(order.getLeopard());
    	if(isNotNull(order.getField1()))
    		this.setField1(order.getField1());
    	if(isNotNull(order.getField2()))
    		this.setField2(order.getField2());
    	if(isNotNull(order.getField3()))
    		this.setField3(order.getField3());
    	if(isNotNull(order.getField4()))
    		this.setField4(order.getField4());
    	if(isNotNull(order.getField5()))
    		this.setField5(order.getField5());
    	if(null != order.getWinAmt())
    		this.winAmt+=order.getWinAmt();
    }
    
    public static void main(String[] args) {
    	TblLotteryOrderShow show = new TblLotteryOrderShow();
    	show.setNickname("龙五");
    	show.setDragonTigger("龙/10000");
    	show.setLeopard("豹/10000");
    	show.setTotalBigSmall("大/10000");
    	show.setTotalSingleDouble("单/10000");
    	show.setTotalTailBigSmall("大/10000");
    	//show.setField1("大/10000,,");
    	//show.setField2("大/10000,,");
    	//show.setField3("大/10000,,");
    	//show.setField4("大/10000,,");
    	show.setField5("大/10000,,");
    	TblLotteryOrder show2 = new TblLotteryOrder();
    	//show2.setNickname("龙五");
    	show2.setDragonTigger("龙/10000");
    	//show2.setField1("大/10000,,");
    	//show2.setField2("大/10000,,");
    	//show2.setField3("大/10000,,");
    	//show2.setField4("大/10000,,");
    	show2.setField5("大/10000,,");
    	show.addLotteryOrder(show2);
    	System.out.println(show.getShow());
    	System.out.println(show.getTransAmt());
    	//show.setWinAmt(100L);
    	System.out.println(show.getShowWin());
	}
}