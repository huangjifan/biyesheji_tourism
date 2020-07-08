<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>管理员列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 管理员管理 <span class="c-gray en">&gt;</span> 管理员列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<!-- <div class="text-c"> 日期范围：

		<input type="text" class="input-text" style="width:250px" placeholder="输入用户名称" id="adminusername" name="adminusername">
		<button type="button" onclick="queryUsername()" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div> -->
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a href="javascript:;" onclick="admin_add('添加管理员','admin-add','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员 </a></span> <span class="r">共有数据：<strong>${count}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="8">管理员列表</th>
			</tr>
			<tr class="text-c">
				<th>用户名</th>
				<th>邮箱</th>
				<th>电话</th>
				<th>性别</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="dorpdown-city">
		<c:forEach items="${adminlist}" var="admin" >
		<c:if test="${admin.admName!='admin'}">		
	        <tr class="text-c">
	            <td>${admin.admName}</td>
	            <td>${admin.admEmail}</td>
	            <td>${admin.admPhone}</td>  
	            <td>${admin.admSex}</td>
	            <c:if test="${admin.admState == 0}">
					<td class="td-status"><span class="label label-success radius">已启用</span></td>
					<td class="td-manage"><a onClick="admin_stop(this,${admin.admId})" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a> <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin-edit?admId=${admin.admId}','${admin.admId}','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> </td>				
				</c:if>				
				<c:if test="${admin.admState == 1}">
					<td class="td-status"><span class="label radius">已禁用</span></td>
					<td class="td-manage"><a style="text-decoration:none" onClick="admin_start(this,${admin.admId})" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a> <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin-edit?admId=${admin.admId}'','${admin.admId}','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> </td>
				</c:if>
			</tr>
			</c:if>
		</c:forEach>
		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$(function(){
	$('.table-bg').dataTable({
		"aaSorting": [[ 1, "desc" ]],//默认第几个排序
		"bStateSave": false,//状态保存
		"aLengthMenu":[5,10,15,20],
		"aoColumnDefs": [
		  {"orderable":false,"aTargets":[5]}// 制定列不参与排序
		]
	});

});
/**
 * 模糊查询用户名
 */
 function queryUsername(){
	var adminusername=$("#adminusername").val();
	$.ajax({
		url:"queryUsername",
		type:"post",
		data:{
			adminusername:adminusername
		},
		success:function(data){
			$("#dorpdown-city").empty();
			var str="";
			for(var i=0;i<data.length;i++){
				str+="<tr class='text-c'>"			
					+"<td>"+data[i].admName+"</td>"
					+"<td>"+data[i].admEmail+"</td>"
					+"<td>"+data[i].admPhone+"</td>"
					+"<td>"+data[i].admSex+"</td>";
					if(data[i].admState == 0){
						str+="<td class='td-status'><span class='label label-success radius'>已启用</span></td>"
							+"<td class='td-manage'>"
							+"<a onClick='admin_stop(this,"+data[i].admId+")' href='javascript:;' title='停用' style='text-decoration:none'>"
							+"<i class='Hui-iconfont'>&#xe631;</i></a>"
							+"<a title='编辑' href='javascript:;' onclick='admin_edit('管理员编辑','admin-edit?admId="+data[i].admId+"','"+data[i].admId+"','800','500')' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6df;</i></a></td>";
					}
					if(data[i].admState==1){
						str+="<td class='td-status'><span class='label radius'>已禁用</span></td>"
							+"<td class='td-manage'>"
							+"<a style='text-decoration:none' onClick='admin_start(this,"+data[i].admId+")' href='javascript:;' title='启用'><i class='Hui-iconfont'>&#xe615;</i></a>"
							+"<a title='编辑' href='javascript:;' onclick='admin_edit('管理员编辑','admin-edit','"+data[i].admId+"','800','500')' class='ml-5' style='text-decoration:none'><i class='Hui-iconfont'>&#xe6df;</i></a></td>";
						
					}
					str+="</tr>";
					
			}
			$("#dorpdown-city").append(str);
			/* <tr class="text-c">
        	<td><input type="checkbox" value="2" name=""></td>
            <td>${admin.admId}</td>
            <td>${admin.admName}</td>
            <td>${admin.admPass}</td>
            <td>${admin.admEmail}</td>
            <td>${admin.admPhone}</td>  
            <td>${admin.admSex}</td>
            <c:if test="${admin.admState == 0}">
				<td class="td-status"><span class="label label-success radius">已启用</span></td>
				<td class="td-manage"><a onClick="admin_stop(this,${admin.admId})" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a> <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin-edit?admId=${admin.admId}','${admin.admId}','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> </td>				
			</c:if>				
			<c:if test="${admin.admState == 1}">
				<td class="td-status"><span class="label radius">已禁用</span></td>
				<td class="td-manage"><a style="text-decoration:none" onClick="admin_start(this,${admin.admId})" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe615;</i></a> <a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin-edit','${admin.admId}','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> </td>
			</c:if>
		</tr> */
		}
	})
}

/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-停用*/
function admin_stop(obj,id){	
	layer.confirm('确认要停用吗？',function(index){			
		$.ajax({
			url:'updateState',
			dataType:"json",
			type:"Get",
			data:'admId='+id,
			async:false,//默认为异步请求，设置false为同步
			success: function(res){
				if(res){
					$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,${admin.admId})" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
					$(obj).remove();
					layer.msg('已停用!',{icon: 5,time:1000});
					location.reload();
				}
			}
		})
		
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$.ajax({
			url:'updateState',
			dataType:"json",
			type:"Get",
			data:'admId='+id,
			async:false,//默认为异步请求，设置false为同步
			success: function(res){
				if(res){
					$(obj).parents("tr").find(".td-manage").prepend('<a onClick="(this,${admin.admId})" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
					$(obj).remove();
					layer.msg('已启用!', {icon: 6,time:1000});
					location.reload();
				}
			}
		})
			
	});
}
</script>
</body>
</html>