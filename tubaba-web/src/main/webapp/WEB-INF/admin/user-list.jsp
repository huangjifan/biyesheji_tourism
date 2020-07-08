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
<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理<span class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="pd-20">
  <!-- <div class="text-c"> 日期范围：
    <input type="text" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
    <input type="text" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
    <input type="text" class="input-text" style="width:250px" placeholder="输入用户名称、电话、邮箱" id="nameorphoneoremail" name="">
    <button type="button" onclick="queryThefuzzy()" class="btn btn-success" id="querybutton" name=""><i class="icon-search"></i> 搜用户</button>
  </div> -->
  <div class="cl pd-5 bg-1 bk-gray mt-20">
   <!--  <a href="javascript:;" onclick="user_add('添加用户','user-add','900','650')" class="btn btn-primary radius"><i class="icon-plus"></i> 添加用户</a> --></span>
    <span class="r">共有数据：<strong>${count}</strong> 条</span>
  </div>
  <table class="table table-border table-bordered table-hover table-bg table-sort">
    <thead>
     <tr class="text-c">
				
				<th>用户名</th>
				<th>昵称</th>
				<th>邮箱</th>
				<th>电话</th>
				<th>出生日期</th>
				<th>状态</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody id="dorpdown-city">
		<c:forEach items="${userlist}" var="user" >
		<c:if test="${user.type!=1 }">
	        <tr class="text-c">

	            <td>${user.username}</td>
	            <td>${user.realname}</td>
	            <td>${user.email}</td>
	            <td>${user.iphone}</td>  
	           <td> <fmt:formatDate pattern="yyyy-MM-dd"  value="${user.birthday}"/></td>  
				<td class="td-status">
				<c:if test="${user.type==2 }">
					<span class="label label-default radius">已禁用</span>
				</c:if>
				<c:if test="${user.type==0 }">
					<span class="label label-success radius">已启用</span>
				</c:if>
				</td>
				<td class="td-manage">
				<c:if test="${user.type==2 }">
				<a style="text-decoration:none" onClick="user_start(this,${user.id})" href="javascript:;" title="启用">
				<i class="Hui-iconfont">&#xe615;</i></a>
				</c:if>	
				<c:if test="${user.type==0 }">
				<a onClick="user_stop(this,${user.id})" href="javascript:;" title="停用" style="text-decoration:none">
				<i class="Hui-iconfont">&#xe615;</i></a> 
				</c:if>

				<a title="编辑" href="javascript:;" onclick="user_edit('用户编辑','user-password-edit?id=${user.id}','${user.id}','800','500')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="user_del(this,${user.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>

				<%-- <a title="编辑" href="javascript:;" onclick="user_edit('用户编辑','user-edit?userId=${user.id}','${user.id}','800','650')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> --%> 
<%-- 				<a title="删除" href="javascript:;" onclick="user_del(this,${user.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
 --%>			</tr>
		</c:if>
		</c:forEach>
    </tbody>
  </table>
  <div id="pageNav" class="pageNav"></div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

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
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[6]}// 制定列不参与排序
		]
	});
	
});

/*模糊查询*/
 function queryThefuzzy(){
	 $("#dorpdown-city").empty();
	var nameorphoneoremail=$("#nameorphoneoremail").val();
	var strattime=$("#datemin").val();
	var endtime=$("#datemax").val();
	console.log(nameorphoneoremail);
	console.log(strattime);
	console.log(endtime);
	$.ajax({
		url:"queryUserCondition",
		type:"post",
		data:{
			nameorphoneoremail:nameorphoneoremail,
			strattime:strattime,
			endtime:endtime,
		},success:function(data){
			$("#dorpdown-city").empty();
			var str="";
			for(var i=0;i<data.length;i++){
				if(data[i].type!=1){
					str+="<tr class='text-c'>"
						+"<td><input type='checkbox' value='2' name='user'></td>"
						+"<td>"+data[i].id+"</td>"
						+"<td>"+data[i].username+"</td>"
						+"<td>"+data[i].realname+"</td>"
						+"<td>"+data[i].email+"</td>"
						+"<td>"+data[i].iphone+"</td>"
						+"<td>"+data[i].birthday+"</td>"
						+"<td class='td-status'>";
					if(data[i].type==2){
						str+="<span class='label label-default radius'>已禁用</span>";
					}
					if(data[i].type==0){
						str+="<span class='label label-success radius'>已启用</span>";
					}
						str+="</td>"
							+"<td class='td-manage'>";
					if(data[i].type==2){
						str+="<a style='text-decoration:none' onClick='user_start(this,"+data[i].id+")' href='javascript:;' title='启用'>"
							+"<i class='Hui-iconfont'>&#xe615;</i></a>";
					}
					if(data[i].type==0){
						str+="<a onClick='user_stop(this,"+data[i].id+")' href='javascript:;' title='停用' style='text-decoration:none'>"
						+"<i class='Hui-iconfont'>&#xe615;</i></a>";	
					}
					str+="</tr>";
				}
			} 
			$("#dorpdown-city").append(str);
			
		}
	})
}

/* 用户-添加 */
function user_add(title,url,w,h){
	layer_show(title,url,w,h);
}

/*用户-编辑*/
function user_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*用户-停用*/
function user_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="user_start(this,'+id+')" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents(" tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
		$.ajax({
			type: 'post',
			url: 'userUpdate',
			data:{
				'userId':id
			},
			success: function(result){
				if(result==true){
					layer.msg('已停用!',{icon: 5,time:1000});
					location.reload(); 
				}
			}
		});
		
	});
}

/*用户-启用*/
function user_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="user_stop(this,'+id+')" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents(" tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		$.ajax({
			type: 'post',
			url: 'userUpdate',
			data:{
				'userId':id
			},
			success: function(result){
				if(result==true){
					layer.msg('已启用!', {icon: 6,time:1000});
					location.reload(); 
				}
			}
		});
		
	});
}

function user_del(index,id){
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'post',
			url: 'deletuser',
			data:{
				'userId':id
			},
			success: function(result){
				if(result==true){
					layer.msg('已删除',{icon:1,time:1000});
					location.reload();
				}
			}
		});
	});
}
</script>

</body>
</html>