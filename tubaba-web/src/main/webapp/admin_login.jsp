<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />

<title>后台登录</title>
</head>
<body>

<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"></div> 
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="admin_login" method="post" onsubmit="return validation()">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="adminName" name="adminName" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="adminPass" name="adminPass" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
     <!--  <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input id="mycode" class="input-text size-L" type="text" placeholder="验证码"  onclick="if(this.value=='验证码:'){this.value='';}" value="" style="width:120px;">
          <img src="code" id="code" onclick="refreshCheckCode('code')" style="width:90px;height: 40px"> <a id="kanbuq" href="javascript:;" onclick="refreshCheckCode('code')">看不清，换一张</a> </div>
      </div> -->
      <!-- 管理员不需要自动登录
	      <div class="row cl">
	        <div class="formControls col-xs-8 col-xs-offset-3">
	          <label for="online">
	            <input type="checkbox" name="online" id="online" value="">
	            使我保持登录状态</label>
	        </div>
	      </div> 
      -->
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
   
</div> 
        
<div class="footer">Copyright © 2019 www.lvmama.com. 上海景域文化传播股份有限公司版权所有 </div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript">
	function validation(){
		var flag = false;//方法返回值
		var name = $("#adminName").val();//输入的账号
		var pass = $("#adminPass").val();//输入的密码
		if(name == "" || pass == ""){
			alert("输入不能为空");
		}else{
			$.ajax({
				url:'login_validat',
				dataType:"json",
				type:"Get",
				data:'adminName='+name+"&adminPass="+pass,
				async:false,//默认为异步请求，设置false为同步
				success: function(res){
					if(res){
						flag = true;
					}else{
						alert("账号密码错误");
					}
				}
			})
		}
		return flag;
	} 
	function refreshCheckCode(id){
		var obj = $('#'+id);
		 //获取当前的时间作为参数，无具体意义     
	    var timenow = new Date().getTime();     
	       //每次请求需要一个不同的参数，否则可能会返回同样的验证码     
	    //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。     
	    obj.attr('src','code?d='+timenow);
	}
</script>
