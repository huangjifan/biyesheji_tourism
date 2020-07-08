<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>游记封面</title>
<link rel="stylesheet" href="css/user/tricp.css" type="text/css">
<link rel="stylesheet" href="css/user/header_trip.css">
<link rel="stylesheet" type="text/css" href="css/user/view_new.css">
<!-- 图库样式 -->
<link rel="stylesheet" type="text/css" href="css/user/webuploader.css">
<!-- image dialog -->
<link rel="stylesheet" href="css/user/image.css" type="text/css" />
<link rel="stylesheet" href="http://s2.lvjs.com.cn/styles/you/tricp.css" type="text/css">
<link rel="stylesheet" href="css/user/icons.css">
<link rel="stylesheet" href="css/user/travel_publich.css"/>
<script type="text/javascript" src="js/user/myWrite.js"></script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<style type="text/css">
	.fileupload{
		float: right;
		width:300px;
		position: absolute;
		top:100px;
		left:1000px;
	}
	#btn{
		width:100px;
		height:30px;
		background-color: #ff359a;
	}
</style>
</head>
<body class="lvyou_yj">
<jsp:include page="../../../head.jsp"></jsp:include>

<div id="content">    <div class="wrap_nav">
        <div class="nav_content">
            <a href="javascript:history.go(-1)">&gt;&nbsp;返回编辑游记</a>
            <em>发表游记</em>
            <p class="fixedShow">选择或<b class="js-upload-btn">上传</b>封面图</p>
            <span>已自动保存成功</span>
        </div>
    </div>
    <div class="banner">
        <div class="banner-content clearfix">
            <div class="banner-img js-banner-img">
            	<img src="image/default.jpg" id="img">
           
            </div>
            <div class="banner-word">
                <div class="js-no-choice">
                    <p class="title">选择或上传封面图</p>
                    <p class="describe">图片比例为3:2<br/>
                    	宽度需大于600像素，高度需大于400像素</p>
                </div>
            </div>
            <div class="fileupload">
                <form action="uploadTravelImg" method="post" enctype="multipart/form-data">
	            	<input type="file"  id="file" name="file"><br><br>
	            	<span class="btn-upload js-upload-btn">
	            	<input type="hidden" value="${tid }" name="tid" id="tid">
	            	<input id="btn" type="submit" value="上传封面" style="background-color: white;border:white " onclick="return img()"></span>
		        </form>
            </div>
        </div>
        
        <div class="banner_bg"><img src="image/banner.png"></div>
    </div>
    <div class="traveler-wrap js-travel-writer">
        <ul>
                                                        
            


        </ul>
            </div>
    <div class="destination-label js-destination-label">
        <p class="title"><span class="left-icon"></span>选择最相关的目的地标签，让你的游记更容易被发现（必选，1-3个）<span class="right-icon"></span></p>
        <div class="destination-labels">

                        
                            <i class="flag" style="display: none;">已加满3个标签</i>
            


        </div>
        <div class="destination-search">
            <input type="text" id="js_autoComplete1" placeholder="搜索添加目的地"/>
        </div>
        <div class="publish-btn disabled js-publish">发表<i>至少要设置1个目的地标签0</i></div>
    </div>
    <!--图片裁减弹层-->
    <div class="picture-reduce-dialog">
        <div class="picture-box js-picture-box">
            <div class="bg"></div>
            <div class="btns">
                <a class="btn btn-lg js-cancel-cut">取消裁剪</a>
                <a class="btn btn-lg btn-pink js-confirm-cut">确认裁剪</a>
            </div>
            <div class="control-center js-cut-control">
                <i class="lt"></i>
                <i class="rt"></i>
                <i class="rb"></i>
                <i class="lb"></i>
                <span>封面图长宽比只能为3:2，拖拽裁剪调整展示区域<em></em></span>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
   $(function () {
       $("#file").change(function () {
           var $file = $(this);
           var fileObj = $file[0];
           var windowURL = window.URL || window.webkitURL;
           var dataURL;
           var $img = $("#img");

           if (fileObj && fileObj.files && fileObj.files[0]) {
               dataURL = windowURL.createObjectURL(fileObj.files[0]);
               $img.attr('src', dataURL);
           } else {
               dataURL = $file.val();
               var imgObj = document.getElementById("img");
               // 两个坑:
               // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
               // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
               imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
               imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;

           }
       });
   });
</script>
<script type="text/javascript" src="js/footer.js"></script>
</body>
</html>