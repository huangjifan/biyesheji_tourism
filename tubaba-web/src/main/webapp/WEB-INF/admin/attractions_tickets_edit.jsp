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

<title>新增文章 - 资讯管理 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" id="attractions_edit" method="post" enctype="multipart/form-data" action="attractions_edit"  onsubmit="return validat()" >
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>景点名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${scenic.scenicname}"  id="scenicname" name="scenicname">
				<input id="id" name="id" value="${scenic.id}" hidden="hidden">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>景点城市：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
				<!-- 省市联动-->
			        <select name="province" id="province" lay-filter="province" style="width: 120px">
			            <option value="${scenic.province}">${scenic.province}</option>
			        </select>
			        <select name="city" id="city"  style="width: 120px">
			            <option value="${scenic.city}">${scenic.city}</option>
			        </select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>主题分类：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<!-- 主题分类 -->
				<select id="titleSelect" name="titleSelect" class="select">
					<option value="${scenic.title.id}">${scenic.title.type}</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>景点地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${scenic.address}"  id="address" name="address">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>景点标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${scenic.headline}"  id="headline" name="headline">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>底价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="${scenic.floor_price}"  id="floor_price" name="floor_price">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>成人价格：</label>
			<c:forEach items="${ticketsList}" var="itms">
			<div class="formControls col-xs-8 col-sm-9">
			<c:if test="${itms.type=='adultprice'}">
				<input type="text" class="input-text" value="${itms.price}"  id="adultprice" name="adultprice">
			</c:if>
			</div>
			</c:forEach>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 儿童价格：</label>
			<c:forEach items="${ticketsList}" var="itms">
			<div class="formControls col-xs-8 col-sm-9">
			<c:if test="${itms.type=='childprice'}">
				<input type="text" class="input-text" value="${itms.price}"  id="childprice" name="childprice">
			</c:if>
			</div>
			</c:forEach>
		</div>
		<div class="row cl">
			 <label class="form-label col-xs-4 col-sm-2">封面图片上传：</label>
			 <div class="layui-upload-drag"  id="test10">
				  <i class="layui-icon"></i>
				  <img width="310px" height="220px" src="${scenic.coverImage}" class="" id="demo1"/>
				  <p>点击上传商品封面</p>
				  <input id="coverImage"  name="coverImage" hidden="hidden">
			 </div>
		</div>
		<div class="row cl">
			 <label class="form-label col-xs-4 col-sm-2">景点图片上传：</label>
			<div class="layui-row layui-col-space1 col-xs-8 col-sm-9">
				<div class="layui-upload">
				  	<button type="button" class="layui-btn" id="test2">多图片上传</button> 
				  	<blockquote class="layui-elem-quote layui-quote-nm" style="margin-top: 10px;">
				    		预览图：
				    <div class="layui-upload-list" id="demo2">
				    	<c:forEach items="${imgList}" var="itms">
				    		<img width="310px" height="220px" src="${itms.path}" class="layui-upload-img " id="demo1"/>
				    		<a src="javascript:void()" onclick="imgRemove(this)">删除</a>
				    	</c:forEach>
				    	<input id="uploadPath" name="uploadPath" value="" hidden="hidden">
				    </div>
				 	</blockquote>
				</div>
		    </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">景点介绍：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<script id="TICKETS_editor" value="" name="introduce" type="text/plain" style="width:100%;height:400px;">${scenic.introduce}</script> 
			</div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<input type="submit" class="btn btn-secondary radius" />
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
$(function(){
	
	$("#attractions_edit").validate({
		rules:{
			scenicname:{
				required:true,
			},
			province:{
				required:true,
			},
			city:{
				required:true,
			},
			titleSelect:{
				required:true,
			},
			headline:{
				required:true,
			},
			floor_price:{
				  required: true,    //要求输入不能为空
                  number: true,     //输入必须是数字
                  min: 0.01,  
				  minNumber: $("#floor_price").val()
			},
			adultprice:{
				 required: true,    //要求输入不能为空
                 number: true,     //输入必须是数字
                 min: 0.01,  
				 minNumber: $("#adultprice").val()
			},
			childprice:{
				 required: true,    //要求输入不能为空
                 number: true,     //输入必须是数字
                 min: 0.01,  
				 minNumber: $("#childprice").val()
			},
			introduce:{
				required:true,
				minlength:10,
				maxlength:500,
			},
			
			//错误提示信息
            messages: {
            	floor_price: {
                    required: "请填写金额",
                    number: "请正确输入金额",
                    min: "请正确输入金额",
                    length: "请正确输入金额"
                },
                adultprice: {
                    required: "请填写金额",
                    number: "请正确输入金额",
                    min: "请正确输入金额",
                    length: "请正确输入金额"
                }
                ,childprice: {
                    required: "请填写金额",
                    number: "请正确输入金额",
                    min: "请正确输入金额",
                    length: "请正确输入金额"
                }
            }
		},
	});	
	
	 var ue = UE.getEditor('TICKETS_editor');
	 ue.ready(function() {

		    //设置编辑器的内容

		    //ue.setContent('hello');
		    //获取html内容，返回: <p>hello</p>

		    var html = ue.getContent();
			
		    console.log(html);


		});	
	
	/* 实现主题下拉菜单s */
	$.ajax({
		url:'queryTitleAll',
		dataType:'json',
		type:'post',
		success:function(data){
		
		    $.each(data,function(index,item){
		        $('#titleSelect').append(new Option(item.type,item.id));//往下拉菜单里添加元素
		    })
		
		  //  form.render();//菜单渲染 把内容加载进去
		}
	});
	/* 获取主题类型的值  */
	 $('#titleSelect').change(function(){
		 var a = $('#titleSelect').val();
		 console.log (a) ;
	 })
	 /* 实现省份下拉菜单  */
	 $.ajax({
			url:'queryProvinceAll',
			dataType:'json',
			type:'post',
			success:function(data){
				//遍历传过来的数组
			    $.each(data,function(index,item){
			    	//判断是否为父节点（省份）
			    		$('#province').append(new Option(item.area,item.id));//往下拉菜单里添加元素
			    })
				
			}
	 });
	 /* 获取省份下拉框的值 */
	 $('#province').change(function(data){
		 //获取省份的id
		 var id = $('#province').val();
		 //实现城市下拉菜单
		 $.getJSON("queryCitiAll?upid="+id, function(data){
             var optionstring = "";
             $.each(data, function(i,item){
            		 optionstring += "<option value=\"" + item.id + "\" >" + item.area + "</option>";
             });
             $("#city").html(optionstring);
         });
	 })
});
/**
 * 验证提交后
 */
function validat(){
	if($("#attractions_edit").valid()){
		var index = parent.layer.getFrameIndex(window.name);
		parent.$("#handle").attr("value",1);
		parent.layer.close(index);
		return true;

	};
		
		return false;
}
function cancelBack() {
	var index = parent.layer.getFrameIndex(window.name);
	parent.$("#handle").attr("value",2);
	parent.layer.close(index);
}
function imgRemove(obj){
	for(var i=0;i<List.length;i++){
		if(List[i] == $(obj).prev().attr('src')){
			List.splice(i,1)
		}
	}
	$(obj).prev().remove();
	$(obj).remove();
	$("#uploadPath").val(List.join(','));
	console.log('%%%%%%%%%%%%%%%%%%%%'+List);
}
$(function(){
	var imgSrc = $('img.layui-upload-img');
	for(var i=0;i<imgSrc.length;i++){
		List.push($(imgSrc[i]).attr('src'));
	}
	$("#uploadPath").val(List.join(','));
	console.log('---------------------'+List);
})
var List = new Array();
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
		        
		      });
		    }
		    ,done: function(res){
		    	for(var c in res){	
		    		List.push(res[c]);
		    		$('#demo2').append('<img  width="310px" height="220px" src="'+ res[c] +'" class="layui-upload-img" ><a src="javascript:void()" onclick="imgRemove(this)">删除</a>')
		    	}
		    	console.log('%%%%%%%%%%%%%%%%%%%%'+List);
		    	$("#uploadPath").val(List.join(','));
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
//自定义validate验证输入的数字小数点位数不能大于两位
jQuery.validator.addMethod("minNumber",function(value, element){
    var returnVal = true;
    inputZ=value;
    var ArrMen= inputZ.split(".");    //截取字符串
    if(ArrMen.length==2){
        if(ArrMen[1].length>2){    //判断小数点后面的字符串长度
            returnVal = false;
            return false;
        }
    }
    return returnVal;
},"小数点后最多为两位");  
jQuery.validator.addMethod("checkadult", function(value, element) {
   var floor_price = $("#floor_price").val();
   var adultprice = $("#adultprice").val();
   var childprice = $("#childprice").val();
   if(adultprice<=floor_price || adultprice<childprice){
	   return false;
   }else{
	   return true;
   }
}, "输入的价格有误，成人价格不能低于等于底价或 儿童价格");
jQuery.validator.addMethod("checkchild", function(value, element) {
	   var floor_price = $("#floor_price").val();
	   var adultprice = $("#adultprice").val();
	   var childprice = $("#childprice").val();
	   if(childprice<=floor_price || adultprice<=childprice){
		   return false;
	   }else{
		   return true;
	   }
	}, "输入的价格有误，儿童价格不能低于等于底价或者高于等于成人价格");
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>