<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>二维码交易流水查询</title>
<jsp:include page="/js/jsall.jsp"></jsp:include>
<script type="text/javascript" src="pagejs/console/business/trans/codeMap.js"></script>
<script type="text/javascript" src="pagejs/console/business/trans/qrcodeTrans.js"></script>
</head>

<body>
    <div id="queryCondition"
        style="background-color: #FBFEFF; padding: 5px;">
        <form id="queryForm" name="queryForm" action="#" method="post"
            style="padding: 0px; margin: 0px;">
            <table class="qtable" width="100%" cellspacing="1" cellpadding="1">
                <tr>
                    <td class="qlabel"><FONT color=red>&nbsp;</FONT>起始日期</td>
                    <td class="qinput"><input id="orderDatebg" name="orderDate" comparison="ge" /></td>
                    <td class="qlabel"><FONT color=red>&nbsp;</FONT>结束日期</td>
                    <td class="qinput"><input id="orderDateEnd" name="orderDate" comparison="le" /></td>
                    <td class="qlabel">商户</td>
                    <td class="qinput"><INPUT style="display: none;" id="qmid" name="mid" comparison="eq"> <INPUT id="qmerName" name="qmerName" readonly="readonly"></td>
                    <td class="qlabel">终端号</td>
                    <td class="qinput"><input type="text" value="" comparison="eq" id="qtid" qtype="string" name=tid size=20 /></td>
                </tr>
            <tr>
                    <td class="qlabel">订单类型</td>
                    <td class="qinput"><select id="orderType" name="orderType" comparison="eq">
                        <option></option>
                        <option>正扫</option>
                        <option>反扫</option>
                        <option>台牌</option>
                        </select></td>
                    <td class="qlabel">二维码渠道号</td>
                    <td class="qinput"><select id="qrcChannel" name="qrcChannel" comparison="eq">
                        <option></option>
                        <option>民生</option>
                        <option>恒丰</option>
                        <option>上海银行</option>
                   <!--      <option>银联</option>     -->
                        </select></td>
                    <td class="qlabel">支付状态</td>
                    <td class="qinput"><select id="qrcPaymentStatus" name=qrcPaymentStatus comparison="eq">
                        <option></option>
                        <option>初始</option>
                        <option>成功</option>
                        <option>处理中</option>
                        <option>失败</option>
                        </select></td>
                    <td class="qlabel">结算状态</td>
                    <td class="qinput"><select id="checkFlag" name=checkFlag comparison="eq">
                        <option></option>
                        <option>已结算</option>
                        <option>未结算</option>
                        </select></td>
                </tr>
                <tr>
                    <td class="qlabel">结算日期</td>
                    <td class="qinput"><input id="clearDate" name="clearDate" comparison="eq" /></td>
                <td/><td/><td/><td/><td/><td/>
                </tr>
                <tr>
                    <td bgcolor="#ffffff" colspan="6" align="center">
                        <input id="querybutton" class="bt" value="查询" type="button"> 
                        <input class="bt" value="重置" type="reset" />
                    </td>
                    <td colspan="2">
                        自动刷新间隔: 
                        <select id="reloadIntervalField">
                            <option value="-9999" selected="selected">不刷新</option>
                            <option value="5000" >5秒</option>
                            <option value="10000" >10秒</option>
                            <option value="15000" >15秒</option>
                            <option value="30000" >30秒</option>
                            <option value="60000" >60秒</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <DIV id="table"></DIV>
    <!-- 上级机构选择弹出窗口 -->
    <div id="merchantSelect" style="display: none;">
        <form>
            <table class="qtable" width="100%" cellspacing="1" cellpadding="1">
                <tr>
                    <td class="qlabel">商户名称</td>
                    <td class="qinput"><input type="text" name="merName" comparison="like" qtype="string" /></td>
                    <td class="qlabel">商户代码</td>
                    <td class="qinput"><input type="text" name="orgCode" comparison="like" qtype="string" /></td>
                </tr>
                <tr>
                    <td colspan="4" align="center" bgcolor="#ffffff">
                        <input type="button" class="bt qbutton" id="querysup" value="查询" /> 
                        <input type="reset" class="bt" value="重置" /></td>
                </tr>
            </table>
        </form>
    </div>



    <div id="qrcTransDetail"styley:none;">
        <form id="form2">
            <table class="ftable" cellpadding="1" cellspacing="1" width="100%">
                <TBODY>
                    <TR>
                        <TD class="flabel">机构号：</TD>
                        <TD class="finput"><INPUT id=instId name=instId></TD>
                    </TR>
                    <TR>
                        <TD class="flabel">商户号：</TD>
                        <TD class="finput"><INPUT id=mid name=mid>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">终端号：</TD>
                        <TD class="finput"><INPUT id=tid name=tid>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">订单号：</TD>
                        <TD class="finput"><INPUT id=orderId name=orderId>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">订单日期：</TD>
                        <TD class="finput"><INPUT id="orderDate" name="orderDate">
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">订单时间：</TD>
                        <TD class="finput"><INPUT id="orderTime" name="orderTime">
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">订单类型：</TD>
                        <TD class="finput"><INPUT id="orderType" name=orderType>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">平台流水号：</TD>
                        <TD class="finput"><INPUT id="platformSeq" name=platformSeq></TD>
                    </TR>
                    <TR>
                        <TD class="flabel">二维码渠道号：</TD>
                        <TD class="finput"><INPUT id="qrcChannel" name=qrcChannel></TD>
                    </TR>
                    <TR>
                        <TD class="flabel">二维码渠道标志：</TD>
                        <TD class="finput"><INPUT id="qrcChannelFlag" name=qrcChannelFlag></TD>
                    </TR>
                    <TR>
                        <TD class="flabel">二维码渠道商户号：</TD>
                        <TD class="finput"><INPUT id="qrcChannelMid" name=qrcChannelMid>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">二维码渠道终端号：</TD>
                        <TD class="finput"><INPUT id="qrcChanneTid" name=qrcChanneTid></TD>
                    </TR>
                    <TR>
                        <TD class="flabel">二维码支付状态：</TD>
                        <TD class="finput"><INPUT id="qrcPaymentStatus" name=qrcPaymentStatus></TD>
                    </TR>
                    <TR>
                        <TD class="flabel">卡号：</TD>
                        <TD class="finput"><INPUT id="cardNo" name=cardNo>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">虚拟用户标志：</TD>
                        <TD class="finput"><INPUT id="virtualAcctNo" name=virtualAcctNo>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">交易金额：</TD>
                        <TD class="finput"><INPUT id="tradeAmount" name=tradeAmount>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">手续费金额：</TD>
                        <TD class="finput"><INPUT id="feeAmount" name=feeAmount></TD>
                    </TR>
                    <TR>
                        <TD class="flabel">清算净额：</TD>
                        <TD class="finput"><INPUT id="netAmount" name=netAmount>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">借贷标志：</TD>
                        <TD class="finput"><INPUT id="creditDebitFlag" name=creditDebitFlag>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">bipi发送方式：</TD>
                        <TD class="finput"><INPUT id="bipiSendMode" name=bipiSendMode>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">bipi发送ID：</TD>
                        <TD class="finput"><INPUT id="bipiSendId" name=bipiSendId>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">bipi发送日期：</TD>
                        <TD class="finput"><INPUT id="bipiSendDate" name=bipiSendDate>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">bipi发送时间：</TD>
                        <TD class="finput"><INPUT id="bipiSendTime" name=bipiSendTime></TD>
                    </TR>
                    <TR>
                        <TD class="flabel">bipi状态：</TD>
                        <TD class="finput"><INPUT id="bipiStatus" name=bipiStatus>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">bipi应答码：</TD>
                        <TD class="finput"><INPUT id="bipiRespCode" name=bipiRespCode>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">bipi应答消息：</TD>
                        <TD class="finput"><INPUT id="bipiRespMessage" name=bipiRespMessage>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">bipi订单跟踪号：</TD>
                        <TD class="finput"><INPUT id="bipiTraceId" name="bipiTraceId" />
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">bipi返回日期：</TD>
                        <TD class="finput"><INPUT id="bipiRespDate" name=bipiRespDate>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel"> bipi返回时间：</TD>
                        <TD class="finput"><INPUT id="bipiRespTime" name=bipiRespTime>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">bipi应答扩展域1：</TD>
                        <TD class="finput"><INPUT id="bipiRespResv1" name=bipiRespResv1></INPUT></TD>
                    </TR>
                    <TR>
                        <TD class="flabel">bipi应答扩展域2：</TD>
                        <TD class="finput"><INPUT id="bipiRespResv2" name=bipiRespResv2></INPUT></TD>
                    </TR>
                    <TR>
                        <TD class="flabel">对账标志：</TD>
                        <TD class="finput"><INPUT id="checkFlag" name=checkFlag>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">清算日期：</TD>
                        <TD class="finput"><INPUT id="clearDate" name=clearDate>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">小票打印标志：</TD>
                        <TD class="finput"><INPUT id="printFlag" name=printFlag></TD>
                    </TR>
                    <TR>
                        <TD class="flabel">备注：</TD>
                        <TD class="finput"><INPUT id="remark" name=remark>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">支付扩展域1：</TD>
                        <TD class="finput"><INPUT id="paymentResv1" name=paymentResv1>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">支付扩展域2：</TD>
                        <TD class="finput"><INPUT id="paymentResv2" name=paymentResv2>
                        </TD>
                    </TR>
                    <TR>
                        <TD class="flabel">支付扩展域3：</TD>
                        <TD class="finput"><INPUT id="paymentResv3" name=paymentResv3>
                        </TD>
                    </TR>
                </TBODY>

            </table>
            <input id="formreset" style="display: none;" type="reset" />
        </form>
    </div>

<!--  
<div id="contactPosTrans" class="detailDialog" style="display:none;">
    <table >
        <tr>
           <td class="detailtd">
            <div  class="titleDiv">
                <div class="dtitle">关联交易</div>
            </div>
            <div style="overflow: auto; width=100%; background:#ffffff">
                <div id="contactPosTransDetail" ></div>
            </div>
           </td>
           </tr>        
    </table>
</div>-->
</body>
</html>
