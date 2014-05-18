<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <title>骏海水产大闸蟹预定系统</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    
    <!-- Bootstrap -->
    <link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="${BasePath}/css/bootstrap-validator.min.css">
    <link rel="stylesheet" href="${BasePath}/css/bootstrap-datetimepicker.min.css">
  </head>
  
  <body style="padding-top: 70px;">
	<div class="container">
		<div class="navbar navbar-default navbar-fixed-top">
			<a href="${BasePath}/logout.jhtml" class="navbar-text col-xs-2" title="返回"><span class="glyphicon glyphicon-arrow-left"></span></a>
			<span class="navbar-text col-xs-8 text-center" ><strong>预约大闸蟹</strong></span>
			<a href="${BasePath}/logout.jhtml" class="navbar-text col-xs-2" title="退出"><span class="glyphicon glyphicon-log-out"></span></a>
      	</div>
      	
	    <form id="orderForm" class="form-horizontal"  method="POST" action="${BasePath}/createOrder.jhtml">
			<div class="panel panel-info">
			  <div class="panel-heading"><strong>您的礼品券信息</strong></div>
			  <div class="panel-body">
			    <small><strong>券号</strong>：${coupon.couponNumber!""}</small><br>
			    <small><strong>礼品券面值</strong>：${couponScheme.parValue?c}元</small><br>
			    <small><strong>礼品券内容</strong>：${couponScheme.remark!""}</small>
			  </div>
			</div>
			
			<div class="panel panel-info">
			  <div class="panel-heading"><strong>请您选择发货时间</strong></div>
			  <div class="panel-body">
			  	<div class="form-group" style="margin-bottom: 0px;">
                    <div class="col-xs-12">
                        <div class="input-group date form_date" id="datetimepicker">
                            <input type="text" name="orderDate" class="form-control" placeholder="发货时间，需提前2天预定"/>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
                        </div>
                    </div>
                </div>
			  </div>
			</div>
			
			<div class="panel panel-info">
			  <div class="panel-heading"><strong>请您填写正确的收货人信息</strong></div>
			  <div class="panel-body">
				  <div class="form-group">
				    <div  class="col-xs-12">
				      <input type="text" name="consignee" class="form-control input-sm" placeholder="收货人姓名">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-xs-12">
				      <input type="text" name="mobilePhone" class="form-control input-sm" placeholder="收货人手机号码">
				    </div>	
				  </div>
				  <div class="form-group">
				    <div class="col-xs-12">
				      <div id="district" class="clearfix"></div>
				       <span id="provinceCityArea_tip"><small class="help-block">请选择收货人所在省市区</small></span>
					  <input type="hidden" name="provinceCode" id="provinceCode" />
					  <input type="hidden" name="cityCode" id="cityCode" />
					  <input type="hidden" name="areaCode" id="areaCode" />
				    </div>	
				  </div>
				  <div class="form-group" style="margin-bottom: 0px;">
				    <div class="col-xs-12">
				    	<input type="text" name="detailAddress" class="form-control input-sm" placeholder="收货人详细地址">
				    </div>	
				  </div>
			  </div>
			</div>
			
			 <div>
		      <button type="submit" class="btn btn-info btn-lg btn-block"><strong>提交</strong></button>
		    </div>
		    <br/>
	    </form>
	</div>
	
	<#include "/common/footer.ftl" >

	<script src="${BasePath}/js/jquery-1.10.2.min.js"></script>
    <script src="${BasePath}/js/bootstrap.min.js"></script>
    <script src="${BasePath}/js/bootstrap-validator.min.js"></script>
    <script src="${BasePath}/js/base.junhai.js"></script>
    <script src="${BasePath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${BasePath}/js/bootstrap-datetimepicker.zh-CN.js"></script>
    <script src="${BasePath}/js/areaselecor.js"></script>
    
    <script>
    	$(function(){
    		// 日期选择器
    		$('#datetimepicker').datetimepicker({
    			keyboardNavigation:false,
    			pickerPosition:'bottom-left',
    			format: 'yyyy-mm-dd',
    			startDate: '${startDate!""}',
    			endDate:'${endDate!""}',
    			autoclose: true,
    			minView: 2,
    			maxView: 2,
    			language:'zh-CN'
			}).on('changeDate', function(ev){
				 $('#orderForm').data('bootstrapValidator').updateStatus('orderDate', 'NOT_VALIDATED', null).validateField('orderDate');
			});;
    		
    		// 省市区选择器
    		$("#district").areaSelecor({valueType:'id',province:'',city:'',area:'',change:function(province,city,area){
    			if(JunHai.Util.isEmpty(area)){
    				$("#areaCode").val('');
    			}else{
    				$("#provinceCode").val(province);
    				$("#cityCode").val(city);
    				$("#areaCode").val(area);
    			}
    			
    			districtValidator($("#areaCode").val());
    		}});
    		
    		// 省市区选择器验证
    		function districtValidator(area){
    			if(JunHai.Util.isEmpty(area)){
    				$("#district span").removeClass('has-success').addClass('has-error');
    				$("#provinceCityArea_tip").removeClass('has-success').addClass('has-error');
    				return false;
    			}else{
    				$("#district span").removeClass('has-error').addClass('has-success');
    				$("#provinceCityArea_tip").removeClass('has-error').addClass('has-success');
    				return true;
    			}
    		}
    		
    		$('button[type="submit"]').click(function() {  
			    districtValidator($("#areaCode").val());
			}); 
    		
    		// 表单验证
    		$('#orderForm').bootstrapValidator({
				live: 'enabled',
				submitHandler: function(validator, form, submitButton) {
					if(districtValidator($("#areaCode").val())){
						validator.defaultSubmit();
					}
	            },
		        fields: {
		        	 orderDate: {
		                validators: {
		                    notEmpty: {
		                        message: '请选择送货日期'
		                    }
		                }
		            },
		            consignee: {
		                validators: {
		                    notEmpty: {
		                        message: '请输入收货人姓名'
		                    }
		                }
		            },
		            mobilePhone: {
		                validators: {
		                    notEmpty: {
		                        message: '请输入收货人手机号码'
		                    },
		                    regexp: {
		                        regexp: /^(13[0-9]|14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|2|3|5|6|7|8|9])\d{8}$/,
		                        message: '手机号码无效'
		                    }
		                }
		            },
		            detailAddress: {
		                validators: {
		                    notEmpty: {
		                        message: '请输入详细地址'
		                    }
		                }
		            }
		        }
		    });
    	});
    </script>
  </body>
</html>