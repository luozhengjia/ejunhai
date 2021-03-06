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
			<span class="navbar-text col-xs-offset-2 col-xs-8" style="text-align:center;"><strong>欢迎登入骏海水产预定系统</strong></span>
			<a href="${BasePath}/logout.jhtml" class="navbar-text col-xs-2" title="退出"><span class="glyphicon glyphicon-log-out"></span></a>
      	</div>
      	
      	<#if createOrderSuccess??>
	    <div class="alert alert-success alert-dismissable">
		  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
		  <h4>恭喜你，预约成功！</h4>
		  <p><small>我们将尽快为您配送，请您耐心等候！</small></p>
		</div>
		</#if>
		
		<div class="list-group">
		  <a href="${BasePath}/orderInfo.jhtml" class="list-group-item">
		  	<div class="media">
				<img src="${BasePath}/images/order.png" width="64px" height="64px" class="pull-left media-object" alt='' />
				<div class="media-body">
					<h4 class="media-heading">订单信息</h4> 
					<small>查看你的订单信息.</small>
				</div>
			</div>
		  </a>
		  <a href="${BasePath}/logistics.jhtml" class="list-group-item">
		  	<div class="media">
				 <img src="${BasePath}/images/logistics.png" width="64px" height="64px" class="pull-left media-object" alt='' />
				<div class="media-body">
					<h4 class="media-heading">物流查询</h4> 
					<small>物流信息快速跟踪.</small>
				</div>
			</div>
		  </a>
		  <a href="${BasePath}/afterSaleCons.jhtml" class="list-group-item">
		  	<div class="media">
				 <img src="${BasePath}/images/consult.png" width="64px" height="64px" class="pull-left media-object" alt='' />
				<div class="media-body">
					<h4 class="media-heading">咨询留言</h4> 
					<small>有任何问题都可以给我们留言.</small>
				</div>
			</div>
		  </a>
		  <a href="${BasePath}/afterSaleRequ.jhtml" class="list-group-item">
		  	<div class="media">
				 <img src="${BasePath}/images/apply.png" width="64px" height="64px" class="pull-left media-object" alt='' />
				<div class="media-body">
					<h4 class="media-heading">死蟹申请</h4> 
					<small>请您拍照并说明原因，我们会尽快为您解决.</small>
				</div>
			</div>
		  </a>
		</div>
		
		<#include "/common/footer.ftl" >
	</div>

    <script src="http://ejunhai.qiniudn.com/jquery-1.10.2.min.js"></script>
    <script src="http://ejunhai.qiniudn.com/bootstrap.min.js"></script>
  </body>
</html>