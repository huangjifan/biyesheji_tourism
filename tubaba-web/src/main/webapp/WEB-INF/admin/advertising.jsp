<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />

<link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="page-container">
	<form action="" method="post" class="form form-horizontal" id="form-article-add">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">排序值：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" id="index" name="index">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">所属分类1：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<c:forEach items="${adverlist }" var="adver">
					<input type="radio" name="adver" id="adver" value="${adver.id }"/>${adver.name}
				</c:forEach>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">路线+景点：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<c:forEach items="${holist }" var="hol">
					<input type="radio" name="hol" id="hol" value="${hol.id }"/>${hol.scenic.scenicname}+${hol.hotel.name}
				</c:forEach>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">路线：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<c:forEach items="${scewaylist }" var="way">
					<input type="radio" name="way" id="way" value="${way.id }"/>${way.way}
				</c:forEach>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">景点：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<c:forEach items="${scenlist }" var="sce">
					<input type="radio" name="sce" id="sce" value="${sce.id }"/>${sce.scenicname}
				</c:forEach>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">广告开始时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:180px;">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">广告结束时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'datemin\')}' })" id="datemax" class="input-text Wdate" style="width:180px;">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">图片上传：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-list-container">
					<div class="queueList">
						<div id="dndArea" class="placeholder">
							<div id="filePicker-2">
								<img style="width: 400px;height: 400px;" id="img">
							</div>
						</div>
					</div>
					
					<div class="statusBar" style="display:block;">
						<input type="file" id="ilePicker"  name="file" id="images"/>
					<!--<div class="progress"> <span class="text">0%</span> <span class="percentage"></span> </div>
						<div class="info"></div> -->
						<div class="btns">
							<div id="filePicker2"></div>
							<div class="uploadBtn" onclick="file()">开始上传</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row cl">
			<div class="formControls col-xs-8 col-sm-9" style="margin-left: 272px;">
				<div class="uploader-list-container" style="border:0px solid white;">
					<div class="statusBar" style="display:block;">
						<div class="btns">
							<div id="filePicker2"></div>
							<div class="uploadBtn" onclick="sub()">提交</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

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
var images=null;
function file(){
	var form_data=new FormData();
	form_data.append("file",$("input[name='file']").prop('files')[0]);
	console.log($("input[name='file']").prop('files')[0]);
	if($("input[name='file']").prop('files')[0]==null||$("input[name='file']").prop('files')[0]==""){
		alert("请选择图片");
	}else{
		$.ajax({
			type: 'post',
			url:"uploadImg",
			async: false,  
		    cache: false,  
		    contentType: false,  
		    processData: false,
			data:form_data,
			success: function(result){
				$("#images").attr("src","/upload/"+result.imageName);
				$("input[name='file']").remove();
				var img=document.getElementById("img");
				img.src="/upload/"+result.imageName;
				images="/upload/"+result.imageName;
			}
		});
	}
	
}
function sub(){
	var index=$("#index").val();
	var adver=$("input[name='adver']:checked").val();
	var hol=$("input[name='hol']:checked").val();
	var way=$("input[name='way']:checked").val();
	var sce=$("input[name='sce']:checked").val();
	var strattime=$("#datemin").val();
	var endtime=$("#datemax").val();
	 var d1 = new Date(strattime.replace(/\-/g, "\/"));  
	 var d2 = new Date(endtime.replace(/\-/g, "\/"));  
	if(index=="" || index==null){
		alert("请输入排序值");
	}else if(strattime==""||strattime==null){
		alert("请输入开始时间");
	}else if(endtime==""||endtime==null){
		alert("请输入结束时间");
	}else if(d1>d2){
		alert("开始时间不能大于结束时间");
	}else if(images==null||images==""){
		alert("请选择图片");
	}else{
		 $.ajax({
			url:"advertisingAdd",
			type:"post",
			data:{
				index:index,
				adver:adver,
				strattime:strattime,
				endtime:endtime,
				img:images,
				hol:hol,
				way:way,
				sce:sce
			},success:function(result){
				if(result==true){
					layer.msg('增加成功!',{icon:1,time:1000});
					window.parent.location.reload();
				}
			}
		}) 
	}
}
</script>

</body>
</html>