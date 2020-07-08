<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" 
	href="js/admin/layui-v2.4.5/layui/css/layui.css"  media="all"/>
<link rel="stylesheet" type="text/css"
	href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css"
	href="lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css"
	href="static/h-ui.admin/css/style.css" />
<title>资讯列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 订单管理 <span class="c-gray en">&gt;</span>订单列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<%-- <div class="text-c"> 日期范围：
		<input type="text" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
		-
		<input type="text" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
		<input type="text" class="input-text" style="width:250px" placeholder="输入活动名称" id="" name="">
		<button type="submit" class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"><a href="javascript:;" onclick="activity_add('添加活动','activity-add','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 新增活动 </a></span> <span class="r">共有数据：<strong>${count}</strong> 条</span> </div>
	 --%>
	<table class="table table-border table-bordered table-bg">
		<thead>
			<tr>
				<th scope="col" colspan="7">活动列表</th>
			</tr>
			<tr class="text-c">
				<th>订单编号</th>
				<th>价格</th>
				<th>商品名称</th>
				<th>联系人姓名</th>
				<th>订单状态</th>
				<th>取消原因</th>
				<!-- <th>显示地址</th> -->
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${data}" var="act" >
	        <tr class="text-c">
	            <td>${act.ordernumber}</td>
	            <td>${act.price}</td>
	            <td>${act.commodity} </td>
	            <td>${act.linkMan.realname }</td> 
			  <c:choose>
			  <c:when test="${act.indentstatus == 0}">
			 		 <td><span style="color: blue">已付款</span></td> 		  
			  </c:when>
			  <c:when test="${act.indentstatus == 1}">
			  		 <td><span style="color: blue">待付款</span></td> 	
			  </c:when>
			  <c:when test="${act.indentstatus == 2}">
			  		 <td><span style="color: black">已取消</span></td> 	
			  </c:when>
			  <c:when test="${act.indentstatus == 3}">
			  		 <td><span style="color: red">退款中</span></td> 	
			  </c:when>
			  <c:when test="${act.indentstatus == 4}">
			  		 <td><span style="color: black">已退款</span></td> 	
			  </c:when>
			  <c:when test="${act.indentstatus == 5}">
			  		 <td><span style="color: blue">待评价</span></td> 	
			  </c:when>
			  <c:otherwise>
			 	 <td><span style="color: green">已评价</span></td>              		  
			  </c:otherwise>
			  </c:choose>
	             <%-- <td>${act.addressid.name}</td> --%>
	             <td>${act.cancel}</td> 
	  			<td class="f-14 product-brand-manage"><a style="text-decoration:none" onClick="indentQuery('订单详情','queryAllIdent?id=${act.id}','${act.id}','800','550')" href="javascript:;" title="编辑">查看订单详情</a></td>
		</c:forEach>
		<input id="handle" name="handle" value="" hidden="hidden">
		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/admin/layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript"
	src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
	src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
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

/* 查看详细信息  */
function indentQuery(title,url,id,w,h){
	if (title == null || title == '') {
		title=false;
	};
	if (url == null || url == '') {
		url="404.html";
	};
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	layer.open({
		type: 2,
		area: [w+'px', h +'px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: title,
		content: url,
		end:function(){    //子页面销毁时回调的方法
        	var handle = $("#handle").val();
        	if( handle == 1){
        		/* layer.msg('修改成功',{icon:1,time:2000});
        		$("#handle").attr("value",""); */
        		layer.msg('退款成功', { 
						 icon: 1,
					 time: 1500 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
						$("#handle").attr("value","");
						window.location.href = 'ident-list';
					});   
        	}
        }
	});
}
layui.use('table', function(){
	 var table = layui.table;
	 table.render({
	    elem: '#demo'
	    ,url: 'getIdent' //数据接口
	    ,page: true //开启分页
	    ,limit: 10 //页数 
	    ,id: 'idTest'
	    ,cols: [[ //表头
	       {type : 'checkbox',fixed  : 'left'}
	 	  ,{field: 'id', title: 'ID',sort: true}
	 	  ,{field: 'ordernumber', title: '订单编号'}
	      ,{field: 'price', title: '价格'}
	      ,{field: 'linkMan.realname',title:'联系人姓名'}
	      ,{field: 'linkMan.iphone',title:'联系人电话'}
	      ,{field: 'commodity', title: '商品名称'}
	    ]]
	    ,response:{
	    	statusCode:200
	    	//重新规定数据成功的状态码为200，table组件默认为0
	    }
	  	,parseData: function (res){
	  		return{
	  			"code":200, //解析数据接口状态
	  			"msg":"", //解析文本
	  			"count":res.count, //解析数据总数
	  			"data":res.data	//解析数据
	  		}
	  	}
	  });
	 
	 
	  //监听表格复选框选择
	  table.on('checkbox(demo)', function(obj){
	    console.log(obj)
	  });
	  var checkStatus = layui.table.checkStatus('idTest').data;
	  //监听行工具事件
	  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'del'){//删除
	      layer.confirm('您确定要删除这条数据吗？',{
	    	  btn:["确定","取消"]
	      }, function(index){
	    	$.ajax({
	    		type : "post",
	    		url  : "delLine",
	    		data : "id="+obj.data.id, 
	    		async:false,//默认为异步请求，设置false为同步
				success: function(res){
					if(res){
						console.log(obj.data)
						layer.msg('删除成功',{icon:1,time:2000});
						obj.del();
						layer.close(index);	
					}	
				}
	    	});
	      });
	    } else if(obj.event === 'edit'){//编辑修改
	      var index = layer.open({
	    		type: 2,
	    		area: ['800px', '500px'],
	    		fix: false, //不固定
	    		maxmin: true,
	    		shade:0.4,
	    		title: '景点编辑',
	    		content: 'updLine?id='+data.id,
	    		end:function(){    //子页面销毁时回调的方法
		        	var handle = $("#handle").val();
		        	if( handle == 1){
		        		/* layer.msg('修改成功',{icon:1,time:2000});
		        		$("#handle").attr("value",""); */
		        		layer.msg('修改成功', { 
								 icon: 1,
							 time: 1500 //2秒关闭（如果不配置，默认是3秒）
							}, function(){
								$("#handle").attr("value","");
								window.location.href = 'attractions-line';
							});   
		        	}
		        }
	      });
	    }else {
    	 var index = layer.open({
	    		type: 2,
	    		area: ['800px', '500px'],
	    		fix: false, //不固定
	    		maxmin: true,
	    		shade:0.4,
	    		title: '选择时间',
	    		content: 'addTime?id='+data.id,
	    		end:function(){    //子页面销毁时回调的方法
		        	var handle = $("#handle").val();
		        	if( handle == 1){
		        		/* layer.msg('修改成功',{icon:1,time:2000});
		        		$("#handle").attr("value",""); */
		        		layer.msg('修改成功', { 
								 icon: 1,
							 time: 1500 //2秒关闭（如果不配置，默认是3秒）
							}, function(){
								$("#handle").attr("value","");
								window.location.href = 'attractions-line';
							});   
		        	}
		        }
	      });
	    }
	  });
});
/* 路线增加  */
function attractions_line_add(title,url,w,h){
	if (title == null || title == '') {
		title=false;
	};
	if (url == null || url == '') {
		url="404.html";
	};
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	layer.open({
		type: 2,
		area: [w+'px', h +'px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: title,
		content: url,
		end:function(){    //子页面销毁时回调的方法
        	var handle = $("#handle").val();
        	if( handle == 3){
        		/* layer.msg('修改成功',{icon:1,time:2000});
        		$("#handle").attr("value",""); */
        		layer.msg('增加成功', { 
						 icon: 1,
					 time: 2000 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
						$("#handle").attr("value","");
						window.location.href = 'attractions-line';
					});   
        	}
        }
	});
}
/* 路线批量删除 */
function active_del(url){
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
				success: function(res){
					if(res){
						layer.msg('删除成功',{icon:1,time:2000});
						layer.close(index);
					}
				}
	    	})
	    },
	    btn2: function(){//layer.alert('aaa',{title:'msg title'});  ////点击取消回调
	        layer.msg('取消回调函数');//layer.closeAll();
	    }
	});
}
			<input id="handle" name="handle" value="" hidden="hidden">
		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/admin/layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript"
	src="lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript"
	src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script>
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

/* 查看详细信息  */
function indentQuery(title,url,id,w,h){
	if (title == null || title == '') {
		title=false;
	};
	if (url == null || url == '') {
		url="404.html";
	};
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	layer.open({
		type: 2,
		area: [w+'px', h +'px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: title,
		content: url,
		end:function(){    //子页面销毁时回调的方法
        	var handle = $("#handle").val();
        	if( handle == 1){
        		/* layer.msg('修改成功',{icon:1,time:2000});
        		$("#handle").attr("value",""); */
        		layer.msg('退款成功', { 
						 icon: 1,
					 time: 1500 //2秒关闭（如果不配置，默认是3秒）
					}, function(){
						$("#handle").attr("value","");
						window.location.href = 'ident-list';
					});   
        	}
        }
	});
}
layui.use('table', function(){
	 var table = layui.table;
	 table.render({
	    elem: '#demo'
	    ,url: 'getIdent' //数据接口
	    ,page: true //开启分页
	    ,limit: 10 //页数 
	    ,id: 'idTest'
	    ,cols: [[ //表头
	       {type : 'checkbox',fixed  : 'left'}
	 	  ,{field: 'id', title: 'ID',sort: true}
	 	  ,{field: 'ordernumber', title: '订单编号'}
	      ,{field: 'price', title: '价格'}
	      ,{field: 'linkMan.realname',title:'联系人姓名'}
	      ,{field: 'linkMan.iphone',title:'联系人电话'}
	      ,{field: 'commodity', title: '商品名称'}
	    ]]
	    ,response:{
	    	statusCode:200
	    	//重新规定数据成功的状态码为200，table组件默认为0
	    }
	  	,parseData: function (res){
	  		return{
	  			"code":200, //解析数据接口状态
	  			"msg":"", //解析文本
	  			"count":res.count, //解析数据总数
	  			"data":res.data	//解析数据
	  		}
	  	}
	  });
	 
	 
	  //监听表格复选框选择
	  table.on('checkbox(demo)', function(obj){
	    console.log(obj)
	  });
	  var checkStatus = layui.table.checkStatus('idTest').data;
	  //监听行工具事件
	  table.on('tool(test)', function(obj){
	    var data = obj.data;
	    if(obj.event === 'del'){//删除
	      layer.confirm('您确定要删除这条数据吗？',{
	    	  btn:["确定","取消"]
	      }, function(index){
	    	$.ajax({
	    		type : "post",
	    		url  : "delLine",
	    		data : "id="+obj.data.id, 
	    		async:false,//默认为异步请求，设置false为同步
				success: function(res){
					if(res){
						console.log(obj.data)
						layer.msg('删除成功',{icon:1,time:2000});
						obj.del();
						layer.close(index);	
					}	
				}
	    	});
	      });
	    } else if(obj.event === 'edit'){//编辑修改
	      var index = layer.open({
	    		type: 2,
	    		area: ['800px', '500px'],
	    		fix: false, //不固定
	    		maxmin: true,
	    		shade:0.4,
	    		title: '景点编辑',
	    		content: 'updLine?id='+data.id,
	    		end:function(){    //子页面销毁时回调的方法
		        	var handle = $("#handle").val();
		        	if( handle == 1){
		        		/* layer.msg('修改成功',{icon:1,time:2000});
		        		$("#handle").attr("value",""); */
		        		layer.msg('修改成功', { 
								 icon: 1,
							 time: 1500 //2秒关闭（如果不配置，默认是3秒）
							}, function(){
								$("#handle").attr("value","");
								window.location.href = 'attractions-line';
							});   
		        	}
		        }
	      });
	    }else {
    	 var index = layer.open({
	    		type: 2,
	    		area: ['800px', '500px'],
	    		fix: false, //不固定
	    		maxmin: true,
	    		shade:0.4,
	    		title: '选择时间',
	    		content: 'addTime?id='+data.id,
	    		end:function(){    //子页面销毁时回调的方法
		        	var handle = $("#handle").val();
		        	if( handle == 1){
		        		/* layer.msg('修改成功',{icon:1,time:2000});
		        		$("#handle").attr("value",""); */
		        		layer.msg('修改成功', { 
								 icon: 1,
							 time: 1500 //2秒关闭（如果不配置，默认是3秒）
							}, function(){
								$("#handle").attr("value","");
								window.location.href = 'attractions-line';
							});   
		        	}
		        }
	      });
	    }
	  });
});

</script>

</body>
</html>