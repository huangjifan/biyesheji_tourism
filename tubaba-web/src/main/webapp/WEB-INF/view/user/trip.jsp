<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>兔爸爸：会赚钱的新游记</title>
<link rel="stylesheet" href="css/tags.css" type="text/css">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<link rel="stylesheet" href="css/calendar.css">
<link rel="css/tricp.css" type="text/css">
<!-- 新登陆弹层-->
<link rel="stylesheet" href="css/poplogin.css">
</head>
<body class="lvyou_yj">
<!-- 首屏banner+旅游者福利 -->
<!-- 导航标签渲染 -->
<link rel="stylesheet" href="http://pic.lvmama.com/min/index.php?f=/styles/v6/header_new.css,/styles/v6/public/base.css" >
<link rel="stylesheet" href="http://pic.lvmama.com/styles/you/lc.css">
<link rel="stylesheet" href="http://pic.lvmama.com/styles/you/youji2.2/lvyou_index.css" type="text/css">
<jsp:include page="../../../head.jsp"></jsp:include>
<!-- 顶部导航 结束 -->
<!-- 旅游分类和旅游攻略 结束 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/head.js"></script>
<div class="banner-wrap">
    <div class="w1200 bc">
        <!-- 首屏banner -->
        <div class="banner_box1 js_banner1">
            <div class="banner_list_box">
                <script type="text/javascript" id="ads_27_41_79">
                    channel_id = "27";
                    place_id = "41";
                    dest_id = "79";
                    adsShow(channel_id ,place_id ,dest_id );
                </script>
            <ul class="banner_list" id="js_allyes_2" style="width: 7200px; left: -3227.87px;"><li><a href="http://www.lvmama.com/trip/show/334112" target="_blank" onclick="cmCreateElementTag('PC_广告系统_ONCLICK','27_41_79_1768')" hidefocus="false"><img width="1200" height="325" src="http://pic.lvmama.com/uploads/pc/place2/2018-11-09/3107a436-ac59-4129-85c5-f32f633d45c5.jpg"></a></li><li><a href="http://www.lvmama.com/trip/zt/i/xiaomoxiangji" target="_blank" onclick="cmCreateElementTag('PC_广告系统_ONCLICK','27_41_79_1783')" hidefocus="false"><img width="1200" height="325" src="http://pic.lvmama.com/uploads/pc/place2/2018-11-13/ad691e96-3a05-41eb-af48-478c6379a8bc.jpg"></a></li><li><a href="http://www.lvmama.com/trip/show/318551" target="_blank" onclick="cmCreateElementTag('PC_广告系统_ONCLICK','27_41_79_1791')" hidefocus="false"><img width="1200" height="325" src="http://pic.lvmama.com/uploads/pc/place2/2018-11-14/166e112e-a114-4aff-ae0f-e1aa79c1d882.jpg"></a></li><li><a href="http://www.lvmama.com/trip/show/850648" target="_blank" onclick="cmCreateElementTag('PC_广告系统_ONCLICK','27_41_79_1782')" hidefocus="false"><img width="1200" height="325" src="http://pic.lvmama.com/uploads/pc/place2/2018-11-13/366cff6e-1a7e-4857-844f-4457b8ecac02.jpg"></a></li><li><a href="http://www.lvmama.com/trip/show/850512" target="_blank" onclick="cmCreateElementTag('PC_广告系统_ONCLICK','27_41_79_1775')" hidefocus="false"><img width="1200" height="325" src="http://pic.lvmama.com/uploads/pc/place2/2018-11-12/63c36ca5-f517-426c-94a7-6ca53cdab888.jpg"></a></li><li><a href="http://www.lvmama.com/trip/show/334112" target="_blank" onclick="cmCreateElementTag('PC_广告系统_ONCLICK','27_41_79_1768')" hidefocus="false"><img width="1200" height="325" src="http://pic.lvmama.com/uploads/pc/place2/2018-11-09/3107a436-ac59-4129-85c5-f32f633d45c5.jpg"></a></li></ul></div>
            <ul class="banner_tab">
            <li class=""><span></span></li><li class=""><span></span></li><li class="active"><span></span></li><li class=""><span></span></li><li class=""><span></span></li></ul>
            <span class="btn_l"></span>
            <span class="btn_r"></span>
        </div>
        <!-- 首屏banner 结束-->
        <div class="lvyou-welfare">
            <dl>
                <dt>驴行者福利<i></i><em class="tip-icon-small tip-icon-arrow"></em></dt>
                <dd><i class="tip-icon-big tip-icon-welfare tip-icon-free"></i>免费旅行</dd>
                <dd><i class="tip-icon-big tip-icon-welfare tip-icon-payment"></i>丰厚稿酬</dd>
                <dd><i class="tip-icon-big tip-icon-welfare tip-icon-wifi"></i>免费Wi-Fi</dd>
                <dd><i class="tip-icon-big tip-icon-welfare tip-icon-salon"></i>沙龙聚会</dd>
                <dd><i class="tip-icon-big tip-icon-welfare tip-icon-blog"></i>微博认证</dd>
                <dd style="border-right: 0px;"><i class="tip-icon-big tip-icon-welfare tip-icon-gift"></i>邀请有礼</dd>
            </dl>
                    </div>
    </div>
</div>
<!-- 上面的代码先不要动 -->
<!-- 首屏banner+旅游者福利 结束-->
<div class="lvyou-content mt30 clearfix">
    <!-- 左侧内容区 -->
    <div class="lvyou-content-left">
        <!-- 驴行者聚好玩推荐 -->
        <div class="youji-mobel">
            <h4>驴行者聚好玩推荐<a href="mywrite" title="" target="_blank">写游记<i class="tip-icon-small tip-icon-sangle"></i></a></h4>
            <ul class="clearfix poly-fun-recommend">
            	<c:forEach items="${recommend }" var="recommendlist">
	                <li>
	                    <a href="travelNote?tid=${recommendlist.id }" class="youji-mobel-img" target="_blank">
	                    	<c:if test="${recommendlist.coverimg !=null }">
	                    		<img src="${recommendlist.coverimg }" width="460" height="230">
	                    	</c:if>
	                        <c:if test="${recommendlist.coverimg==null }">
	                        	<img src="image/default.jpg" width="460" height="230">
	                        </c:if>
	                    </a>
	                    <div class="poly-fun-word">
	                        <a href="travelNote?tid=${recommendlist.id }" title="" class="poly-fun-word-title" target="_blank">${recommendlist.title }</a>
	                        <p class="poly-fun-word-prograph"> 
		                        <c:forEach items="${fn:split(fn:substring(fn:replace(fn:substringAfter(recommendlist.content, '<'),'&nbsp;', ''),0, 100), '<')}" var="artext">
								 	${fn:replace(fn:substringAfter(artext, '>'), searchCondtion, keywords)}
								</c:forEach>...
							</p>
	                    </div>
	                </li>
                </c:forEach>
            </ul>
        </div>
        <!-- 驴行者聚好玩推荐 end-->
        <!-- 精华游记 -->
        <div class="youji-mobel js-tab">
            <h4 class="essence-travels js-tab-nav">精华游记
                <span id="youji1" class="tip-icon-small tip-icon-youji1 active"></span>
                <span id="youji2" class="tip-icon-small tip-icon-youji2"></span>
                <a class="essence-travels-quest" target="_blank" href="audit" hidefocus="false">游记审核新标准，什么是精华游记？</a>
            </h4>
            <!-- 精华游记内容 -->
            <div class="wy_state_model" id="trip_info">
                <div class="wy_countryHot">
                    <!-- 精华游记的第一种样式 -->
                    <div id="trip_1" class="countryBox country-box js-tab-con" style="display: block;">
                        <ul class="country-box-one">
                         <c:forEach items="${travelList }" var="list">
                              <li>
                                    <dl>
                                        <dt>
                                            <a href="travelNote?tid=${list.id }" hidefocus="false" target="_blank">
                                            	<c:if test="${list.coverimg !=null }">
                                            		<img src="${list.coverimg }" width="229" height="152">
                                            	</c:if>
                                            	<c:if test="${list.coverimg == null }">
                                            		<img src="image/default.jpg" width="229" height="152">
                                            	</c:if>
                                            </a>
                                        </dt>
                                        <dd>
                                            <div class="title"><a href="travelNote?tid=${list.id }" hidefocus="false" target="_blank">${list.title }</a><span>精华</span></div>
                                            <p class="uploadInfo"><i class="icon icon_user"></i><a href="javascript:;">
                                            	<c:if test="${list.user.size()>0}">
                                            		<c:forEach items="${list.user }" var="user">
                                            			${user.username }
                                            		</c:forEach>
                                            		
                                            	</c:if>
                                            </a><span>|</span><fmt:formatDate value="${list.time }" pattern="yyyy-MM-dd"/>发布</p>
                                            <p class="tripTxt"><span>游记简述：</span><span id="content">
                                            	 <c:forEach items="${fn:split(fn:substring(fn:replace(fn:substringAfter(list.content, '<'),'&nbsp;', ''),0, 200), '<')}" var="artext">
												 	${fn:replace(fn:substringAfter(artext, '>'), searchCondtion, keywords)}
												 </c:forEach>...
                                            </span></p>
                                            <p class="tripViews active">
                                                <a hidefocus="false"><i class="icon icon_view"></i>${list.views }</a>
                                                <a hidefocus="false"><i class="icon icon_commit"></i>0</a>
                                                本篇文章驴游宝收益0.00元</p>
                                            <div class="iLike">
                                                <i id="trip_850481_zan" class="iconBig icon_like nlogin" onclick="setPraise(${list.id})"></i>
                                                <p>
	                                                <span id="zannum${list.id }">
		                                                <c:if test="${list.travelLike.size()>0 }">
			            									${list.travelLike.size() }
				            							</c:if>
				            							<c:if test="${list.travelLike.size()==0 }">
				            								0
				            							</c:if>
			            							</span>
			            							<span style="color:red; display: none;" id="zan${list.id }">已点赞</span>
		            							</p>
                                                <div class="addone">+1</div>
                                            </div>
                                        </dd>
                                    </dl>
                                </li>
                                </c:forEach>
                       </ul>
                        <!--分页开始-->
                        <div class="nchcps_page">
                        	<c:choose>
								<c:when test="${travelList.getPageNum() == 1 }">
									<a href="#" title="上一页" class="PrevPage">上一页</a>
								</c:when>
								<c:otherwise>
									<a href="trip?pageNum=${travelList.getPageNum() - 1 }" title="上一页" class="PrevPage">上一页</a>
								</c:otherwise>
							</c:choose>
							<c:forEach begin="1" end="${travelList.getPages() }" varStatus="index">
								<c:choose>
									<c:when test="${travelList.getPageNum() == index.index }">
										<a class="currentpage">${index.index }</a>
									</c:when>
									<c:otherwise>
										<a href="trip?pageNum=${index.index }" class="PageLink" title="第 ${index.index }页">${index.index }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${travelList.getPageNum() == travelList.getPages() }">
									<a href="#" title="下一页" class="NextPage">下一页</a><br>
								</c:when>
								<c:otherwise>
									<a href="trip?pageNum=${travelList.getPageNum() + 1 }" title="下一页" class="NextPage">下一页</a><br>
								</c:otherwise>
							</c:choose>
                        </div>
                        <!--分页结束-->
                    </div>
                    <!-- 精华游记的第二种样式 end-->
                </div>
            </div>
            <!-- 精华游记内容 end-->
        </div>
        <!-- 精华游记 end -->
    </div>
    <!-- 左侧内容区 end-->
    
</div>
<!-- 1200*80图片 -->

<!-- 如何出现这里弹层 end-->

<script src="http://pic.lvmama.com/js/you/js/you_footer.js"></script>
<script type="text/javascript">
	$(function(){
		setTimeout('content()', 2000);
	})
	function setPraise(index){
		$.ajax({
			url:"addZan",
			type:"post",
			data:{
				tid:index
			},
			success:function(data){
				if(data=='true'){
					var one=$("#zannum"+index).text();
					var two=parseInt(one);
					$("#zannum"+index).text(two+1)
				}
				else if(data=='exist'){
					$("#zan"+index).show();
					$("#zannum"+index).hide();
					setTimeout("hideDiv("+index+")",1000)
				}
				else{
					alert("点赞失败");
				}
			},
			error:function(){
				alert("请登录");
			}
		})
	}
	function hideDiv(index){
		$("#zan"+index).hide();
		$("#zannum"+index).show();
	}
</script>
</body>
</html>