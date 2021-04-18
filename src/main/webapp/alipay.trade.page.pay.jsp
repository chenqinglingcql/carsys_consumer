
<%@ page import="com.alipay.api.AlipayClient" %>
<%@ page import="com.alipay.api.DefaultAlipayClient" %>
<%@ page import="com.alipay.api.request.AlipayTradePagePayRequest" %>
<%@ page import="com.igeek.carsys.utils.AlipayConfig" %>
<%@ page import="com.igeek.carsys.entity.Order" %>
<%@ page import="java.util.Date" %>

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>付款</title>
</head>
<%
	//获得初始化的AlipayClient
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	
	//设置请求参数
	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	//请求完成后，执行的回调
	alipayRequest.setReturnUrl("/order?method=viewMyOrders");
	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

	//获取订单信息
	Order orders = (Order)session.getAttribute("order");
	System.out.println(orders);

	//商户订单号，商户网站订单系统中唯一订单号，必填
	String out_trade_no = orders.getOrder_id();
	//付款金额，必填
	String total_amount = orders.getTicket_price()+"";
	//起始站，必填
	String depart_station = orders.getDepart_station();
	//终点站
	String dest_station =orders.getDest_station();
	//车次
	String ticket_id=orders.getTicket_id();
	//出发日期
	Date depart_date =orders.getDepart_date();
	//出发时间
	String depart_time=orders.getDepart_time();
	//座位号
	int seat_id = orders.getSeat_id();
	//乘车人姓名
	String name = orders.getName();
	//乘车人身份证号
	String person_id = orders.getPerson_id();

	//乘车人联系方式
	String telephone = orders.getTelephone();

	String  body= orders.getDepart_station()+""+orders.getDest_station();
	String subject=orders.getOrder_id().toString();
	//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
			+ "\"total_amount\":\""+ total_amount +"\","
			+ "\"subject\":\""+ subject +"\","
			+ "\"body\":\""+ body +"\","
			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
	
	//请求
	String result = alipayClient.pageExecute(alipayRequest).getBody();
	
	//输出
	out.println(result);


%>
<body>
</body>
</html>