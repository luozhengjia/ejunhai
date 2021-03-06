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
			<span class="navbar-text col-xs-8" style="text-align:center;"><strong>物流查询</strong></span>
			<a href="${BasePath}/logout.jhtml" class="navbar-text col-xs-2" title="退出"><span class="glyphicon glyphicon-log-out"></span></a>
      	</div>
      	
		<div class="panel panel-info">
		  <div class="panel-heading"><strong>订单号：${orderMain.orderMainNo!""}</strong></div>
		  <div class="panel-body">
		  	<p>
		  		<#list orderLogList as item >
		  		<small>${item.createTime?string('yyyy-MM-dd HH:mm')}  ${item.behavioutDescribe!''}</small>
		  		<#if item_has_next><br></#if>
			  </#list>
		  	</p>
		  	<#if orderMain.state==1>
		  	<p>
		  		<button  type="button" id="btn_${orderMain.expressOrderNo!""}" class="btn btn-info btn-xs"
		  			onclick="showOrderLogisticsTrack('${orderMain.logisticsCompanyCode?default('shunfeng')}','${orderMain.expressOrderNo}');">查看物流信息</button>
		  	</p>
		  	<p id="logicInfo_${orderMain.expressOrderNo!""}"></p>
		  	</#if>
		  </div>
		</div>
		
		<#if orderRepl??>
		<div class="panel panel-info">
		  <div class="panel-heading"><strong>补货单：${orderRepl.orderReplNo!""}</strong></div>
		  <div class="panel-body">
		  	<p>
		  		<#list orderRepl.orderLogList as item >
					<small>${item.createTime?string('yyyy-MM-dd HH:mm')}  ${item.behavioutDescribe!''}</small>
					<#if item_has_next><br></#if>
				</#list>
		  	</p>
		  	<#if orderRepl.state==1>
		  	<p>
		  		<button  type="button" id="btn_${orderRepl.expressOrderNo!""}" class="btn btn-info btn-xs"
		  			onclick="showOrderLogisticsTrack('${orderRepl.logisticsCompanyCode?default('shunfeng')}','${orderRepl.expressOrderNo}');">查看物流信息</button>
		  	</p>
		  	<p id="logicInfo_${orderRepl.expressOrderNo!""}"></p>
		  	</#if>
		  </div>
		</div>
		</#if>
		
		<#include "/common/footer.ftl" >
	</div>
	
	<script src="http://ejunhai.qiniudn.com/jquery-1.10.2.min.js"></script>
    <script src="http://ejunhai.qiniudn.com/bootstrap.min.js"></script>
  </body>
</html>

<script type="text/javascript">
	function showOrderLogisticsTrack(logisticsCompanyCode,expressOrderNo){
		$("#btn_"+expressOrderNo).attr('disabled',"true")
		$.getJSON("http://api.ickd.cn/?com="+logisticsCompanyCode+"&type=json&encode=utf8&ord=desc&id=F88275FED9B2AFD04ECF53BD4EEFB3F9&nu="+expressOrderNo+"&callback=?",function(json){
			var html = [];  
            if(json.data){
            	for(var i=0;i<json.data.length;i++) {
					html.push('<small>'+ json.data[i].time +'&nbsp;'+ json.data[i].context +'</small>');
					html.push(i<json.data.length-1?'<br>':'');
				}
	        }else{
				html.push('<small style="color:red;">很抱歉，未获取到快递公司的配送信息，可能是由于快递官网信息未及时录入，请耐心等待，如有问题可登录快递官网查询或致电快递官方客服。</small>');
			}
			$("#logicInfo_"+expressOrderNo).html(html.join(''));
			$("#btn_"+expressOrderNo).removeAttr("disabled");
	    });
	}
</script>