<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>写游记</title>
<link rel="stylesheet" href="css/user/tricp.css" type="text/css">
<link rel="stylesheet" href="css/user/header_trip.css">
<link rel="stylesheet" type="text/css" href="css/user/view_new.css">
<!-- 图库样式 -->
<link rel="stylesheet" type="text/css" href="css/user/webuploader.css">
<!-- image dialog -->
<link rel="stylesheet" href="css/user/image.css" type="text/css" />
<!--弹出窗-->
<link rel="stylesheet" href="css/user/layui.css" > 
<link href="umeditor/themes/default/css/umeditor.css" type="text/css" rel="stylesheet"> 
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/myWrite.js"></script>
<script type="text/javascript" src="js/user/dialog.js"></script>
<script type="text/javascript">
function alter(id){
	var theme=$("#theme").val();
	var content=$("#myEditor").text();
	if (theme.trim()=='') {
		alert("标题不能为空");
		return;
	}
	else {
		if ($.trim(content.replace(/(^\s*)|(\s*$)/g, ""))=="") {
			alert("内容不能为空");
			return;
		}
		else {
			$.ajax({
				url:"editWrite",
				data:{
					id:id,
					theme:theme,
					content:$("#myEditor").html()
				},
				type:"post",
				success:function(data){
					if (data=='true') {
						alert("游记修改成功!");
						window.parent.opener.location.reload();
						window.close();
					}
					else if(data=='false'){
						alert("游记修改失败！");
						location.href="mywrite"
					}
					else {
						alert("没有登录");
					}
				},
				error:function(){
					alert("游记修改失败");
				}
			})
		}
	}
}
</script>
</head>
<body class="lvyou_yj">
<!-- 头部页面 开始 -->
<jsp:include page="head.jsp"></jsp:include>
<div class="lv_header">
    <div class="header_inner clearfix">
        <div class="lv_logo">
            <a href="index">驴妈妈旅游网</a>
        </div>
        <ul class="lv_baozhang">
            <li><i class="icon_bz1"></i>价格保证</li>
            <li><i class="icon_bz2"></i>退订保障</li>
            <li><i class="icon_bz3"></i>救援保障</li>
            <li><i class="icon_bz4"></i>24时服务</li>
        </ul>
        <div class="trip_logo"><span>|</span>游记</div>
        <div class="header_search" id="headerSearch_div1">
            <input type="hidden" id="fromPlaceName" value="">
            <div class="lv_search_box">
                <div class="search_type">
                    <div class="btn_type js_btn_type"><b data-type="ALL">所有产品</b><!--<i class="icon_arrow"></i>--></div>
                    <ul class="search_type_tab">
                        <li data-type="ALL">游记</li>
                        <!--<li data-type="TICKET">作者</li>-->
                    </ul>
                </div>
                <div class="search_type_box">
                    <div class="search_type_list">
                        <form class="form_search" action="">
                            <input name='kw' class="lv_search w_380" x-webkit-speech placeholder="请输入城市、景点" type="text" value="">
                        </form>
                    </div>
                    <div class="search_type_list">
                        <form class="form_search">
                            <input class="lv_search w_380" x-webkit-speech placeholder="请输入作者" type="text" autocomplete="off">
                        </form>
                    </div>
                </div>
                <span class="lv_icon btn_lv_search"></span>
            </div>
        </div>
    </div>
</div>
<!-- 发表游记开始 -->
<div class="travel-notes">
    <div class="travel-notes-wrap">
        <!-- 公告 START -->
        <div class="travel-notice">
            <p class="travel-notice-title"><i class="travel-horn-icon"></i>公告栏</p>
            <ul>
                <li><a href="index" title="" target="_blank">背着Doughnut去旅行第二季|写游记赢价值998元情侣背包、499元网红背包，发表前缀为【背着Doughnut去旅行】游记，各种精选高品质好物等你来拿~</a></li>
            </ul>
        </div>
        <!-- 公告 END -->

       <!-- 创建新游记的图片 START -->
       <div class="travel-creat-youji"></div>
       <!-- 创建新游记的图片 END -->
       <!-- 游记标题 START -->
        <div class="travelogue-title clearfix">
            <div class="travelogue-title-input">
                <span class="travelogue-text-title">   游记标题： </span>
                <input type="text" class="travelogue-text js-travel-text" id="theme" value="${edit.title }"/>
            </div>
        </div>
        <!-- 游记标题 END -->
        <!-- 游记章节部分 START -->
        <div class="travel-chapters clearfix">
            <div class="travel-chapters-left">
            <span class="travelogue-text-title">   游记内容： </span>
                <ul class="travel-catalog js-travel-catalog">
                    <li>
						<!-- 富文本框 -->
						<div id="edit_body">
							<div id="edit_body_tip">
								<b>内容(TinyMCE编辑器，支持拖放/粘贴上传图片)</b>
							</div>
							<div id="container">
							<!--style给定宽度可以影响编辑器的最终宽度-->
							<script type="text/plain" id="myEditor" style="width:100%;height:240px;">
    								${edit.content}
							</script>					
							</div>
						</div>
						<div class="preview-btn">
				            <a href="javaScript:;" class="preview-btn1 preview-red" onclick="alter(${edit.id})"> 下一步 </a>
				        </div>
					</li>
                </ul>
            </div>
            <div class="travel-gallery">
            	<img alt="" src="image/shangchuang.jpg" width="247px;",height="494px;">
        	</div>
    	</div>
    <!-- 发表游记结束 -->

    <!-- 搜索部分浮层 START-->
    <div class="travel-search-list">
        <div class="travel-search-first"><a href="javascript:;" class="t_tipsAdd">直接输入“<span></span>”</a></div>
        <ul>
        </ul>
    </div>
    <!-- 搜索部分浮层 END-->

    <!-- 图片旋转弹层 START -->
    <div class="divPop image_rorate js_image_rorate">
        <p class="divPopTitle">图片旋转</p>
        <div class="image_rorate_content">
            <div class="image_rorate_btn">
                <span class="image_anti_clock_wise js_anti_clock_wise"><i class="icon_wise icon_clock_wise"></i>左转</span>
                <span class="image_clock_wise js_clock_wise"><i class="icon_wise icon_anti_clock_wise"></i>右转</span>
            </div>
            <div class="rorate_image" data_rotate='0' data_src='0'>
            </div>
            <span class="rorate_image_save js_save_image">保 存</span>
        </div>
    </div>
    <!-- 图片旋转弹层 END -->

    <!-- 删除章节弹层 START -->
    <div class="divPop delete_chapter js_delete_chapter">
        <span class="divPopClose js_chapter_cancel"></span>
        <p class="divPopTitle">删除章节?</p>
        <div class="delete_chapter_content">
            <p>是否要删除这个章节吗？这一章节的文字都将会被删除？</p>
            <div class="delete_chapter_btn">
                <span class="delete_chapter_sure js_chapter_sure">确 定</span>
                <span class="delete_chapter_cancel js_chapter_cancel">取 消</span>
            </div>
        </div>
    </div>
    <!-- 删除章节弹层 END -->

    <!-- 增加新标题 模板 start -->
    <div class="add_chapter_template" style="display: none;">
        <div class="travel-move-arrow">
            <div class="travel-move-arrowall">
                <span class="travel-arrow travel-arrow-up"></span>
                <span class="travel-arrow travel-arrow-down"></span>
                <span class="travel-icon-close"></span>
            </div>
        </div>
        <div class="travel-eduitor active">
            <div class="travel-eduitor-title js-travelogue-btn">
                <p></p>
                <span><b class="travelogue-sangle"></b></span>
            </div>
            <div class="travel-eduitor-content">
                <div class="travel-eduitor-search">
                    <input type="text" class="travel-search-input js-travel-text js-travel-search"/><span class="travelogue-text-num"><b>0</b>/40</span>
                </div>
            </div>
        </div>
    </div>
    <!-- 增加新标题 模板 end -->

    <!-- 城市 START -->
    <div class="e-cities-wrap">
        <dl class="e-cities">
            <dt class="e-c-title">热门精选</dt>
            <dd class="e-c-content clearfix">
                            </dd>
        </dl>
    </div>

</div>
</div>
<div id="footer">
     <script src="js/footer.js"></script>
</div>
 
<script type="text/javascript" src="umeditor/third-party/jquery.min.js"></script>  
<script type="text/javascript" charset="utf-8" src="umeditor/umeditor.config.js"></script>  
<script type="text/javascript" charset="utf-8" src="umeditor/umeditor.min.js"></script>  
<script type="text/javascript" src="umeditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript">
    //实例化编辑器
    var um = UM.getEditor('myEditor');
    um.addListener('blur',function(){
        $('#focush2').html('编辑器失去焦点了')
    });
    um.addListener('focus',function(){
        $('#focush2').html('')
    });
    //按钮的操作
    function insertHtml() {
        var value = prompt('插入html代码', '');
        um.execCommand('insertHtml', value)
    }
    function isFocus(){
        alert(um.isFocus())
    }
    function doBlur(){
        um.blur()
    }
    function createEditor() {
        enableBtn();
        um = UM.getEditor('myEditor');
    }
    function getAllHtml() {
        alert(UM.getEditor('myEditor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UM.getEditor('myEditor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用umeditor')方法可以设置编辑器的内容");
        UM.getEditor('myEditor').setContent('欢迎使用umeditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UM.getEditor('myEditor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UM.getEditor('myEditor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UM.getEditor('myEditor').selection.getRange();
        range.select();
        var txt = UM.getEditor('myEditor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UM.getEditor('myEditor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UM.getEditor('myEditor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UM.getEditor('myEditor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UM.getEditor('myEditor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            domUtils.removeAttributes(btn, ["disabled"]);
        }
    }
</script>
</body>
</html>