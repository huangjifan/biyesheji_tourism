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
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>图片展示</title>
<link href="lib/lightbox2/2.8.1/css/lightbox.css" rel="stylesheet" type="text/css" >
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 图片管理 <span class="c-gray en">&gt;</span> 图片展示 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	 <a href="javascript:;" onclick="getDelete()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i>删除</a> </span> <span class="r">共有数据：<strong>${count }</strong> 条</span> </div>
	<div class="portfolio-content">
		<ul class="cl portfolio-area">
		<c:if test="${count==0 }">
			暂无详细图片
		</c:if>
		<c:if test="${count!=0 }">
			<c:forEach items="${imagelist }" var="image">
				<li class="item">
					<div class="portfoliobox">
						<input class="checkbox" name="image" type="checkbox" value="${image.id }">
						<div class="picbox"><a href="${image.path }" data-lightbox="gallery" data-title="图${image.scenic.id }"><img src="${image.path }"></a></div>
					</div>
				</li>
			</c:forEach>
		</c:if>
		</ul>
	</div>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/lightbox2/2.8.1/js/lightbox.min.js"></script> 
<script type="text/javascript">
$(function(){
	$(".portfolio-area li").Huihover();
});
function getDelete(){
	var arr= new Array();;
	  $("input[type='checkbox']:checked").each(function(){ 
	       arr.push(this.value);
	  })
	$.ajax({
		url:"deletewayImage",
		type:"post",
		dataType : "json",
		data:"ids="+arr.join(","),
		success:function(result){
			if(result==true){
				alert("删除成功！！");
				location.reload();
			}else{
				alert("删除失败！！");
				location.reload();
			}
		}
	})
}
</script>
</body>
</html>