<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <title>骏海水产大闸蟹预定系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
  </head>
  
  <body style="padding-top: 70px;">
	<div class="container">
		<div class="navbar navbar-default navbar-fixed-top">
			<a href="${BasePath}/dispatchCenter.jhtml" class="navbar-text col-xs-2" title="返回"><span class="glyphicon glyphicon-arrow-left"></span></a>
			<span class="navbar-text col-xs-8 text-center"><strong>订单详情</strong></span>
			<a href="${BasePath}/logout.jhtml" class="navbar-text col-xs-2 pull-right" title="退出"><span class="glyphicon glyphicon-log-out"></span></a>
	  	</div>
			
		<div class="panel panel-info">
		  <div class="panel-heading"><strong>订单信息</strong></div>
		  <div class="panel-body">
		  	<small><strong>订单编号</strong>：${orderMain.orderMainNo}</small><br>
		  	<small><strong>发货日期</strong>：${orderMain.orderDate?date}</small><br>
		    <small><strong>下单时间</strong>：${orderMain.createTime?string('yyyy-MM-dd HH:mm')}</small>
		  </div>
		</div>
		
		<div class="panel panel-info">
		  <div class="panel-heading"><strong>礼品券信息</strong></div>
		  <div class="panel-body">
		 	<small><strong>礼品券名称</strong>：${couponScheme.couponName!""}</small><br>
		 	<small><strong>礼品券面额</strong>：${couponScheme.parValue?c}元</small><br>
		    <small><strong>礼品券编号</strong>：${coupon.couponNumber!""}</small><br>
		    <small><strong>礼品券描述</strong>：${couponScheme.remark!""}</small>
		  </div>
		</div>
		
		<div class="panel panel-info">
		  <div class="panel-heading"><strong>收货人信息</strong></div>
		  <div class="panel-body">
		  	<small><strong>姓名</strong>：${orderMain.consignee!""}</small><br>
		  	<small><strong>手机号码</strong>：${orderMain.mobilePhone!""}</small><br>
		    <small><strong>地区</strong>：${orderMain.provinceCityArea!""}</small><br>
		    <small><strong>详细地址</strong>：${orderMain.detailAddress!""}</small>
		  </div>
		</div>
		
		<#include "/common/footer.ftl" >
	</div>
	
  </body>
</html>