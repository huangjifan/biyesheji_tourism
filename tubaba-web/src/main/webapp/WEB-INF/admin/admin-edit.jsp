<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加管理员 - 管理员管理</title>
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
	<form class="form form-horizontal" id="form-admin-add">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>管理员：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text"  placeholder="" id="admName" name="admName" value="${admin.admName}">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>密码：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="password" class="input-text" autocomplete="off" value="${admin.admPass}" placeholder="密码" id="admPass" name="admPass">
		</div>
	</div>
	<input type="hidden" value = "${admin.admId}" id = "admId">
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>性别：</label>
		<div class="formControls col-xs-8 col-sm-9 skin-minimal">
			<c:if test="${admin.admSex == '男' }">
			<div class="radio-box">
				<input name="admSex" type="radio" id="sex-1" value="男" checked >
				<label for="sex-1">男</label>
			</div>
			<div class="radio-box">		
				<input type="radio" id="sex-2" name="admSex" value = "女">
				<label for="sex-2">女</label>			
			</div>
			</c:if>
			<c:if test="${admin.admSex == '女' }">
			<div class="radio-box">
				<input name="admSex" type="radio" id="sex-1" value="男" >
				<label for="sex-1">男</label>
			</div>
			<div class="radio-box">		
				<input type="radio" id="sex-2" name="admSex" value = "女" checked>
				<label for="sex-2">女</label>			
			</div>
			</c:if>
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>手机：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" value="${admin.admPhone}" placeholder="" id="admPhone" name="admPhone">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>邮箱：</label>
		<div class="formControls col-xs-8 col-sm-9">
			<input type="text" class="input-text" placeholder="@" name="admEmail" id="email" value="${admin.admEmail}">
		</div>
	</div>
	<div class="row cl">
		<label class="form-label col-xs-4 col-sm-3">角色：</label>
		<div class="formControls col-xs-8 col-sm-9"> <span class="select-box" style="width:150px;">
			<c:if test="${admin.admPermissions == 0}">
				<input type="text" class="input-text" value="超级管理员" disabled="disabled">
			</c:if>
			<c:if test="${admin.admPermissions == 1}">
			<select class="select" name="admPermissions" size="1">
				<option value="1">产品经理</option>
				<option value="2">项目经理</option>
				<option value="3">开发人员</option>
			</select>
			</c:if>
			<c:if test="${admin.admPermissions == 2}">
			<select class="select" name="admPermissions" size="1">
				<option value="2">项目经理</option>
				<option value="1">产品经理</option>
				<option value="3">开发人员</option>
			</select>
			</c:if>
			<c:if test="${admin.admPermissions == 3}">
			<select class="select" name="admPermissions" size="1">
			<option value="3">开发人员</option>
				<option value="1">产品经理</option>
				<option value="2">项目经理</option>
				
			</select>
			</c:if>
			
			</span> </div>
	</div>
	<div class="row cl">
		<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
			<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
		</div>
	</div>
	</form>
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
$(function(){
	$('.skin-minimal input').iCheck({
		checkboxClass: 'icheckbox-blue',
		radioClass: 'iradio-blue',
		increaseArea: '20%'
	});
	
	$("#form-admin-add").validate({
		rules:{
			admName:{
				required:true,
				maxlength:16
			},
			admPass:{
				required:true,
				minlength:6,
				maxlength:16
			},
			
			admSex:{
				required:true,
			},
			admPhone:{
				required:true,
				isPhone:true,
			},
			admEmail:{
				required:true,
				email:true,
			},
			admPermissions:{
				required:true,
			},
		},
		onkeyup:false,
		focusCleanup:true,
		success:"valid",
		submitHandler:function(form){
			var admId = $("#admId").val();

			
			$(form).ajaxSubmit({
				type: 'post',
				url: "editAdmin?admId="+admId ,
				async : false,
	            cache : false,
				success: function(data){
					alert("修改成功");
					//layer.msg('添加成功!',{icon:1,time:1000});
				},
                error: function(XmlHttpRequest, textStatus, errorThrown){
					layer.msg('error!',{icon:1,time:1000});
				}
			}); 
			
			var index = parent.layer.getFrameIndex(window.name);
			parent.$('.btn-refresh').click();
			parent.layer.close(index);
		}
	});
});
</script> 
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>