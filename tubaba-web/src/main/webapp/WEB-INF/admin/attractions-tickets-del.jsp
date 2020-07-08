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
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 景点管理 <span class="c-gray en">&gt;</span> 景点列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
		<span class="l">
			<a href="attractions-tickets" class="btn btn-danger radius">
				<i class="Hui-iconfont">&#xe65c;</i>返回
			</a>
		</span>
				
		<!-- 数据表格  -->
	 	<table  id="demo" lay-filter="demo"></table>

	 	<!-- 操作单元格 -->
	 	<script type="text/html" id="toolbarDemo">
			<a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del" title="恢复"><i class="Hui-iconfont">&#xe604;</i>恢复</a>
		</script>
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
var table;
layui.use('table', function(){
   tables = layui.table;
  tables.render({
    elem: '#demo'
    ,url: 'getDeltickets' //数据接口
    ,page: true //开启分页
    ,limit: 10 //页数 
    ,id: 'idTest'
    ,cols: [[ //表头
       {type : 'checkbox',fixed  : 'left'}
 	  ,{field: 'id', title: 'ID',sort: true}
      ,{field: 'scenicname', title: '景点名称'}
      ,{field: 'coverImage',title:'封面',templet:'<div><img src="{{d.coverImage}}"></div>',style:'height:48px;width:48px;line-height:48px!important;'}
      ,{field: 'province', title: '景点所在省'}
      ,{field: 'city', title: '景点所在市',} 
      ,{field: 'address', title: '景点地址',}
      ,{field: 'introduce', title: '景点介绍'}
      ,{field: 'floor_price', title: '底价'}
      ,{field: 'right', title: '操作',toolbar:"#toolbarDemo"}
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
  tables.on('checkbox(demo)', function(obj){
	  var date = layui.table.checkStatus('idTest').data;
	  console.log(date)
  });
  

  //监听行工具事件
  tables.on('tool(demo)', function(obj){
    var data = obj.data;
    if(obj.event === 'del'){//删除
      layer.confirm('您确定要恢复这条数据吗？',{
    	  btn:["确定","取消"]
      }, function(index){
    	$.ajax({
    		type : "post",
    		url  : "restore_del",
    		data : "id="+obj.data.id,
    		async:false,//默认为异步请求，设置false为同步
			success: function(res){
				if(res){
					layer.msg('恢复成功',{icon:1,time:2000});
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
    		content: 'attractions_tickets_aedit?id='+data.id,
    		end:function(){    //子页面销毁时回调的方法
	        	var handle = $("#handle").val();
	        	if( handle == 1){
	        		
	        		layer.msg('修改成功', { 
							 icon: 1,
						 time: 1500 //2秒关闭（如果不配置，默认是3秒）
						}, function(){
							$("#handle").attr("value","");
							window.location.href = 'attractions-tickets';
						});   
	        	}
	        }
      });
    }
  }); 
  
});
$(function(){
	 $("input[name='lock']").click(function(){
		 alert('1111');
            $.each($('input:checkbox'),function(){
                if(this.checked){
                    window.alert("你选了："+
                        $('input[type=checkbox]:checked').length+"个，其中有："+$(this).val());
                }
            });
	 });
})
/* 景点增加  */
function attractions_add(title,url,w,h){
	layer_show(title,url,w,h);
}
function getCheckNode(){
	var checkStatus=tables.checkStatus("idTest");//这里是lay-filter?
	var data=checkStatus.data;
	var jsonData=JSON.stringify(data);
	var dataObj=$.parseJSON(jsonData);
	console.log(dataObj)
	return dataObj;
}
/*批量删除*/
function datadel(){
	var dataObj=getCheckNode();
	if(dataObj.length>0){
		var arr=new Array();
		for(var i=0;i<dataObj.length;i++){
			arr[i]=dataObj[i].id;
			console.log(arr[i])
		}
		layer.confirm('确认要删除吗？', function(index) {
			$.ajax({
				url:"piliang_delete",
				data:"ids="+arr.join(","),
				type:"POST",
				success:function(result){ 
					if(result){
						layer.msg('删除成功', { 
							 icon: 1,
						 time: 1500 //2秒关闭（如果不配置，默认是3秒）
						}, function(){
							location.replace(location.href);
						});   
					}
				}
			})
		})
	}else{
		layer.msg("请选择要删除的数据！");
	}
}
</script>

</body>
</html>