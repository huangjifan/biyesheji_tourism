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
<link rel="stylesheet" type="text/css" href="js/admin/layui-v2.4.5/layui/css/layui.css"  media="all"/>
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<title>定制</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 景点管理 <span class="c-gray en">&gt;</span> 周边游 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<!-- 	<span class="l">
			<a href="javascript:;" onclick="datadel()" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe6e2;</i> 查看已删除的
			</a>
		</span>&nbsp; -->
		
		<!--           搜索客户：
		    <div class="layui-inline">
		        <input class="layui-input" name="keyword" id="demoReload" autocomplete="off">
		    </div>
		    	<button class="layui-btn" data-type="reload">搜索</button> -->
		
		<!-- 数据表格  -->
	 	<table  id="demo" lay-filter="test"></table>

	 	<!-- 操作单元格 -->
		<!-- <a class="layui-btn layui-btn-xs" lay-event="edit" title="编辑"><i class="Hui-iconfont">&#xe6df;</a> -->
 		<!-- <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a> -->

	 	<script type="text/html" id="barDemo">
			<a class="layui-btn layui-btn-xs" lay-event="del" title="编辑"><i class="Hui-iconfont">&#xe6df;</a>
		</script>
		<!-- 状态栏  -->
		<script type="text/html" id="checkboxTpl">
  			<input type="checkbox" name="lock"  value="{{d.id}}" title="锁定" lay-filter="lockDemo" {{ d.id == 10006 ? 'checked' : '' }}>
		</script>
		<input id="id" name="handle" value="" hidden="hidden">
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="js/admin/layui-v2.4.5/layui/layui.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
/* 数据表格-景点信息  */
layui.use('table', function(){
  var table = layui.table;
  table.render({
    elem: '#demo'
    ,url: 'customData' //数据接口
    ,page: true //开启分页
    ,limit: 10 //页数 
    ,id: 'id'
    ,cols: [[ //表头
       {type : 'numbers',fixed  : 'left'}
      ,{field: 'ordernumber', title: '订单编号'}
      ,{field: 'startcity', title: '出发城市'}
      ,{field: 'endcity', title: '到达城市'}
      ,{field: 'starttime', title: '出发时间'} 
      ,{field: 'endtime', title: '返回时间'}
      ,{field: 'people',title:'人数',}
      ,{field: 'budget', title: '人均预算'}
      ,{field: 'email', title: '邮箱'}
      ,{field: 'phone', title: '电话'}
      ,{field: 'name', title: '联系人姓名'}
      ,{field: 'username', title: '下单用户名'}
      ,{field: 'right', title: '操作',toolbar:"#barDemo"}
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
  
  //监听行工具事件
  table.on('tool(test)', function(obj){
    var data = obj.data;
    if(obj.event === 'del'){//删除
      layer.confirm('您确定要取消这条订单吗？',{
    	  btn:["确定","取消"]
      }, function(index){
    	$.ajax({
    		type : "post",
    		url  : "delcous",
    		data : "id="+data.id,
    		async:false,//默认为异步请求，设置false为同步
			success: function(res){
				if(res){
					console.log(obj.data)
					layer.msg('取消成功',{icon:1,time:2000});
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
    		title: '定制编辑',
    		content: '?id='+data.id,
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
							window.location.href = 'attractions-tickets';
						});   
	        	}
	        }
    		/* btn: ['提交','取消'],
    		scrollbar: false ,
    		yes: function(index){//layer.msg('yes');    //点击确定回调
    	    	$.ajax({
    	    		url:"attractions_edit",
    				dataType:"json",
    				type:"Post",
    				async:false,//默认为异步请求，设置false为同步
    				success: function(res){
    					if(res){
    						layer.msg('修改成功',{icon:0,time:2000});
    						layer.close(index);
    					}
    				}
    	    	})
    	    },
    	    btn2: function(index){//layer.alert('aaa',{title:'msg title'});  ////点击取消回调
    	    	layer.close(index);
    	    } */
      });
    }
  });
  
});
/* $(function(){
	 $("input[name='lock']").click(function(){
		 alert('1111');
            $.each($('input:checkbox'),function(){
                if(this.checked){
                    window.alert("你选了："+
                        $('input[type=checkbox]:checked').length+"个，其中有："+$(this).val());
                }
            });
	 });
}) */
function datadel(){
	
}
</script>

</body>
</html>