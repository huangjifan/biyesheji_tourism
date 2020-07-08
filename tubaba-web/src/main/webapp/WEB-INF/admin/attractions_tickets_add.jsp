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

<title></title>
<meta name="keywords" content="H-ui.admin v3.1,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v3.1，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<body>
<article class="page-container">
	<form class="form form-horizontal" method="post" enctype="multipart/form-data" action="attractions_add"  id="form-article-add" onsubmit="return article_add()">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>景点名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value=""  id="scenicname" name="scenicname">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>景点城市：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
				<!-- 省市联动-->
			        <select name="province" id="province" lay-filter="province" style="width: 120px">
			            <option value="">请选择</option>
			        </select>
			        <select name="city" id="city"  style="width: 120px">
			            <option value="">请选择</option>
			        </select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>主题分类：</label>
			<div class="formControls col-xs-8 col-sm-9"> <span class="select-box">
				<!-- 主题分类 -->
				<select id="titleSelect" name="titleSelect" class="select">
					<option value="">请选择主题类型</option>
				</select>
				</span> </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>景点地址：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value=""  id="address" name="address">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>景点标题：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value=""  id="headline" name="headline">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>底价：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value=""  id="floor_price" name="floor_price">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>成人价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value=""  id="adultprice" name="adultprice">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span> 儿童价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value=""  id="childprice" name="childprice">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">上架时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',maxDate:'#F{$dp.$D(\'commentdatemax\')||\'%y-%M-%d\'}' })" id="commentdatemin" name="commentdatemin" class="input-text Wdate">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">维护时间：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" onfocus="WdatePicker({ dateFmt:'yyyy-MM-dd HH:mm:ss',minDate:'#F{$dp.$D(\'commentdatemin\')}' })" id="commentdatemax" name="commentdatemax" class="input-text Wdate">
			</div>
		</div>
		<div class="row cl">
			 <label class="form-label col-xs-4 col-sm-2">封面图片上传：</label>
			<div class="layui-row layui-col-space1 col-xs-8 col-sm-9">
			    <div class="layui-col-md6">
			    	<input type="file"  id="cover" name="cover" onchange="coverFile(this)" class="layui-btn layui-btn-sm" id="upLoadImge" style="width: 188px;" /><br>
			    	<img src="" id="cover" style="display:none" height="200" alt="Image preview...">
			    </div>
		    </div>
		</div>
		<div class="row cl">
			 <label class="form-label col-xs-4 col-sm-2">景点图片上传：</label>
			<div class="layui-row layui-col-space1 col-xs-8 col-sm-9">
			    <div class="layui-col-md6">
			    	<input type="file"   name="file" onchange="previewFile(this)" class="layui-btn layui-btn-sm" id="upLoadImge" style="width: 188px;" /><br>
			    	<img src="" style="display:none" height="200" alt="Image preview..."><a src="javascript:void()" style="display:none;" onclick="imgRemove(this)">删除</a>
			    </div>
		    </div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">景点介绍：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<script id="TICKETS_editorr" name="introduce" type="text/plain" style="width:100%;height:400px;"></script> 
			</div>
			<!-- <div class="formControls col-xs-8 col-sm-9">
				<textarea id="introduce" name="introduce" cols="" rows="" class="textarea"  placeholder="说点什么...最少输入10个字符" datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" ></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/<am>500</am></p>
			</div> -->
		</div>
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<input type="submit" class="btn btn-secondary radius" />
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
	$("#form-article-add").validate({
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
			address:{
				required:true,
			},
			headline:{
				required:true,
			},
			floor_price:{
				required:true,
				digits:true,
			},
			adultprice:{
				required:true,
				digits:true,
				checkadult:true,
			},
			childprice:{
				required:true,
				digits:true,
				checkchild:true,
			},
			introduce:{
				required:true,
				minlength:10,
				maxlength:500,
			},
			articletitle4:{
				required:true,
			},
			sources:{
				required:true,
			},
			file:{
				checkPic:true,
			},
			coverImage:{
				checkcover:true,
			}
			
		},
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
	 
	 var ue = UE.getEditor('TICKETS_editorr');
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

/**
 * 验证提交后
 */
function article_add(){
	if($("#form-article-add").valid()){
		return true;

	};
	return false;
}

</script>

<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>