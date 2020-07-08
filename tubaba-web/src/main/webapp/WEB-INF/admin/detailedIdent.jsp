<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="Shortcut Icon" href="/favicon.ico" />

<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--/meta 作为公共模版分离出去-->

<title>新增文章 - 资讯管理 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" method="post" enctype="multipart/form-data" action="attractions_add"  id="form-article-add" onsubmit="return article_add()">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>订单编号：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${indent.ordernumber}" disabled="disabled">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">订单价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${indent.price}" id="price" disabled="disabled">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">订单名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${indent.commodity}" disabled="disabled">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">游玩人数：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${indent.indentdetails.peopleCount}" disabled="disabled">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">下单时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text input-time" value="${indent.indentdetails.orderstime}" disabled="disabled">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">出行时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text input-time" value="${indent.indentdetails.starttime}" disabled="disabled">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">结束时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text input-time" value="${indent.indentdetails.endtime}" disabled="disabled">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">订单状态：</label>
			<div class="formControls col-xs-8 col-sm-9">
			<c:choose>
				  <c:when test="${indent.indentstatus == 0}">
				 	 <input type="text" class="input-text" value="已付款" disabled="disabled"> 	 		  
				  </c:when>
				  <c:when test="${indent.indentstatus == 1}">
				  	 <input type="text" class="input-text" value="待付款" disabled="disabled"> 	
				  </c:when>
				  <c:when test="${indent.indentstatus == 2}">
				  	 <input type="text" class="input-text" value="已取消" disabled="disabled"> 	
				  </c:when>
				  <c:when test="${indent.indentstatus == 3}">
				  	 <input type="text" class="input-text" value="退款中" disabled="disabled">
				  	 <input type="button" value="同意退款" id="delbutn">
				  </c:when>
				  <c:when test="${indent.indentstatus == 4}">
				  	 <input type="text" class="input-text" value="已退款" disabled="disabled">
				  </c:when>
				  <c:when test="${indent.indentstatus == 5}">
				  	 <input type="text" class="input-text" value="待评价" disabled="disabled">
				  </c:when>
				  <c:otherwise>
				 	 <input type="text" class="input-text" value="已评价" disabled="disabled">              		  
				  </c:otherwise>
			</c:choose>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">联系人姓名：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${indent.linkMan.realname}" disabled="disabled">
			</div>
			<label class="form-label col-xs-4 col-sm-2">联系人电话：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${indent.linkMan.iphone}" disabled="disabled">
			</div>
			<label class="form-label col-xs-4 col-sm-2">联系人email：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${indent.linkMan.email}" disabled="disabled">
			</div>
		</div>
		<c:forEach items="${playMan}" var="itms" varStatus="xh">
			<div class="row cl">
				<label class="form-label col-xs-4 col-sm-2">游玩人${xh.index+1}信息：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${itms.realname}" disabled="disabled">
				</div>
				<label class="form-label col-xs-4 col-sm-2">电话：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${itms.iphone}" disabled="disabled">
				</div>
				<label class="form-label col-xs-4 col-sm-2">身份证：</label>
				<div class="formControls col-xs-8 col-sm-9">
					<input type="text" class="input-text" value="${itms.identity}" disabled="disabled">
				</div>
			</div>
		</c:forEach>
		<input id="uploadPath" name="uploadPath" value="${indent.id}" hidden="hidden">
		<input id="cancel" name="cancel" value="${indent.cancel}" hidden="hidden">
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button onClick="cancelBack();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</article>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/admin/layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->

<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript" src="js/admin/tool.js"></script>
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
$(function(){
	Date.prototype.Format=function(fmt){
        var o={
            "M+":this.getMonth()+1,//月份
            "d+":this.getDate(),//日
            "H+":this.getHours(),//小时
            "m+":this.getMinutes(),//分
            "s+":this.getSeconds(),//秒
            "q+":Math.floor((this.getMonth()+3)/3),//季度
            "S+":this.getMilliseconds()//毫毛
        };
        if(/(y+)/.test(fmt)) fmt=fmt.replace(RegExp.$1,(this.getFullYear()+"").substr(4-RegExp.$1.length));
        for (var k in o)
            if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
        return fmt;
    };
	var dates = $('.input-time');
	for(var i = 0 ;i < dates.length ; i++){
		var date2 = new Date($(dates[i]).val());
		var date = new Date(date2.getTime() - 50400000);
		Y = date.getFullYear() + '-';
		M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
		D = date.getDate() + ' ';
		h = date.getHours() + ':'; 
		m = date.getMinutes() + ':';
		s = date.getSeconds(); 
		$(dates[i]).val(Y+M+D+h+m+s);
	} 
	$("#delbutn").click(function(){
		var id = $("#uploadPath").val();
		var cancel = $("#cancel").val();
		var price = $("#price").val();
		layer.confirm('您确定要退款吗？',{
			btn:["确定","取消"]
		},function(){
			$.ajax({
				type : "post",
	    		url  : "refund",
	    		data : "id="+id+"&cancel="+cancel+"&price="+price, 
	    		async:false,//默认为异步请求，设置false为同步
				success: function(res){
					if(res){
						parent.$("#handle").attr("value",1);
						var index = parent.layer.getFrameIndex(window.name);
						parent.layer.close(index);
					}	
				}
	    	});
		})
	})
})
function cancelBack() {
	var index = parent.layer.getFrameIndex(window.name);
	parent.$("#handle").attr("value",2);
	parent.layer.close(index);
}
</script>

<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>