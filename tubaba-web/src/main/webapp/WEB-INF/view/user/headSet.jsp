<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
</head>
<body class="lvnav_photoinfo lv_newaccount">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>

<div class="newmember_main">
<!-- 会员中心左边菜单部分 -->
<jsp:include  page="userInfo_left.jsp" flush="true"/>    
<!-- <script type="text/javascript">
 var filechange = function(event){
    var files = event.target.files, file;
    if (files && files.length > 0) {
        // 获取目前上传的文件
        file = files[0];// 文件大小校验的动作
        if(file.size > 1024 * 1024 * 2) {
            alert('图片大小不能超过 2MB!');
            return false;
        }
        // 获取 window 的 URL 工具
        var URL = window.URL || window.webkitURL;
        // 通过 file 生成目标 url
        var imgURL = URL.createObjectURL(file);
        //用attr将img的src属性改成获得的url
      /*   $(".upload_img").attr("src",imgURL);
        $("#headImg").show();
        $('#btn_upload').hide();
        $('span.btn_photo_add').removeClass('btn_photo_add_stop');
        $('span.btn_photo_add').click(function(){
        	alert(111);	
        })
        } */
        // 使用下面这句可以在内存中释放对此 url 的伺服，跑了之后那个 URL 就无效了
        // URL.revokeObjectURL(imgURL);
};
</script> -->

<script type="text/javascript">
	function filechange(event){
		var files = event.target.files, file;
		if (files && files.length > 0) {
			var path = $("#btn_file").val();
	        if (path.length == 0) {
	            alert("Please upload the hotel logo!");
	            return false;
	        } else {
	            var extStart = path.lastIndexOf('.'),
	                ext = path.substring(extStart, path.length).toUpperCase();
	            if (ext !== '.PNG' && ext !== '.JPG' && ext !== '.JPEG') {
	            	$('.overlay').show();
	            	$('.dialog-default').show();
	                return false;
	            }
	        }
	        // 获取目前上传的文件
	        file = files[0];// 文件大小校验的动作
	        if(file.size > 1024 * 1024 * 2) {
	            alert('图片大小不能超过 2MB!');
	            return false;
	        }
	        // 获取 window 的 URL 工具
	        var URL = window.URL || window.webkitURL;
	        // 通过 file 生成目标 url
	        var imgURL = URL.createObjectURL(file);
	        //用attr将img的src属性改成获得的url
	         $(".upload_img").attr("src",imgURL);
	        $("#headImg").show();
	        $('#btn_upload').hide();
	        $('span.btn_photo_add').removeClass('btn_photo_add_stop');
	        $('span.btn_photo_add').click(function(){
	        	/* $("#upload_user_img").ajaxSubmit({
                    type: "POST",
                    url: "oploadHead",
                    dataType: "json",
                    success: function(data){
                         if(data.result > 0){
                    		$('#h5_head').text('头像上传成功');
                    		$('#p_body').hide();
                    		window.location.reload();
                    	}
                    },
                    error: function(){
                    }
           		}); */
           		var formData = new FormData();
           	    formData.append("file",$("#btn_file")[0].files[0]);
	        	$.ajax({
      		         type:'POST',
      		         url:"oploadHead",
      		         data:formData,
      		         contentType:false,
      		         processData:false,//这个很有必要，不然不行
      		         dataType:"json",
      		         mimeType:"multipart/form-data",
      		         success:function(data){
	     		            if(data.result > 0){
			        		window.location.reload();
			        	}
      		         }
      		     });
	        })
	        $('span.btn_photo_remove').click(function(){
	        	window.location.reload();
	        })
	        return true;
	    }else{
	    	return false;
	    }
	}
	function dialogHide(){
		$('.overlay').hide();
    	$('.dialog-default').hide();
	}
</script>
<div data-mask="overlay" class="overlay" style="z-index: 3999; display: none;"></div>
<div class="dialog dialog-default" style="display: none; z-index: 4002; position: fixed; top: 30%; left: 30%;">    <div class="dialog-inner clearfix">        <a class="dialog-close" onclick="dialogHide()" data-dismiss="dialog">×</a>        <div class="dialog-header" data-title="title">消息提醒</div>        <div class="dialog-body" style="">            <div class="dialog-content clearfix" data-content="content"><div class="photo_tips_box" id="photo_tips_sb_img_type" style="display: block;">
    <div class="photo_tips">
        <span class="tip-icon-big tip-icon-big-warning"></span>
        <h5 id="h5_head">头像上传失败！</h5>
        <p id="p_body">目前仅支持jpg、png、jpeg格式</p>
    </div>
</div></div>        </div>        <div class="dialog-footer" data-btn="btns"><button class="pbtn pbtn-small pbtn-orange" onclick="dialogHide()">确定</button></div>    </div></div>

<div class="newmember_rightside">
        <div class="mod_box">
            <div class="mod_content p20_4">
                <div class="password_edit_title">
                    <h4>头像设置<span class="bind_tips">（仅支持 jpg、png、jpeg格式，且小于2M）</span></h4>
                </div>
                <div class="photo_main">
                    <div class="photo_box">
                        <i class="photo_icon"></i>
                        <div class="btn_upload" style="display:block;" id="btn_upload">上传照片
                            <form id="upload_user_img"  name="upload_user_img" action="oploadHead" enctype="multipart/form-data" method="post" target="hidden_frame">
                                <input id="btn_file" onchange="filechange(event)" type="file" name="file" accept="image/png,image/jpeg,image/jpg" />
                            </form>
                            <iframe name="hidden_frame" id="hidden_frame" style="display:none"></iframe>
                        </div>
                        <!--等比缩放图片-->
                        <img class="upload_img" id="headImg" src="" style="display: none; width: 254px; height: 254px; left: 0px;">
                        <!--裁切灰色背景-->
                        <div class="img_bg" style="display: none;"></div>
                        <div class="up_loading"></div>
                        <!--裁剪运动模块-->
                        <!-- <div class="move_box" style="display: block; width: 130px; height: 130px; left: 48px; top: 44px;">
                            <img src="http://pic.lvmama.com/pics//uploads/pc/place2/2018-11-12//PC-83577af9-8d8d-4301-abd2-d3ced2f7e164.jpg" style="display: inline; left: -49px; top: -45px; width: 254px; height: 254px;">
                            <span></span>
                        </div> --><!--裁剪运动模块-->
                    </div>
                    <ul class="photo_ok">
                        <li class="photo_img1">
                            <img src="${hair }" width="130" height="130">

                            <p>130 * 130像素</p>
                        </li>
                        <li class="photo_img2">
                            <img src="${hair }" width="90" height="90">

                            <p>90 * 90像素</p>
                        </li>
                        <li class="photo_img3">
                            <img src="${hair }" width="27" height="27">

                            <p>27 * 27像素</p>
                        </li>
                    </ul>
                    <div class="btn_photo_box">
                        <span class="btn_photo_add btn_photo_add_stop">保存</span>
                        <span class="btn_photo_remove">取消</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--帮助中心开始-->
<div class="help_box">
	<a class="title" href="javascript:;"></a>
    <div class="help_box_content">
   	 	<div class="content">
	        <ul class="list">
	            <li><a href="#" target="_blank" hidefocus="false">没有收到短信？</a></li>
	            <li><a href="#" target="_blank" hidefocus="false">如何退款？</a></li>
	            <li><a href="#" target="_blank" hidefocus="false">如何修改订单？</a></li>
	        </ul>
	        <p class="more_box"><a href="#" target="_blank" hidefocus="false">更多帮助&gt;</a></p>
	        <p class="more_box">任何疑问请拨打<span class="tle_box"><i class="kf_icon"></i>1010-6060</span></p>
    	</div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/js/footer.js"></script>
</body>
</html>