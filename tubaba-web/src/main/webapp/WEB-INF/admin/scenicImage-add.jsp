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
<link rel="stylesheet" type="text/css" href="js/admin/layui-v2.4.5/layui/css/layui.css"  media="all"/>
<!--/meta 作为公共模版分离出去-->

<title>新增文章 - 资讯管理 - H-ui.admin v3.1</title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal  layui-form" method="post" enctype="multipart/form-data"  id="form-addLine" >
		<div class="row cl">
		    <label class="form-label col-xs-4 col-sm-2">选择景点：</label>
		    <div class="formControls col-xs-8 col-sm-9">
		    	<span class="select-box"  id="sic">
		    		<c:forEach items="${sceniclist}" var="itms" varStatus="status"	>
		    			<input type="radio" name='scenicId' value="${itms.id}"  title="${itms.scenicname}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    		</c:forEach>
		    	</span>
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
				    	<input id="uploadPath" name="uploadPath" value="" hidden="hidden">
				    </div>
				 	</blockquote>
				</div>
		    </div>
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<input type="button" class="btn btn-secondary radius" value="提交" onclick="submitAdd()"/>
				<button onClick="removeIframe();" class="btn btn-default radius" type="button">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
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
	 //表单验证
	$("#form-addLine").validate({
		rules:{
			way:{
				required:true,
			},
			scenicday:{
				required:true,
				digits: true,
			},
			description:{
				required:true,
			},
			floor_price:{
				required: true,    //要求输入不能为空
                number: true,     //输入必须是数字
                min: 0.01,  
				minNumber: $("#floor_price").val()
			},
			minimumGroupSize:{
				required: true,
				digits: true,
			},
			startpath:{
				required:true,
			},
			endpath:{
				required:true,
				digits:true,
			},
			titleSelect:{
				required:true,
			},
			attractions:{
				required:true,
			},
			introduce:{
				required:true,

			}
			
		},
	});	
	var ue = UE.getEditor('editor');
	
	 layui.use('form', function(){
		 var form = layui.form;
		 /* 实现主题下拉菜单s */
			$.ajax({
				url:'queryTitleAll',
				dataType:'json',
				type:'post',
				success:function(data){
				
				    $.each(data,function(index,item){
				        $('#titleSelect').append(new Option(item.type,item.id));//往下拉菜单里添加元素
				    })
				
				    form.render();//菜单渲染 把内容加载进去
				}
			});
			/* 获取主题类型的值  */
			 $('#titleSelect').change(function(){
				 var a = $('#titleSelect').val();
				 
			 })
			 /* 实现景点类型下拉菜单 */
			 $.ajax({
				url:'queryAttractions',
				dataType:'json',
				type:'post',
				success:function(data){
				    $.each(data,function(index,item){
				        $('#attractions').append(new Option(item.atrtitle,item.atid));//往下拉菜单里添加元素
				    })
				    form.render();//菜单渲染 把内容加载进去
				}
			 }); 
			/* 实现城市下拉菜单 */
			$.ajax({
				url:'queryCityAlll',
				dataType:'json',
				type:'post',
				success:function(data){
				    $.each(data,function(index,item){
				        $('#startpath').append(new Option(item.area,item.id));//往下拉菜单里添加元素
				        $('#endpath').append(new Option(item.area,item.id));//往下拉菜单里添加元素
				    })
				    form.render();//菜单渲染 把内容加载进去
				}
			}); 
			/* 用于实现选择路线城市跳出对应的景点    */
			form.on('select(endpath)', function (data){
				//获取城市的文本值
				 var city = $('#endpath option:selected').text();
				 $.getJSON("queryScenicByCity?city="+city, function(data){
					 var optionstring = "";
		             $.each(data, function(i,item){
		            		 optionstring += "<input type='checkbox' name='scenicId' value=\"" + item.id + "\" title=" + item.scenicname + ">";
		             });
		             $("#sic").html(optionstring);
		             form.render();//菜单渲染 把内容加载进去
		         });
			})
			
	 });
	 ue.ready(function() {

		    //设置编辑器的内容

		    //ue.setContent('hello');

		    //获取html内容，返回: <p>hello</p>

		    var html = ue.getContent();
			
		    console.log(html);
		    //获取纯文本内容，返回: hello

		    var txt = ue.getContentTxt();
		    console.log(txt);

		});
});
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
	var imgSrc = $('img.layui-upload-img[name="abc"]');
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
	    	$('#demo1').show();
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
/**
 * 验证提交后
 */
function form_addLine(){
	if($("#form-addLine").valid()){
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

function submitAdd(){
	$.ajax({
		url:"scenicImageAdd",
		type:"post",
		data:{
			uploadPath:$("#uploadPath").val(),
			scenicId:$('input[name="scenicId"]:checked').val(),
		},success:function(result){
			if(result==true){
				alert("增加成功");
				var index = parent.layer.getFrameIndex(window.name);
				parent.$("#handle").attr("value",1);
				parent.layer.close(index);
			}else{
				alert("增加失败");
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