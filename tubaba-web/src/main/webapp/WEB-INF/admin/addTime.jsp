<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<link rel="stylesheet" type="text/css" href="js/admin/layui-v2.4.5/layui/css/layui.css"  media="all"/>
<!--/meta 作为公共模版分离出去-->
<title>我的桌面</title>
</head>
<body>
<button  id="addDate"  class="layui-btn" >
<i class="layui-icon">&#xe608;</i> 添加
</button>
<!-- <input type="button" id="addDate"  value="添加" /> -->
<div class="page-container">
	<form class="form form-horizontal  layui-form" method="post" onsubmit="return validateOn()" action="attractions-line"  id="myForm" >
	  	 <table border="1" cellpadding="0" cellspacing="0" id="mytable">
	  	 	<c:forEach items="${list}" var="itms" varStatus="index">
	  	 	<tr>
	  	 		<div class="layui-form-item">
				   	<div class="layui-inline">
					      <label class="layui-form-label">选择日期</label>
					      <div class="layui-input-inline">
					        	<input type="text"  name="date${index.index }" value="${itms.departtime}" id="date${index.index }" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input datetime">
					      		<input type="hidden" name="hidden${index.index }" value="${itms.departtime}" id="hidden${index.index }" />
					      </div>
				    </div>
				   	<div class="layui-inline">
					      <label class="layui-form-label">输入金额</label>
					      <div class="layui-input-inline">
					        	<input type="text" name="number" value="${itms.price} " lay-verify="required|number" autocomplete="off" class="layui-input">
					      </div>
				    </div>
				    <div class="layui-inline">
					        <!-- <button class="layui-btn layui-btn-sm layui-btn-danger" onclick="delecttr(this)" id="delbutn">
							  <i class="layui-icon">&#xe640;</i>
							</button> -->
							<input type="button" value="删除" onclick="delecttr(this)"/>
				    </div>
			  	</div>
	  	 	</tr>
	  	 	</c:forEach>
	  	 </table>
	  	 <div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
	  	 		<input type="submit" class="btn btn-secondary radius" />
				<button onClick="cancelBack();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
	  	 	</div>
  	 	</div>
  	 	<input id="wayId" name="wayId" value="${wayId }" type="hidden">
	</form>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/admin/layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script>
/* function checkRepetition(obj){
	alert(1111);
	var dates = $('.datetime[name!='+$(obj).attr('name')+']');
	for(var i = 0 ; i < dates.length ; i++){
		if(new Date($(dates[i]).val()) == new Date($(obj).val())){
			return false;
		}
	}
	return true;
} */
function delecttr(obj){
    /* var tr = obj.parentNode.parentNode;
    tr.parentNode.removeChild(tr); */
    $(obj).parent().parent().remove();
    
}
var id;
$(function(){
	var dates = $('.datetime');
	for(var i = 0 ;i < dates.length ; i++){
		var date = new Date($(dates[i]).val());
		Y = date.getFullYear() + '-';
		M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
		D = date.getDate() + ' ';
		h = date.getHours() + ':';
		m = date.getMinutes() + ':';
		s = date.getSeconds();
		$(dates[i]).val(Y+M+D);
		$(dates[i]).next().val(Y+M+D);
	}
	id = $('#mytable').find('tbody').find('tr').length;
	
	layui.use(['laydate','form'], function(){
		 var form = layui.form
		 ,laydate = layui.laydate;
		 
		 
		 /* laydate.render({
		    elem: '#date'
		  }); */
		var date = new Date();
	    Y = date.getFullYear() + '-';
		M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
		D = date.getDate() + ' ';
		h = date.getHours() + ':';
		m = date.getMinutes() + ':';
		s = date.getSeconds();
		//核心方法
		 function timeAdd(){
	         lay('.datetime').each(function() {
	        	 var obj = $(this);
	             laydate.render({
	                 elem : this,
	                 trigger : 'click',
	                 /* mark:{
	                     '2018-11-11': '发布'//自定义标注重要日子
	                 }, */
	                 min: Y+M+D,  //最小日期为当前日期的前一天  
	                 done:function(value,date,endDate){//value, date, endDate点击日期、清空、现在、确定均会触发。回调返回三个参数，分别代表：生成的值、日期时间对象、结束的日期时间对象
	                	var dates = $('.datetime[name!='+obj.attr('name')+']');
	                	var date2 = new Date(obj.val());
	                	Y2 = date2.getFullYear() + '-';
            			M2 = (date2.getMonth()+1 < 10 ? '0'+(date2.getMonth()+1) : date2.getMonth()+1) + '-';
            			D2 = date2.getDate() + ' ';
                		for(var i = 0 ; i < dates.length ; i++){
                			if($(dates[i]).val() != ''){
                				var date1 = new Date($(dates[i]).val());
                    			Y1 = date1.getFullYear() + '-';
                    			M1 = (date1.getMonth()+1 < 10 ? '0'+(date1.getMonth()+1) : date1.getMonth()+1) + '-';
                    			D1 = date1.getDate() + ' ';
                    			if((Y1+M1+D1).trim() == value.trim()){
                    				obj.val(obj.next().val());
                    				return;
                    			}
                			}
                		}
                		obj.next().val(value);
	                 }
	             });
	         });
	     }
		
		 timeAdd()
		
		$('#addDate').click(function(){
			$('div.row').before($("<div class=\"layui-form-item\">\r\n" + 
					"				   	<div class=\"layui-inline\">\r\n" + 
					"					      <label class=\"layui-form-label\">选择日期</label>\r\n" + 
					"					      <div class=\"layui-input-inline\">\r\n" + 
					"					        	<input type=\"text\" name=\"date"+id+"\" onchange=\"checkRepetition(obj)\" value=\"\" id=\"date"+id+"\" lay-verify=\"date\" placeholder=\"yyyy-MM-dd\" autocomplete=\"off\" class=\"layui-input datetime\">\r\n" +
					"								<input type=\"hidden\" name=\"hidden"+id+"\" value=\"\" id=\"hidden"+id+"\" />\r\n"+			
					"					      </div>\r\n" + 
					"				    </div>\r\n" + 
					"				   	<div class=\"layui-inline\">\r\n" + 
					"					      <label class=\"layui-form-label\">输入金额</label>\r\n" + 
					"					      <div class=\"layui-input-inline\">\r\n" + 
					"					        	<input type=\"text\" name=\"number\" value=\"${itms.price} \" lay-verify=\"required|number\" autocomplete=\"off\" class=\"layui-input\">\r\n" + 
					"					      </div>\r\n" + 
					"				    </div>\r\n" + 
					"				    <div class=\"layui-inline\">\r\n" + 
					"					<input type=\"button\" value=\"删除\" onclick=\"delecttr(this)\"/>\r\n"+
					"				    </div>\r\n" + 
					"			  	</div>"));/* .insertAfter($('.layui-form-item').eq($('.layui-form-item').length-1)); */
			form.render(); 
			id = id + 1;
			timeAdd();
		})
		
	})
})
function cancelBack() {
	var index = parent.layer.getFrameIndex(window.name);
	parent.$("#handle").attr("value",2);
	parent.layer.close(index);
}
function validateOn(){
	var id = $("#wayId").val();
	
	var date = new Array();
	var number = new Array();
	var dates = $('input.datetime');
	var numbers = $('input[name="number"]');
	var decimalReg= /(^[1-9]([0-9]+)?(\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\.[0-9]([0-9])?$)/;
	for(var i = 0 ; i<dates.length; i++){
		if($(dates[i]).val() == ''){
			continue;
		}
		if($(numbers[i]).val() == '' || !decimalReg.test($(numbers[i]).val().trim())){
			alert('请输入正确价格');
			return false;
		}
		date.push($(dates[i]).val().trim());
		number.push($(numbers[i]).val().trim());
		/* date += $(dates[i]).val().trim()+',';
		number += $(numbers[i]).val().trim()+','; */
	}
	if(date.length == 0 || number.length == 0)
	{
		return false;		
	}else{
		$.ajax({
    		url:'addIdent',
			dataType:"json",
			type:"Get",
			data:"id="+id+"&dates="+date+"&numbers="+number,
			async:false,//默认为异步请求，设置false为同步
			success: function(res){
				if(res){
					layer.msg('编辑成功', { 
						 icon: 1,
					 time: 1500 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
						window.location.href = 'attractions-line';
					});   
					
				}
			}
    	})
	}
	return false;
}
</script>
</body>
</html>