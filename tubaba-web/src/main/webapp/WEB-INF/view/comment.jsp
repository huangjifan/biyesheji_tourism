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
<link rel="stylesheet" type="text/css" href="js/admin/layui-v2.4.5/layui/css/layui.css"  media="all"/>
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--/meta 作为公共模版分离出去-->

<title></title>
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" method="post" enctype="multipart/form-data"  >
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">评论 图片上传：</label>
			<div class="layui-row layui-col-space1 col-xs-8 col-sm-9">
				<div class="layui-upload">
				  	<button type="button" class="layui-btn" id="test2">多图片上传</button> 
				  	<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
				    		预览图：
				    <div class="layui-upload-list" id="demo2">
				    	<input id="uploadPath" name="uploadPath" value="" hidden="hidden">
				    	<input id="intdentId" name="intdentId" value="${intdentId }" type="hidden">
				    </div>
				 	</blockquote>
				</div>
		    </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">评论内容：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<textarea rows="10px" cols="75px" id="content" name="content"></textarea>
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<input type="button" class="btn btn-secondary radius"  value="提交" onclick="sub()"/>
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
<script type="text/javascript" src="lib/webuploader/0.1.5/webuploader.min.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.config.js"></script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/ueditor.all.min.js"> </script> 
<script type="text/javascript" src="lib/ueditor/1.4.3/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">

/**
 * 验证提交后
 */
function validat(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.$("#handle").attr("value",1);
	parent.layer.close(index);
	return true;
}
function cancelBack() {
	var index = parent.layer.getFrameIndex(window.name);
	parent.$("#handle").attr("value",2);
	parent.layer.close(index);
}
var imgSrc="";
layui.use(['upload'], function(){
	upload = layui.upload;
	/*
	*多文件上传
	*/
	 upload.render({
		    elem: '#test2'
		    ,url: 'upload' 
		    ,acceptMime: 'image/*'
		    ,multiple: true
		    ,before: function(obj){
		      //预读本地文件示例，不支持ie8
		      obj.preview(function(index, file, result){
		        $('#demo2').append('<img  width="310px" height="220px" src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img" >')
		      });
		    }
		    ,done: function(res){
		    	for(var c in res){
		    		imgSrc += res[c]+",";	
		    	}
		    	var up = $("#uploadPath").val(imgSrc);
		    	console.log(up.val());
		      //上传完毕
		    }
		    
		  });
	 
	//单文件上传
	var uploadInst = upload.render({
	    elem: '#test10'
	    ,url: 'upload'
	    ,acceptMime: 'image/*'
	    ,size:3000
	    ,before: function(obj){
	      //预读本地文件示例，不支持ie8
	      obj.preview(function(index, file, result){
	    	$('#demo1').attr('src', result); //图片链接（base64）
	        //$('#demo1').append('<img src="'+ result +'" alt="'+ file.name +'" class="layui-upload-img">')//图片链接（base64）
	      });
	    }
	    ,done: function(res,index,upload){
	      //如果上传失败
	      if(res.code > 0){
	        return layer.msg('上传失败');
	      }
	      $("#coverImage").val(res);
	      //上传成功
	      //alert(res+".."+index+".."+upload);
	    }
	    ,error: function(){
	      //演示失败状态，并实现重传
	      var demoText = $('#demoText');
	      demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
	      demoText.find('.demo-reload').on('click', function(){
	        uploadInst.upload();
	        
	      });
	    }
	 });
})
function sub(){
	 $.ajax({
		url:"commentAdd",
		type:"post",
		data:{
			uploadPath:$("#uploadPath").val(),
			intdentId:$("#intdentId").val(),
			content:$("#content").val()
		},success:function(result){
			if(result==true){
				var index = parent.layer.getFrameIndex(window.name);
				parent.$("#handle").attr("value",1);
				parent.layer.close(index);
				window.location.reload();
			}else{
				alert("评论失败");
				var index = parent.layer.getFrameIndex(window.name);
				parent.$("#handle").attr("value",1);
				parent.layer.close(index);
			}
		}
	}) 
}
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>