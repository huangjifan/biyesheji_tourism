<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的收藏-驴妈妈旅游网</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/button.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/tags.css" >
<link href="${pageContext.request.contextPath}/css/header-air.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/ui-componentsTwo.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/ui-lvmama.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/ui-components.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/lv-bought.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/global_pop.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/lv-user-mytrip.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/newmember.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/newcommon.css" >
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/integral.css" >
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user/indexdo.js"></script>
<style type="text/css">
	.one{
		display: none;
	}
</style>
<script type="text/javascript">
	$(function(){
		var type='${requestScope.type}';
		var ul = $('ul[class="fav-tab"]');
		if(type=="activity"){
			ul.find('li').eq(4).addClass('active');
		}else if(type=="scenic"){
			ul.find('li').eq(1).addClass('active');
		}else if(type=="scenicway"){
			ul.find('li').eq(2).addClass('active');
		}else if(type=="hotel"){
			ul.find('li').eq(3).addClass('active');
		}else{
			ul.find('li').eq(0).addClass('active');
		}
	})
	 function removeCheck(obj){
		var ul = $('div[class="js_con"]').find('ul');
		var lis = ul.find('li');
		if($(obj).text() == '批量管理'){
			$(obj).text('完成');
			$('div[class="favorite_action_operation"]').show();
			ul.removeClass('js-fav-hover');
			lis.addClass('js-fav-select');
		}else{
			$(obj).text('批量管理');
			$('div[class="favorite_action_operation"]').hide();
			ul.addClass('js-fav-hover');
			lis.removeClass('js-fav-select');
		}
	} 
	function remove(){
		var param = $('div.dialog').attr('param');
		$.ajax({
			url:'${pageContext.request.contextPath}/removeCollect',
			type:'post',
			data:'param='+param,
			async:false, 
			success:function(result){
				if(result == true){
					cancel();
					window.location.reload();
				}
			}
		}) 
	}
	function cancel(){
		$('div.overlay').hide();
		$('div.dialog').hide();
		$('div.dialog-header').text('');
		$('div.dialog-content').text('');
		$('div.dialog-footer').empty();
	}
	function removes(){
		var li = $('li.js-fav-action');
		if(li.length > 0){
			$('div.overlay').show();
			$('div.dialog').show().css('z-index','4014').css('position','fixed').css('top','20%').css('left','35%');
			$('div.dialog-header').text('消息提醒');
			$('div.dialog-content').text('您确认删除所选收藏吗？');
			$('div.dialog-footer').append('<button class="pbtn pbtn-small" onclick="removesCheck()">确定</button>').append('<button class="pbtn pbtn-small" onclick="cancel()">取消</button>');
		}else{
			$('div.overlay').show();
			$('div.dialog').show().css('z-index','4014').css('position','fixed').css('top','20%').css('left','35%');
			$('div.dialog-header').text('消息提醒');
			$('div.dialog-content').text('请选中您要删除的产品。');
			$('div.dialog-footer').append('<button class="pbtn pbtn-small" onclick="cancel()">确定</button>');
		}
	}
	function removesCheck(){
		var li = $('li.js-fav-action');
		var param = '';
		for(var i = 0 ; i < li.length ; i ++){
			param += $(li[i]).find('input[type="hidden"]').eq(1).val() + '-' + $(li[i]).find('input[type="hidden"]').eq(0).val() + "#";
		}
		if(param != ''){
			param = param.substring(0,param.length-1);
		}
		cancel();
		$.ajax({
			url:'${pageContext.request.contextPath}/removeCollect',
			type:'post',
			data:'param='+param,
			async:false, 
			success:function(result){
				if(result == true){
					window.location.reload();
				}
			}
		}) 
	}
	var flag = false;
	function check(obj){
		if(flag){
			flag = false;
			var param = $(obj).prev().val() + '-' + $(obj).prev().prev().val();
			$('div.overlay').show();
			$('div.dialog').show().css('z-index','4014').css('position','fixed').css('top','20%').css('left','35%').attr('param',param);
			$('div.dialog-header').text('消息提醒');
			$('div.dialog-content').text('您确认删除该条收藏吗？');
			$('div.dialog-footer').append('<button class="pbtn pbtn-small" onclick="remove()">确定</button>').append('<button class="pbtn pbtn-small" onclick="cancel()">取消</button>');
			return false;
		}
		if($('div[class="favorite_action_operation"]').css('display') == 'none'){
			return true;
		}
		var li = $(obj).parent();
		if(li.hasClass('js-fav-action')){
			li.removeClass('js-fav-action');
			$('#del_checked_num').text(parseInt($('#del_checked_num').text()) - 1);
		}else{
			li.addClass('js-fav-action');
			$('#del_checked_num').text(parseInt($('#del_checked_num').text()) + 1);
		}
		return false;
	}
	function checks(obj){
		var li = $('div[class="js_con"]').find('ul').find('li');
		if($(obj).is(':checked')){
			li.addClass('js-fav-action');
			$('#del_checked_num').text(li.length);
		}else{
			li.removeClass('js-fav-action');
			$('#del_checked_num').text(0);
		}
		
	}
</script>
</head>
<body class = "lv_newhome lvnav_collection">
<div data-mask="overlay" class="overlay" style="z-index: 3999; display: none;"></div>
<div class="dialog" style="display: none;">    
	<div class="dialog-inner clearfix">        
		<a class="dialog-close" data-dismiss="dialog" onclick="cancel()">×</a>        
		<div class="dialog-header" data-title="title"></div>        
		<div class="dialog-body" style="">            
			<div class="dialog-content clearfix" data-content="content"></div>        
		</div>        
		<div class="dialog-footer" data-btn="btns"></div>    
	</div>
</div>
<div id="wrap" class="ui-container lvmama-bg">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<!---会员中心导航结束--->
<div class="newmember_main">
	<!--我的收藏－左则菜单-->
<!-- 会员中心左侧菜单栏 -->
<jsp:include page="myPageLeft.jsp" flush="true" />

	<!--我的收藏－右则内容-->
    <div class="newmember_rightside">
    	<div class="mod_box shadow_down">
            <div class="mod_content p20_4">
            	<div class="password_edit_title">
                  <a href="#" class="fav-bat-btn fr" onclick="removeCheck(this)">批量管理</a>
            	  <h4>我的收藏</h4>
                  <div class="favorite_action_operation">
                  <label><input type="checkbox" class="js_check_all" onchange="checks(this)">全选</label>
                  <a href="#" onclick="removes()" class="fav-dele-btn">删除（<span id="del_checked_num">0</span>）</a>
                  </div>
                </div>
                
                <div class="integral_content">
                    <ul class="fav-tab">
                        <li>
                        	<a href="${pageContext.request.contextPath}/myCollect/all/1">全部(${collectAllCount })</a>
                        	<i class="conmon_icon icon-up"></i>
                        </li>
                        <li>
                        	<a href="${pageContext.request.contextPath}/myCollect/scenic/1">门票(${scenidCollectCount })</a>
                        	<i class="conmon_icon icon-up"></i>
                        </li>
                        <li>
                        	<a href="${pageContext.request.contextPath}/myCollect/scenicway/1">旅游线路(${scenidwayCollectCount })</a>
                        	<i class="conmon_icon icon-up"></i>
                        </li>
                        <li>
                        	<a href="${pageContext.request.contextPath}/myCollect/hotel/1">酒店(${hotelCollectCount })</a>
                        	<i class="conmon_icon icon-up"></i>
                        </li>
                        <li>
                        	<a href="${pageContext.request.contextPath}/myCollect/activity/1">特卖(${activityCollectCount })</a>
                        	<i class="conmon_icon icon-up"></i>
                        </li>
                    </ul>
                    <div class="js_con" style="display:block">
                   			<c:if test="${pageList.getTotal() > 0}"><!-- 判断是否有收藏 -->
                   				<ul class="fav-content js-fav-hover clearfix ">
                   				
                   					<c:forEach  items="${pageList.listIterator() }" var="collect">
                   						<c:choose>
                   							<c:when test="${!empty collect.scenic }"><!-- 判断是不是景点 -->
                   								<li id="14286549">
					                            	<input type="hidden" value="scenic">
					                            	<input type="hidden" value="${collect.scenic.id }">
					                                <a href="${pageContext.request.contextPath}/scenic?id=${collect.scenic.id }&&pageIndex=0" target="_blank" onclick="return check(this)" class="fav-content-img">
					                                    <c:if test="${type != 'scenic' }">
					                                    	<i class="fav-content-icon fav-tick">门票</i>
					                                    </c:if>
					                                    <i class="conmon_icon icon-checkbox" ></i>
					                                    <span class="fav-dele commonFilter">
					                                        <i class="conmon_icon" onclick="flag=true"></i>
					                                    </span>
					                                    <img src="${pageContext.request.contextPath}/${collect.scenic.coverImage}" width="228" height="152">
					                                </a>
					                                <div class="fav-cotent-box">
					                                    <p class="fav-cotent-txt">
					                                    	<a href="http://www.lvmama.com/tuangou/deal-v14286549" target="_blank" title="${collect.scenic.introduce }">${collect.scenic.introduce }</a>
					                                    </p>
														<p class="fav-cotent-date ellipsis"></p>
					                                    <div class="fav-price-box">
					                                        <p class="fav-price"><em>¥</em>${collect.scenic.floor_price }<span>起</span></p>
					                                    </div>
					                                </div>
					                            </li>
                   							</c:when>
                   							 <c:when test="${!empty collect.scenicway }"><!-- 判断是不是路线 -->
                   								<li id="14286549">
					                            	<input type="hidden" value="scenicway">
					                            	<input type="hidden" value="${collect.scenicway.id }">
					                                <a href="${pageContext.request.contextPath}/scenicway/tourRouteProductShow/${collect.scenicway.id }" onclick="return check(this)" target="_blank" class="fav-content-img">
					                                    <c:if test="${type != 'scenicway' }">
					                                    	<i class="fav-content-icon fav-line">旅游线路</i>
					                                    </c:if>
					                                   
					                                    <c:if test="${type == 'scenicway' }">
					                                    	<c:if test=" ${!empty collect.scenicway.attractions }">
					                                    		<i class="fav-content-icon fav-line">${collect.scenicway.attractions.atrtitle }</i>
					                                    	</c:if>
					                                    </c:if>
					                                    <i class="conmon_icon icon-checkbox" ></i>
					                                    <span class="fav-dele commonFilter">
					                                        <i class="conmon_icon" onclick="flag=true"></i>
					                                    </span>
					                                    <img src="${pageContext.request.contextPath}/${collect.scenicway.scenicwayImage }" width="228" height="152">
					                                </a>
					                                <div class="fav-cotent-box">
					                                    <p class="fav-cotent-txt">
					                                    	<a href="http://www.lvmama.com/tuangou/deal-v14286549" target="_blank" title="${collect.scenicway.description }">${collect.scenicway.description }</a>
					                                    </p>
														<p class="fav-cotent-date ellipsis"></p>
					                                    <div class="fav-price-box">
					                                        <p class="fav-price"><em>¥</em>${collect.scenicway.floor_price }<span>起</span></p>
					                                    </div>
					                                </div>
					                            </li>
                   							</c:when>
                   							<c:when test="${!empty collect.hotel }"><!-- 判断是不是酒店 -->
                   								<li id="14286549">
					                            	<input type="hidden" value="hotel">
					                            	<input type="hidden" value="${collect.hotel.id }">
					                                <a href="http://www.lvmama.com/tuangou/deal-v14286549" onclick="return check(this)" target="_blank" class="fav-content-img">
					                                    <c:if test="${type != 'hotel' }">
					                                    	<i class="fav-content-icon fav-hotel">酒店</i>
					                                    </c:if>
					                                    <i class="conmon_icon icon-checkbox" ></i>
					                                    <span class="fav-dele commonFilter">
					                                        <i class="conmon_icon" onclick="flag=true"></i>
					                                    </span>
					                                    <img src="http://pic.lvmama.com/uploads/pc/place2/2017-04-25/28871d6d-8239-485c-a5ac-e0ed50dd24b6_228_152.jpg" width="228" height="152">
					                                </a>
					                                <div class="fav-cotent-box">
					                                    <p class="fav-cotent-txt">
					                                    	<a href="http://www.lvmama.com/tuangou/deal-v14286549" target="_blank" title="${collect.hotel.name }">${collect.hotel.name }</a>
					                                    </p>
														<p class="fav-cotent-date ellipsis"></p>
					                                    <div class="fav-price-box">
					                                        <p class="fav-price"><em>¥</em>${collect.hotel.floor_price }<span>起</span></p>
					                                    </div>
					                                </div>
					                            </li>
                   							</c:when>
                   						</c:choose>
                   					</c:forEach>
	                        	</ul>
	                        	<div class="page_box mart20">
									<div id="pages_" class="pages" style="null"> 
										<div id="lv_page"><div class="Pages">
											<c:choose>
												<c:when test="${pageList.getPageNum() == 1 }">
													<a href="#" title="上一页" class="PrevPage">上一页</a>
												</c:when>
												<c:otherwise>
													<a href="${pageContext.request.contextPath}/myCollect/${type }/${pageList.getPageNum() - 1 }" title="上一页" class="PrevPage">上一页</a>
												</c:otherwise>
											</c:choose>
											<c:forEach begin="1" end="${pageList.getPages() }" varStatus="index">
												<c:choose>
													<c:when test="${pageList.getPageNum() == index.index }">
														<span class="PageSel">${index.index }</span>
													</c:when>
													<c:otherwise>
														<a href="${pageContext.request.contextPath}/myCollect/${type }/${index.index }" class="PageLink" title="第 ${index.index }页">${index.index }</a>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											<c:choose>
												<c:when test="${pageList.getPageNum() == pageList.getPages() }">
													<a href="#" title="下一页" class="NextPage">下一页</a><br>
												</c:when>
												<c:otherwise>
													<a href="${pageContext.request.contextPath}/myCollect/${type }/${pageList.getPageNum() + 1 }" title="下一页" class="NextPage">下一页</a><br>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>							
								</div>
                   			</c:if>
                   			<c:if test="${pageList.getTotal() == 0}">
                   				<div class="cashBox">
			                      <span class="fl">
			                         <img src="${pageContext.request.contextPath}/image/lv_no.png" width="100" height="100">
			                      </span>
			                      <div class="nomyRecordm" >
			                      		<c:choose>
			                      			<c:when test="${type == 'all' }">
			                      				<p class="cashTitle noMargin">暂无收藏~</p>
			                      			</c:when>
			                      			<c:when test="${type == 'scenic' }">
			                      				<p class="cashTitle noMargin">暂无门票类产品收藏~</p>
			                      			</c:when>
			                      			<c:when test="${type == 'scenicway' }">
			                      				<p class="cashTitle noMargin">暂无线路类产品收藏~</p>
			                      			</c:when>
			                      			<c:when test="${type == 'hotel' }">
			                      				<p class="cashTitle noMargin">暂无酒店类产品收藏~</p>
			                      			</c:when>
			                      			<c:when test="${type == 'activity' }">
			                      				<p class="cashTitle noMargin">暂无特卖类产品收藏~</p>
			                      			</c:when>
			                      		</c:choose>
			                            <p class="cashHelp"><a href="" class="mart10 nomywriteBtn">去看看</a></p>
			                      </div>
			                    </div>
                   			</c:if>
                   			
							
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>

<!--右侧帮助中心-->
<div class="hr_b"></div>
</div>
<script src="${pageContext.request.contextPath}/js/footer.js"></script>
</body>

</html>