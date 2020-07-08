<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>社区问答-驴妈妈旅游网</title>
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
<link rel="stylesheet" href="css/tags.css" >
<link href="css/header-air.css" rel="stylesheet"/>
<link href="css/ui-lvmama.css" rel="stylesheet" />
<link href="css/ui-components.css" rel="stylesheet" />
<link href="css/lv-bought.css" rel="stylesheet" />
<link rel="stylesheet" href="css/global_pop.css">
<link href="css/ui-components.css" rel="stylesheet" />
<link rel="stylesheet" href="css/lv-user-mytrip.css">
<link rel="stylesheet" href="css/newmember.css" >
<link rel="stylesheet" href="css/tip.css" >
<link rel="stylesheet" href="css/newcommon.css" >
<link rel="stylesheet" href="css/integral.css" >
<link rel="stylesheet" href="css/buttons.css" >
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/station-message.css"/>

</head>
<body class = "lv_newhome lvnav_community_ask">
<div id="wrap" class="ui-container lvmama-bg">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<!---会员中心导航结束--->
<div class="newmember_main">
<!--社区问答－左则菜单-->
<jsp:include page="myPageLeft.jsp" flush="true" />
	<!--社区问答－右则内容-->
    <div class="newmember_rightside" style="margin:0px;padding:0px;">
    	<div class="mod_box">
            <div class="question-top-box">
                <p class="question-title">我的问答</p>
                <div class="question-content clearfix">
                    <img width="80" height="80" alt="" src="" class="question-img">
                    <div class="question-content-anthor">
                        <span class="content-anthor">
							万相19382753
						</span>
                        <div class="span-question">
                            <span>我的问题<b>0</b></span>
                            <span>我的回答<b>0</b></span>
                            <span>我的关注<b>0</b></span>
                        </div>
                    </div>
                    <div class="question-content-right">
                        <i class="tip-icon tip-icon-lv"></i>
                        <a href="question" title="" target="_blank"><i class="tip-icon tip-icon-plus"></i>我要提问</a>
                    </div>
                </div>
            </div>
            <div class="question-bottom-box">
                <ul class="qestion-box-nav js-tab-nav clearfix">
                    <li class="active" ><a href="/myspace/myQuestions.do">我的问题</a><i class="tip-icon tip-icon-sangle"></i></li>
                    <li  ><a href="/myspace/myAnswers.do">我的回答</a><i class="tip-icon tip-icon-sangle"></i></li>
                    <li  ><a href="/myspace/myFollows.do">我的关注</a><i class="tip-icon tip-icon-sangle"></i></li>
                </ul>
                <div class="question-tab-box">
                    <div class="tabcon" style="display:block;">
								<!--无结果 START-->
		                        <div class="question-no-result">
		                            <i class="tip-icon tip-icon-question-lv"></i>您还没有咨询过问题哦～
		                        </div>
		                        <!--无结果 END-->
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>

<!--删除评论 START-->
<div class="float-delete-comment">
    <i class="tip-icon tip-icon-trangle"></i>
    <p class="float-comment">
        <i class="tip-icon tip-icon-tips"></i>确认删除这条回答吗？
    </p>
    <div class="comment-btn">
        <a class="btn btn-xs btn-orange js-sure">确定</a>
        <a class="btn btn-xs js-cancel">取消</a>
    </div>
</div>
<!--删除评论 END-->

<!--帮助中心开始-->
<div class="help_box">
	<a class="title" href="javascript:;"></a>
    <div class="help_box_content">
   	 	<div class="content">
	        <ul class="list">
	            <li><a href="" target="_blank" hidefocus="false">没有收到短信？</a></li>
	            <li><a href="" target="_blank" hidefocus="false">如何退款？</a></li>
	            <li><a href="" target="_blank" hidefocus="false">如何修改订单？</a></li>
	        </ul>
	        <p class="more_box"><a href="" target="_blank" hidefocus="false">更多帮助&gt;</a></p>
	        <p class="more_box">任何疑问请拨打<span class="tle_box"><i class="kf_icon"></i>1010-6060</span></p>
    	</div>
    </div>
</div>
<!--帮助中心结束-->
<!--右侧帮助中心-->
<div class="hr_b"></div>
</div>
<script src="js/footer.js"></script>
</body>
</html>