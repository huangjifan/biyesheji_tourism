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

<title>活动类型列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 活动管理 <span class="c-gray en">&gt;</span>活动列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<!-- <div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入活动名称" id="" name="">
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div> -->
	<div class="cl pd-5 bg-1 bk-gray mt-20"><!--  <a href="javascript:;" onclick="activity_type_add('添加活动类型','activity-type-add','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增活动类型 </a> -->
	</span> <span class="r">共有数据：<strong>${count}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="6">活动列表</th>
			</tr>
			<tr class="text-c">
				<th>活动类型</th>
				<th>优惠金额</th>
				<th>折扣</th>
				<th>满足金额</th>
				<th>最高优惠</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${activity}" var="act" >
	        <tr class="text-c">
	        <td>${act.name}</td>
	            <td>${act.arithmeticid.discountsMoney}</td>
	            <td>${act.arithmeticid.discount}</td>
	           <td>${act.arithmeticid.satisfyMoney}</td>
	           <td>${act.arithmeticid.maxDiscountsMoney}</td>  
	  			<td class="f-14 product-brand-manage"><%-- <a style="text-decoration:none" onClick="activity_type_edit('活动编辑','activity_type_edit?id=${act.id}','${act.id}','800','550')" href="javascript:;" title="编辑"><i class="Hui-iconfont">&#xe6df;</i></a> --%> <a style="text-decoration:none" class="ml-5" onClick="activity_type_del('delActType?id=${act.id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
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
		  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
		  {"orderable":false,"aTargets":[5]}// 制定列不参与排序
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
/*活动类型-增加*/
function activity_type_add(title,url,w,h){
	layer_show(title,url,w,h);
}

/* 活动类型编辑  */
function activity_type_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/* 活动类型删除 */
function activity_type_del(url){
	layer.open({
	    type: 0,
	    title: '信息',   //标题
	    area: ['250px', '150px'],   //宽高
	    shade: 0.4,   //遮罩透明度
	    content: "您确定要删除这条数据吗？", //支持获取DOM元素
	    btn: ['确定', '取消'], //按钮组
	    scrollbar: false ,//屏蔽浏览器滚动条
	    yes: function(index){//layer.msg('yes');    //点击确定回调
	    	$.ajax({
	    		url:url,
				dataType:"json",
				type:"Get",
				async:false,//默认为异步请求，设置false为同步
				success: function(result){
					if(result == true){
						layer.msg('删除成功',{icon:1,time:2000});
						layer.close(index);
						location.reload();
					}else{
						layer.msg('正在活动中，不能删除！！',{icon:2,time:1000});
					}
				}
	    	})
	    },
	    btn2: function(){//layer.alert('aaa',{title:'msg title'});  ////点击取消回调
	        layer.msg('取消删除');//layer.closeAll();
	    }
	});
}
</script>
</body>
</html>