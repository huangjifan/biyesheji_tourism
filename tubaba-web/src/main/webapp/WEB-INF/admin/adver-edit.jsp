<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加广告分类</title>
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
</head>
<body>
<article class="page-container">
<!-- 	<form class="form form-horizontal" id="form-admin-add" action="addtitle" method="post"> -->
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>输入广告 分类名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text"  value="${advder.name }" placeholder="" id="name" name="name">
				<input type="hidden" id="adverId" value="${advder.id }"/>
				<span id="titlde"></span>
			</div>
		</div>
		<div class="row cl">
			<label class="from-label col-xs-4 col-sm-3">所属节点 </label>
			<div class="formControls col-xs-8 col-sm-9">
				<c:forEach items="${advelist}" var="adv">
					<c:if test="${adv.id==advder.id }">
						<input type="radio" value="${adv.id }"  id="upid" name="upid" checked="checked">${adv.name}
					</c:if>
					<c:if test="${adv.id!=advder.id }">
						<input type="radio" value="${adv.id }"  id="upid" name="upid">${adv.name}
					</c:if>
				</c:forEach>
			</div>
		</div>
		<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" type="button" onclick="sub()" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
</article>

<!--_footer 作为公共模版分离出去--> 
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/jquery.validation/1.14.0/jquery.validate.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/validate-methods.js"></script> 
<script type="text/javascript" src="lib/jquery.validation/1.14.0/messages_zh.js"></script> 
<script type="text/javascript">
function sub(){
	var title=$("#name").val();
	/* alert($('input:radio:checked').val()) */
	 if(title==""){
		$("#titlde").html("内容不得为空");
		$("#titlde").css("color","red");
		$("#titlde").css("font-size","12px");
	}else{
		var chektitl=false;
		$.ajax({
			url:'chekadver',
			type:'post',
			async:false,
			data:{
				'name':$("#name").val(),
			},success:function(result){
				chektitl=result;
			}
		})
		if(chektitl==false){
			$("#titlde").html("此分类已存在！！");
			$("#titlde").css("color","red");
			$("#titlde").css("font-size","12px");
		}else{
			$("#titlde").html("");
			$.ajax({
				url:'editadver',
				type:'post',
				data:{
					'name':$("#name").val(),
					"upid":$('input:radio:checked').val(),
					"id":$("#adverId").val(),
				},success:function(result){
					if(result==true){
						layer.alert("分类修改成功！",function(){
							window.parent.location.reload();
						/* 	 parent.layer.close(index);  */
						})
					}else{
						alert("增加失败");
					}
				}
			})
		}
	} 
}
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	
	
	$("#name").blur(function(){
		var title=$("#name").val();
		if(title==""){
			$("#titlde").html("内容不得为空");
			$("#titlde").css("color","red");
			$("#titlde").css("font-size","12px");
		}else{
			$.ajax({
				url:'chekadver',
				type:'post',
				data:{
					'name':$("#name").val(),
				},success:function(result){
					console.log(result)
					if(result==false){
						$("#titlde").html("此分类 已存在！！");
						$("#titlde").css("color","red");
						$("#titlde").css("font-size","12px");
					}else{
						$("#titlde").html("");
					}
				}
			})
		}
	})
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>