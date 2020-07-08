<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的游记——${travelNote.title }</title>
<link rel="stylesheet" href="css/user/tricp.css" type="text/css">
<link rel="stylesheet" href="css/header_new.css">
<script src="css/user/header_trip.js"></script>
<link rel="stylesheet" href="css/tags.css" type="text/css">
<link rel="stylesheet" href="css/calendar.css">
<!-- 新登陆弹层-->
<link rel="stylesheet" href="css/poplogin.css">
<!-- 新登陆弹层-->
<link rel="stylesheet" href="css/user/view_new.css" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript">
	function setPraise(index){
		$.ajax({
			url:"addZan",
			type:"post",
			data:{
				tid:index
			},
			success:function(data){
				if(data=='true'){
					location.reload();
				}
				else if(data=='exist'){
					alert("您已经点过赞了！");
				}
				else{
					alert("点赞失败");
				}
			},
			error:function(){
				alert("点赞失败");
			}
		})
	}
</script>
</head>
<body class="lvyou_yj">
<jsp:include page="../../../head.jsp"></jsp:include>


<!-- 导航标签渲染 -->
    <!-- 头部 START -->
    <div class="e-header-warp">
        <div class="e-nav">
            <p class="e-onion">
                <a href="" title="旅游攻略首页">旅游攻略首页</a>&nbsp;>&nbsp;<a href="trip?pageNum=1" title="游记">游记</a>&nbsp;>&nbsp;[${travelNote.title }]</p>
            <p class="e-link"><a href="mywrite"><span class="e-l-send"></span>发游记</a></p>
        </div>
        <div class="e-top clearfix">
            <div class="eh-head">
                <img class="ehh-img" src="${hair }" width="76" height="76" alt=""/>
            </div>
            <div class="eh-title">
                <div class="eht-top clearfix">
                    <h1 class="eh-text">
                        ${travelNote.title }</h1>
                    <p class="nceh-tags">
                     <b class="eh-essence ">实用</b>
                     <b class="eh-essence ">精华</b>
                    </p>
                </div>
                <p class="eh-sundry">
                    <b><a class="eh-author" href="indexdo">${user }</a></b>
                    于<fmt:formatDate value="${travelNote.time }" pattern="yyyy-MM-dd" />发布
                    <i>|</i>
                    浏览${travelNote.views }次
                </p>
                <div class="eh-function clearfix">
                    <a href="javascript:;" class="ehf-button ehf-praise" id="trip_300078_zan" onclick="setPraise(${travelNote.id})">
                        <i></i><em>赞</em><b>
                        	<c:if test="${travelNote.travelLike.size()>0 }">
                        		${travelNote.travelLike.size() }
                        	</c:if>
                        	<c:if test="${travelNote.travelLike.size()==0 }">0</c:if>
                        </b>
                    </a>
                    <a href="#" class="ehf-button ehf-comment">
                        <i></i><em>评论</em><b id="trip_300078_com">0</b>
                    </a>
                    <a href="javascript:;" class="ehf-button ehf-share">
                        <i></i><em>分享</em><b></b>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- 头部 END -->
    <div class="e-body clearfix">
        <!-- 主体 START -->
        <div class="eb-main">
            <!-- 文章 START -->
            <div class="ebm-post ebm-article">
                    <!-- 第一章节 Start -->
                    <div class="ebma-chapter" id="content1">
                        <!-- <h4><span class="ebma-chapter-line"></span>上海辰山植物园</h4>
                        <div class="ebma-chapter-content js-reply-comment">
                        <p>上海的公园里，辰山植物园是我最喜欢的，尤其温室里的花卉品种繁多，每年兰花展都会去看。</p>
                        <p><img class="ncupload-img" alt="0f3fc08e-73da-4618-a9df-49ce619ef3de_720_.jpg" src="http://s1.lvjs.com.cn//uploads/pc/place2/2017-08-07/0f3fc08e-73da-4618-a9df-49ce619ef3de_720_.jpg" data-link="300078-2716760"/></p>
                        <p>　　公共交通：轨道交通9号线洞泾站换乘松江19路可到1号门，19路区间车可到2号和3号门。想先去温室的可以从2号门入园。佘山旅游度假区绿色免费巴士停靠1号门和3号门，就是班次比较少。现在还可以骑共享自行车。</p>
                        <p><img clas0s="ncupload-img" alt="cee5aa5f-9569-4120-ae2c-eb32f383370a_720_.jpg" src="http://s1.lvjs.com.cn//uploads/pc/place2/2017-08-07/cee5aa5f-9569-4120-ae2c-eb32f383370a_720_.jpg" data-link="300078-2716766"/></p>
                        <p>　　辰山植物园面积很大，分区域种植了不同季节盛开的花卉，所以每个季节都有看头（冬天外面就没什么了，但有温室），徒步逛完整个园区要大半天，1号门和温室设有餐厅，性价比一般。有老人或儿童出行可以坐观光电瓶车，省点体力，票价10元/人。</p><p><img class="ncupload-img" alt="5ccd9224-adaa-4867-8c66-ada5bea569d5_720_.jpg" src="http://s1.lvjs.com.cn//uploads/pc/place2/2017-08-07/5ccd9224-adaa-4867-8c66-ada5bea569d5_720_.jpg" data-link="300078-2716761"/></p>
                        <p>　　整个园区很规整，既有山水又有东西二湖，登山可以俯瞰整个园区，西湖东岸设有游船码头，4人座电瓶船25艘，每艘40元/小时；6人座电瓶船15艘，每艘60元/小时。每艘游船押金100元。</p><p><img class="ncupload-img" alt="d76ef01d-0b2e-40b7-9ef5-47261f4e631f_720_.jpg" src="http://s1.lvjs.com.cn//uploads/pc/place2/2017-08-07/d76ef01d-0b2e-40b7-9ef5-47261f4e631f_720_.jpg" data-link="300078-2716765"/></p><p>　　温室不仅造型美，植物种类也多，分三个区域，有热带植物、沙漠植物和珍奇物种，布展也很有艺术性。</p>
                        <p><img class="ncupload-img" alt="14362718-9a03-45db-af6e-790f47d726f5_720_.jpg" src="http://s1.lvjs.com.cn//uploads/pc/place2/2017-08-07/14362718-9a03-45db-af6e-790f47d726f5_720_.jpg" data-link="300078-2716763"/></p>
                        <p><img class="ncupload-img" alt="483e5102-bc93-416d-bed8-7c8e501fdf2f_720_.jpg" src="http://s1.lvjs.com.cn//uploads/pc/place2/2017-08-07/483e5102-bc93-416d-bed8-7c8e501fdf2f_720_.jpg" data-link="300078-2716762"/><img class="ncupload-img" alt="6577e47c-d14e-426c-960e-e328e0cfa306_720_.jpg" src="http://s1.lvjs.com.cn//uploads/pc/place2/2017-08-07/6577e47c-d14e-426c-960e-e328e0cfa306_720_.jpg" data-link="300078-2716799"/></p>
                        <p>　　除温室之外，矿坑花园、岩石和药用植物园是我觉得很有特色的两个园区，矿坑花园地质特殊，瀑布不知道是不是人工的，不过落差很大，挺有气势。矿坑沿湖的栈道也值得走一走。</p><p><img class="ncupload-img" alt="e7c1709a-ba5c-4824-b409-1ac4268aec7c_720_.jpg" src="http://s1.lvjs.com.cn//uploads/pc/place2/2017-08-07/e7c1709a-ba5c-4824-b409-1ac4268aec7c_720_.jpg" data-link="300078-2716779"/></p><p>　　夏季王莲池、水生植物园、湿生植物园也很漂亮。作为植物园，种类和科普性很强，五星推荐。</p>
                        <p><img class="ncupload-img" alt="04acab3e-8d56-4ea8-9188-780fe92fdeb6_720_.jpg" src="http://s1.lvjs.com.cn//uploads/pc/place2/2017-08-07/04acab3e-8d56-4ea8-9188-780fe92fdeb6_720_.jpg" data-link="300078-2716798"/></p> -->
                        	<p>${travelNote.content }</p>
                        </div>
                    </div>
            <!-- 文章 END -->
            <!-- 提到的景点 START-->
                            <div class="mentioned-attractions">
                    <span class="mentioned-tags">这篇游记中提到景点</span>
                    <p>                                                                              </p>
                </div>
        	</div>
        <!-- 主体 END -->
        <!-- 边栏 START -->
        <!-- 边栏 END -->
    </div>
<!--顶部 END-->
<script src="js/footer.js"></script>
</body>
</html>