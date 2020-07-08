<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会员中心</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/personal_information.js"></script>
</head>
<body class="lvnav_perinfo lv_newaccount">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<!-- 修改用户名弹出框 -->
<div data-mask="overlay" class="overlay" style="z-index:3999 ;display:none;"></div>
<div id="tone" class="dialog dialog-default" style="width: 500px; z-index: 4000; position: fixed; top: 75px; left: 461px;display:none;">    
<div class="dialog-inner clearfix">        
	<a class="dialog-close" data-dismiss="dialog">×</a>       
	<div class="dialog-header" data-title="title">修改用户名</div>        
	<div class="dialog-body">            
		<div class="dialog-content clearfix" data-content="content">
			<div class="mod_user_pop" style="padding: 10px 0px 0px; display: block;">
			    <input type="hidden" id="oldUserName" name="oldUserName" value="万相19382753">
			    <p><label>当前用户名：</label>${user }</p>
			    <p>
			        <label>新用户名：</label><input name="newUserName" id="newUserName" type="text" class="ipt_txt" onblur="simpleCheck()" maxlength="30">
			        <span class="tips_warn mar_left10" id="newUserNameTip" style="display:none";>
			        	<i class="tips_error_icon"></i>
			        	请输入用户名
			        </span>
			        <span class="per_tips"><i class="user_tips_icon"></i>用户名可用来登陆，只能修改一次哦~</span>
			    </p>
			    <p class="address_btn_box per_btn_box">
			        <a href="javascript:;" class="btn_yel">保存</a>
			        <a href="javascript:;" class="btn_cal">取消</a>
			    </p>
			</div>
		</div>       
	</div>       
	<div class="dialog-footer" data-btn="btns"></div>    
</div>
</div>
<div class="newmember_main">
<!-- 会员中心左边菜单部分 -->
<jsp:include  page="userInfo_left.jsp" flush="true"/>
 
<div class="newmember_rightside">
        <div class="mod_box">
            <div class="mod_content p20_4">
                <div class="password_edit_title">
                    <h4>个人信息
                    </h4>
                </div>
                <div class="per_info_content clearfix">
                    <a href="headSet" class="user_head fl">
                        <img src="${hair }" width="130" height="130">
                        <p class="mod_photo">修改头像</p>
                    </a>

                    <div class="per_right_box">
                        <p class="clearfix"><label><em>*</em>用户名：</label>${user }
                        		<input type="hidden" value="${user }" id="oldname">
                                <a id="editUserNameId" class="per_mod mar_left10" href="#" >修改</a>
                        </p>

                        <p class="clearfix"><label>真实姓名：</label><input type="text" class="ipt_txt" maxlength="20" id="realName" value="${userinfo.realname }">
                            <span class="gray99">请填写真实姓名</span>
                        </p>
                        <p class="clearfix">
                            <label><em>*</em>手机号：</label>
                            	<span id="phonereplace">${userinfo.iphone }</span>
                            <a href="phone_update_1" class="per_mod mar_left10">修改</a>
                        </p>
                        <c:if test="${userinfo.email !=null }">
                        	<p class="col9 clearfix"><label><em>*</em>电子邮箱：</label>
		                        <span class="mod_tel mar_right10" id="emailreplace">
		                        	${userinfo.email }
		                        </span><a href="email_add" class="per_mod mar_right10">修改</a>
	                        </p>
                        </c:if>
                        <c:if test="${userinfo.email ==null }">
                        	<p class="col9 clearfix"><label><em>*</em>电子邮箱：</label>
		                        <span class="mod_tel mar_right10">
		                        	未绑定邮箱
		                        </span><a href="email_add" class="per_mod mar_right10">修改</a>
	                        </p>
                        </c:if>
                        <p class="clearfix"><label>性别：</label><span class="ipt_rad">
                        <input type="radio" name="gender" value="男" checked="checked">男</span>
                        <span class="ipt_rad">
                        <input type="radio" name="gender" value="女">女</span>
                        </p>

                        <p class="clearfix"><label>出生日期：</label>
                            <select class="mr_rit wd105" name="year" id="selYear" >
                                
                            </select>
                            <select class="mr_rit wd105" name="month" id="selMonth">
                                
                            </select>
                            <select class="mr_rit wd105" name="day" id="selDay">
                                
                            </select>
                            <span class="tips_warn" id="birthDayTip"></span>
                            <span class="per_tips">完善生日信息可获得会员"生日礼包"特权的，<a href="http://my.lvmama.com/memberClub/index.do" class="per_mod mar_left10" target="_blank">点此了解</a></span>
                        </p>
                        <p class="clearfix"><label>所在地：</label>
                            <select id="provinceId" class="mr_rit wd105">
                            </select>
                            <select class="mr_rit wd105" id="cityId" name="cityId">
                            </select>
                        </p>
                        <p class="clearfix"><label>职业：</label>
                            <span><input type="radio" name="career" value="1">学生&nbsp;</span>
                            <span><input type="radio" name="career" value="2">职员&nbsp;</span>
                            <span><input type="radio" name="career" value="3">老师&nbsp;</span>
                            <span><input type="radio" name="career" value="5">退休人员&nbsp;</span>
                            <span><input type="radio" name="career" value="4" checked="checked">自由职业者 </span>
                            <span class="gray99">获得更精准旅游推荐</span>

                        </p>

                        <p class="clearfix"><label>婚姻状态：</label><span class="ipt_rad">
                        <input type="radio" name="married" value="未婚">未婚</span><span class="ipt_rad">
                        <input type="radio" name="married" value="已婚" checked="checked">已婚</span>

                           <span class="gray99">获得更精准旅游推荐</span>
                        </p>

                        <p class="per_btn_box">
                            <a href="javascript:;" class="per_btn" id="savaPersonalInformation">保存</a>
                        </p>

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
<script type="text/javascript">
var selYear = window.document.getElementById("selYear");
var selMonth = window.document.getElementById("selMonth");
var selDay = window.document.getElementById("selDay");
// 新建一个DateSelector类的实例，将三个select对象传进去
new DateSelector(selYear, selMonth, selDay, 1995, 1, 17);
</script>
<script src="${pageContext.request.contextPath}/js/footer.js"></script>
</body>
</html>