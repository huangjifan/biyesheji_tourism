<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<title>活动地址管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 活动管理 <span class="c-gray en">&gt;</span> 活动地址管理 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<!-- <div class="text-c">
		<form class="Huiform" method="post" target="_self">
			<input type="text" class="input-text" style="width:250px" placeholder="活动分类名称" id="advername" name="advername">
			<button type="button" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜活动地址分类节点</button>
		</form>
	</div> -->
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"> <a href="javascript:;" onclick="admin_permission_add('添加活动分类','activity-address-add','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加活动地址分类节点</a></span> <span class="r">共有数据：<strong>${count}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="2">活动地址分类节点</th>
			</tr>
			<tr class="text-c">
				<th>活动地址分类</th>
				<th width="200">操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${actlist}" var="a">
			<c:if test="${a.state!=1}">
				<tr class="text-c">
					<td>${a.name}</td>
					<td><a title="编辑" href="javascript:;" onclick="admin_attr_edit('编辑','activity-address-edit?id=${a.id}',${a.id },'','310')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6df;</i></a> <a title="删除" href="javascript:;" onclick="admin_permission_del(this,${a.id})" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript">
$(function(){
	$('.table-bg').dataTable({
		"aaSorting": [[ 0, "desc" ]],//默认第几个排序
		"bStateSave": false,//状态保存
		"aLengthMenu":[5,10,15,20],
		"aoColumnDefs": [
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[1]}// 制定列不参与排序
		]
	});

});
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-权限-添加*/
function admin_permission_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-权限-编辑*/
function admin_attr_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}

/*管理员-权限-删除*/
function admin_permission_del(obj,id){
	alert(id)
	var fool=false;
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'post',
			url: 'delType?id='+id,
			async:false,
			success: function(result){
				fool=result;
				if(result==false){
					layer.msg('此分类正在活动中，不能删除！！',{icon:2,time:1000});
				}else{
					
				}
				/* $(obj).parents("tr").remove(); */
				/* layer.msg('已删除!',{icon:1,time:1000}); */
			}
		});
		if(fool==true){
			$.ajax({
				type: 'post',
				url: 'delact?id='+id,
				async:false,
				success: function(result){
					if(result==true){
						layer.msg('已删除!',{icon:1,time:1000});
						location.reload();
					}
					/* $(obj).parents("tr").remove(); */
					/* layer.msg('已删除!',{icon:1,time:1000}); */
				}
			});
		}
	});
}

function datadel(){
	console.log(123123);
}

</script>
</body>
</html>