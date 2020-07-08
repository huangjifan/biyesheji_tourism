<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的驴妈妈-驴妈妈旅游网</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
<link rel="stylesheet" href="css/tags.css" >
<link href="css/header-air.css" rel="stylesheet"/>
<link href="css/ui-lvmama.css" rel="stylesheet" />
<link rel="stylesheet" href="css/buttons.css">
<link href="css/ui-components.css" rel="stylesheet" />
<link href="css/lv-bought.css" rel="stylesheet" />
<link rel="stylesheet" href="css/global_pop.css">
<link href="css/ui-components.css" rel="stylesheet" />
<link rel="stylesheet" href="css/lv-user-mytrip.css">
<link rel="stylesheet" href="css/newmember.css" >
<link rel="stylesheet" href="css/tip.css" >
<link rel="stylesheet" href="css/newcommon.css" >
<link rel="stylesheet" href="css/integral.css" >
<link rel="stylesheet" href="css/order-v1.css" />
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/user/indexdo.js"></script>
<style type="text/css">
	.one{
		display: none;
	}
</style>
<script type="text/javascript">
$(function(){
	var phone = $('#phone').text();
	phone = plusXing(phone,3,4,'*');
	$('#phone').text(phone);
})
</script>
</head>
<body  class="lv_newhome">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<!---会员中心导航结束--->

<!---会员中心页面开始--->
<div class="newmember_main">
    <!-- 会员中心左边菜单部分 -->
<!-- 会员中心左侧菜单栏 -->
<jsp:include page="myPageLeft.jsp" flush="true" />

    <!-- 会员中心右侧主体部分 -->
    <div class="newmember_rightside">
        <!--用户中心开始--->
        <div class="newmember_box_bg">
            <a href=headSet class="user_head mart40 fl">
                <img src="${userStatus.hair }" width="130" height="130">
                <p class="mod_photo">修改头像</p>
            </a>
            <ul class="user_cotent databox fl">
                <!-- 头像、等级、手机等基本信息 -->
                <li class="clearfix">
                    <h4>
                        <a class="newnickname" title="${users.username }">${users.username }</a>
                        <a href="" hidefocus="false">
                       <!--  <i class="user_grade_Icon user_head_v1"></i> -->
                        <c:choose>
				        	<c:when test="${users.integral >= list.get(4).minIntegral }"><i class="user_grade_Icon user_head_v6"></i></c:when>
				        	<c:when test="${users.integral >= list.get(3).minIntegral }"><i class="user_grade_Icon user_head_v5"></i></c:when>
				        	<c:when test="${users.integral >= list.get(2).minIntegral }"><i class="user_grade_Icon user_head_v4"></i></c:when>
				        	<c:when test="${users.integral >= list.get(1).minIntegral }"><i class="user_grade_Icon user_head_v3"></i></c:when>
				        	<c:when test="${users.integral >= list.get(0).minIntegral }"><i class="user_grade_Icon user_head_v2"></i></c:when>
				        	<c:otherwise><i class="user_grade_Icon user_head_v1"></i></c:otherwise>
				        </c:choose>
                        </a>
                        <a href="Personal_information" class="marL10 a_blue">个人信息</a>
                    </h4>

						<span class="mod_tel"><i class="modtel_icon"></i>已绑定手机:<em id="phone">${users.iphone }</em><a href="phone_update_1">修改手机</a></span>
                </li>

                <!-- 会员完善进度 -->
                <li class="clearfix ">
                    <p class="progress-bar-bg fl">
                        <span class="bar-box" style="width:${schedule }%">${schedule }%</span>
                    </p>
                    <a href="Personal_information" class="a-link">立即完善</a>
                </li>


                <!-- 我的特权信息 -->
                <li class="clearfix">
                    <em class="mytq fl">我的特权</em>

                    <div class="marL10 fl">
                         <a title="专属活动"><i
                         class="user_grade_Icon user_icon_hot"></i></a>
                        <c:if test="${users.integral >= list.get(0).minIntegral }">
                		 <a title="生日礼包"><i
                                class="user_grade_Icon user_icon_mary"></i></a>
	                	</c:if>
	                	<c:if test="${users.integral < list.get(0).minIntegral }">
	                		 <a title="生日礼包"><i
                                class="user_grade_Icon dis_user_icon_mary"></i></a>
	                	</c:if>
	                	<c:if test="${users.integral >= list.get(1).minIntegral }">
	                		 <a title="等级优惠券"><i
                                class="user_grade_Icon user_icon_cash"></i></a>
	                	</c:if>
	                	<c:if test="${users.integral < list.get(1).minIntegral }">
	                		 <a title="等级优惠券"><i
                                class="user_grade_Icon dis_user_icon_cash"></i></a>
	                	</c:if>
	                	<c:if test="${users.integral >= list.get(2).minIntegral }">
	                		 <a title="等级专享价"><i
                                class="user_grade_Icon user_icon_gift"></i></a>
	                	</c:if>
	                	<c:if test="${users.integral < list.get(2).minIntegral }">
	                		<a title="等级专享价"><i
                                class="user_grade_Icon dis_user_icon_gift"></i></a>
	                	</c:if>
	                	<c:if test="${users.integral >= list.get(3).minIntegral }">
	                		<a title="邮轮优先登船"><i
                                class="user_grade_Icon user_icon_ship"></i></a>
	                	</c:if>
	                	<c:if test="${users.integral < list.get(3).minIntegral }">
	                		<a title="邮轮优先登船"><i
                                class="user_grade_Icon dis_user_icon_ship"></i></a>
	                	</c:if>
	                	<c:if test="${users.integral >= list.get(4).minIntegral }">
	                		 <a title="WIFI特权"><i
                                class="user_grade_Icon user_icon_wifi"></i></a>
	                	</c:if>
	                	<c:if test="${users.integral < list.get(4).minIntegral }">
	                		<a title="WIFI特权"><i
                                class="user_grade_Icon dis_user_icon_wifi"></i></a>
	                	</c:if>
                    </div>
                </li>

                <!-- 支付及点评数信息 -->
                <li class="clearfix">
                    <div class="pay_box">
                        <a href="${pageContext.request.contextPath}/myAccount/0/1"><i class="icon_pay"></i>余额</a>
                        <a href="${pageContext.request.contextPath}/mySpaceCommon?type=ddp&pageNum=1"><i class="icon_commit1"></i>点评</a>
                    </div>
                </li>
            </ul>
            <!-- 会员立减专享活动，7月20号上线，活动结束后恢复点击抽奖 -->
            <!--会员成长换礼,7月18号上线-->
            <a href="javascript:;" class="daylogin fl">
            </a>
            <!-- 现金、奖金、小驴白条信息 -->
            <div class="account_box fl">
                <p>
                    <span class="alist"><i class="balance_icon"></i>账户余额</span>
                    <em class="f18">
						￥${users.money }
                    </em>
                </p>

                
            </div>

            <!---右侧弧形--->
            <i class="end_icon"></i><i class="top_icon"></i><i class="bottom_icon"></i>
        </div><!--用户中心结束--->

        <!--近期订单开始-->
        <%-- <div class="mod_box">
            <div class="mod_title">
                <a href="${pageContext.request.contextPath}/myOrder" class="mod_more">查看全部订单></a>
                <h3 class="h3_title">近期订单<span class="mod_tips"><i></i>退款申请只支持未游玩、可退改的订单。</span></h3>
            </div>
        </div> --%>
        <!--近期订单开始-->
    <div class="mod_box">
        <input type="hidden" id="bodyStyle" value="lvnav_order">
        <!-- 新下单页 -->
        <div class="order-v1-box">
            <div class="order-body-tab ">
                <ul class="order-body-list">
                    <li class="order-width270">产品信息</li>
                    <li class="order-width100">类型</li>
                            <script type="text/javascript">
	                            $(function(){
	                            	showIndentList();
	                            	$('#ulId').find('li').click(function(){
	                            		$('#ulId').find('li').removeClass('selected');
	                            		$(this).addClass('selected');
	                            		var cite = $('div.fl').find('cite');
	                            		var i = cite.find('i');
	                            		cite.text($(this).text());
	                            		cite.append(i);
	                            		$('#tableContent').empty();
	                            		var indentdetailsId = $('#tabId').find('li.active').attr('data');
	                            		showIndentList($(this).attr('id'),indentdetailsId);
	                            	})
	                            	
	                            	$('#tabId').find('li').click(function(){
	                            		$('#tableContent').empty();
	                            		$('#tabId').find('li').removeClass('active');
	                            		$(this).addClass('active');
	                            		var type = $('#ulId').find('li.selected').attr('id');
	                            		var indentdetailsId = $(this).attr('data');
	                            		showIndentList(type,indentdetailsId); 
	                            	})
	                            })
	                            function removeCheck(obj){//判断是否删除弹框
	                            	var indentstatus = $(obj).parent().parent().prev().find('div').find('span').text();
	                            	if(indentstatus == '待支付' || indentstatus == '待出行' || indentstatus == '退款中'){
	                            		var hint = '<div class="nova-dialog del-wrap-box" data-id="1541607045872" style="z-index: 1; position: fixed; top: 30%; left: 35%;" data-mask="mask">    <div class="nova-dialog-close" style="display: block;"><i onclick="closes()"></i></div>    <div class="nova-dialog-header">温馨提示</div>    <div class="nova-dialog-body">待支付、待出行，退款中等特殊情况订单不能删除，请知悉。</div>    <div class="nova-dialog-footer"><span class="btn btn-orange" onclick="closes()">确定</span></div></div>';
	                            		$('div.nova-overlay').show();
	                            		$('body').append(hint);
	                            	}else{
	                            		var hint = '<div class="nova-dialog del-wrap-box" data-id="1541607045873" style="z-index: 1; position: fixed; top: 30%; left: 35%;" data-mask="mask">    <div class="nova-dialog-close" style="display: block;"><i onclick="closes()"></i></div>    <div class="nova-dialog-header">删除订单</div>    <div class="nova-dialog-body">删除后订单记录无法还原，确定删除吗？</div>    <div class="nova-dialog-footer"><span class="btn btn-orange"  onclick="remove('+$(obj).attr('id')+',7)">确定</span><span class="btn" onclick="closes()">取消</span></div></div>';
	                            		$('div.nova-overlay').show();
	                            		$('body').append(hint);
	                            	}
	                            }
	                            function remove(id,indentstatus){//删除
	                            	$.ajax({
	                            		type:"get",
	                            		url: "updateIndentstatus",
	                        			data: {
	                        				indentId:id,
	                        				indentstatus: indentstatus,
	                        			},
	                        			success:function(result){
	                        				closes();
	                        				if(result == true){
	                        					var hint = '<div class="nova-dialog del-wrap-box" data-id="1541607045872" style="z-index: 1; position: fixed; top: 30%; left: 35%;" data-mask="mask">    <div class="nova-dialog-close" style="display: block;"><i onclick="window.location.reload()"></i></div>    <div class="nova-dialog-header">温馨提示</div>    <div class="nova-dialog-body">订单删除成功。</div>    <div class="nova-dialog-footer"><span class="btn btn-orange" onclick="window.location.reload()">确定</span></div></div>';
	    	                            		$('div.nova-overlay').show();
	    	                            		$('body').append(hint);
	                        					
	                        				}
	                        			}
	                            	})
	                            }
	                            function closes(){//关闭删除时弹出来的框
	                            	$('div.nova-dialog').remove();
	                            	$('div.nova-overlay').hide();
	                            }
	                            function toCancel(indentId){//取消订单时弹出来的框
	                            	$('div.nova-overlay').show();
	                            	$('div.cancel_wapper').show();
	                            	$('#orderIdBtn').val(indentId);
	                            }
	                            function cancel(){//取消
	                            	var input = $('input[name="itemCode"]:checked');
	                            	if(input.val() != undefined){
	                            		var vause = '';
	                            		if(input.val() == 57){
	                            			vause = input.parent().text() + '-' + input.parent().find('input[type=text]').val();
	                            		}else{
	                            			vause = input.parent().text()
	                            		}
	                            		var id = $('#orderIdBtn').val();
		                            	var indentstatus = 2;
		                            	$('div.cancel_wapper').hide();$('div.nova-overlay').hide();
		                            	$.ajax({
		                            		type:"get",
		                            		url: "updateIndentstatus",
		                        			data: {
		                        				indentId:id,
		                        				indentstatus: indentstatus,
		                        				vause:vause,
		                        			},
		                        			success:function(result){
		                        				closes();
		                        				if(result == true){
		                        					var hint = '<div class="nova-dialog del-wrap-box" data-id="1541607045872" style="z-index: 1; position: fixed; top: 30%; left: 35%;" data-mask="mask">    <div class="nova-dialog-close" style="display: block;"><i onclick="window.location.reload()"></i></div>    <div class="nova-dialog-header">温馨提示</div>    <div class="nova-dialog-body">取消订单成功。</div>    <div class="nova-dialog-footer"><span class="btn btn-orange" onclick="window.location.reload()">确定</span></div></div>';
		    	                            		$('div.nova-overlay').show();
		    	                            		$('body').append(hint);
		                        					
		                        				}
		                        			}
		                            	}) 
	                            	}
	                            	 
	                            }
	                            function payment(money,id){
	                            	let pass = prompt("你需要支付金额的是"+money+"元,请输入你的支付密码","");
				                    	console.log(pass);
				                    	var re = /^[0-9]+$/ ;
				                    	if(!re.test(pass)){
				                    		alert("只能是正整数");
				                    		return;
				                    	}
				                    	$.ajax({
				                    		url: "${pageContext.request.contextPath}/indent/paymentIndent",
				                    		type: "post",
				                    		dataType: "json",
				                    		data: {
				                    			indentId: id,
				                    			pass: pass,
				                    		},
				                    		success: function(res){
				                    			flag = res.success;
				                    			alert(res.message);
				                    			if(flag){
                        							window.location.reload();
				                    			}
				                    		}
				                    	});
	                            }
	                            function showIndentList(){
	                            	$.ajax({
	                            		type:"post",
	                            		url: "findByRecently",
	                            		dataType: "json",
	                        			success:function(result){
	                        				console.log(result);
	                        				if(result.length > 0){
	                        					for(var i = 0 ; i<result.length ; i++){
	                        						if(result[i].indentdetails != undefined && result[i].indentstatus != 7){
	                        							var name = '';
	                        							var type = '';
	                        							var indentstatus = '';
	                        							var cancel = '';
	                        							var paymeng = '';
	                        							var refund = '';
	                        							var comment = '';
	                        							var src = '';
	                        							if(result[i].indentstatus == 5){
	                        								comment = "<td class=\"order-line\" width=\"80\"><a href='javascript:;' onclick="+"attractions_add('点评','comment?intdentId="+result[i].id+"','"+result[i].id+"','800','600')"+" >点评</a></td></tr>"
	                        							}
	                        							if(result[i].indentstatus == 1){
	                        								indentstatus = '待支付';
	                        							}else if(result[i].indentstatus == 2){
	                        								indentstatus = '已取消';
	                        							}else if(result[i].indentstatus == 3){
	                        								indentstatus = '退款中';
	                        							}else if(result[i].indentstatus == 4){
	                        								indentstatus = '已退款';
	                        							}else if(result[i].indentstatus == 5){
	                        								indentstatus = '待评价';
	                        							}else if(result[i].indentstatus == 6){
	                        								indentstatus = '已评价';
	                        							}
	                        							if(new Date(result[i].indentdetails.endtime) >= new Date()){
	                        								if(result[i].indentstatus == 0){
		                        								indentstatus = '待出行';
		                        							}
	                        								if(result[i].indentstatus == 0){
	                        									refund = "<p><a href=\"javascript:void(0);\" onclick=\"remove("+result[i].id+",3);\" class=\"cancel-order\">退款</a></p>"
	                        								}
	                        								if(result[i].indentstatus == 1){
	                        									var m = result[i].ordernumber+"";
		                        								cancel = "<p><a href=\"javascript:void(0);\" onclick=\"toCancel("+result[i].id+");\" class=\"cancel-order\">取消订单</a></p>";
		                        								paymeng = "<p><a href='javascript:payment("+result[i].price+","+result[i].id+")'><span class=\"order-btn\">立即支付</span></a></p>";
		                        							}
	                        							}
	                        							if(result[i].indentdetails.scenic != undefined){
	                        								name = result[i].indentdetails.scenic.scenicname;
	                        								type = '景点门票';
	                        								src = 'scenic?id='+result[i].indentdetails.scenic.id+'&&pageIndex=0';
	                        							}else if(result[i].indentdetails.scenicway != undefined){
	                        								name = result[i].indentdetails.scenicway.way;
	                        								type = result[i].indentdetails.scenicway.attractions.atrtitle;
	                        								src = 'scenicway/tourRouteProductShow/'+result[i].indentdetails.scenicway.id; 
	                        							}
	                        							var date = new Date(result[i].indentdetails.starttime);
	                        							Y = date.getFullYear() + '-';
	                        							M = (date.getMonth()+1 < 10 ? '0'+(date.getMonth()+1) : date.getMonth()+1) + '-';
	                        							D = date.getDate() + ' ';
	                        							h = date.getHours() + ':';
	                        							m = date.getMinutes() + ':';
	                        							s = date.getSeconds(); 
		                        						var table = "<table class=\"order_table\">"
		                        						+ "<thead>"
		                        						+ "<tr class=\"order-col-name\">"
		                        						+ "<th colspan=\"7\">"
		                        						+ "<span class=\"date\">下单时间 "+result[i].indentdetails.orderstime+"</span>"
		                        						+ "<span class=\"num\">订单号：<a href=\""+src+"\" target=\"_Blank\">"+result[i].ordernumber+"</a></span>"
		                        						+ "</th>"
		                        						+ "</tr>"
		                        						+ "</thead>"
		                        						+ "<tbody>"
		                        						+ "<tr class=\"order-sep-row\">"
		                        						+ "<td width=\"355\">      "
		                        						+ "<div class=\"product-name\">"
		                        						+ "<a target=\"_blank\" href=\""+src+"\">"+name+"</a>      "
		                        						+ "</div>  "
		                        						+ "</td><td width=\"146\">  "
		                        						+ "<div class=\"product-type\">"+type+"  </div> "
		                        						+ "</td><td width=\"200\"><div class=\"product-date\"><div class=\"product-date\">"+Y+M+D+"</div></div></td> "
		                 	      						+ "<td width=\"93\"><div class=\"product-price\">¥"+result[i].price+"</div></td>"
		                        						+ "<td class=\"order-line\" width=\"77\">  <div class=\"order-option\">    "
		                        						+ "<span class=\"order-status wait\">"+indentstatus+"</span>      "
		                        						+ "<p><a href=\"viewDetail/"+result[i].id+"\" class=\"detail-link\" target=\"_Blank\">订单详情</a></p> "
		                        						+ "</div></td>"
		                        						+ "<td class=\"order-line\" width=\"113\">"
		                        						+ paymeng
		                        						+ cancel
		                        						+ refund
		                        						+ "<p><a href=\"javascript:;\" class=\"cancel_order js-dele-btn\" onclick='removeCheck(this)' id="+result[i].id+">删除</a></p>"
		                        						+ "</td> "
		                        						+ comment
		                        						+ "<tr class=\"order-bottom-row\"> <td colspan=\"7\"><div class=\"num\">数量："+result[i].indentdetails.copies+"份 </div></td></tr></tbody></table>";
	                        							$('#tableContent').append(table);
	                        						}
	                        					}
	                        				}else{
	                        					var table = "<table class=\"order_table\">\r\n" + 
                        						"            		<thead>\r\n" + 
                        						"            			<tr class=\"order-col-name\">\r\n" + 
                        						"            				<th colspan=\"7\"></th>\r\n" + 
                        						"            			</tr>\r\n" + 
                        						"            		</thead>\r\n" + 
                        						"            		<tbody>\r\n" + 
                        						"            			<tr class=\"sep-row\">\r\n" + 
                        						"            				<td colspan=\"7\">\r\n" + 
                        						"            					<div class=\"no_order\">\r\n" + 
                        						"            						<a href=\"index\" class=\"noimg\">\r\n" + 
                        						"            							<img src=\"image/noorder.png\">\r\n" + 
                        						"            						</a>\r\n" + 
                        						"            						<div class=\"content\">\r\n" + 
                        						"	            						<p>最近您没有下过订单哦~</p>\r\n" + 
                        						"	            						<a href=\"index\" class=\"gohome\">去首页看看</a>\r\n" + 
                        						"            						</div>\r\n" + 
                        						"            					</div>\r\n" + 
                        						"            				</td>\r\n" + 
                        						"            			</tr>\r\n" + 
                        						"            		</tbody>\r\n" + 
                        						"            	</table>";
                        						
                        						$('#tableContent').append(table);
	                        				}
	                        			}
	                            	})
	                            }
                            	function showList(obj){
                            		if($('#ulId').is(':hidden')){
                            			$('#ulId').slideDown(200);
                            			$(obj).focus();
                            			$(obj).blur(function(){
                            				$('#ulId').slideUp(200);
                            			});
                            		}else{
                            			$('#ulId').slideUp(200);
                            		}
                            	}
                            </script>
                    <li class="order-width110">行程日期</li>
                    <li class="order-width80">订单金额</li>
                    <li class="order-width80">订单状态</li>
                    <li class="order-width80">操作</li>
                    <li class="order-width100">其他操作</li>
                </ul>
            </div>
        </div>
        <div class="order-mod-tcontent js_con" style="display:block;">
            <!--全部订单列表开始-->
            <div id="tableContent">
            	
            </div>
            <!--列表结束-->
            <!--分页-->
            <div class="page_box mart20">
                <div id="pages_" class="pages" style="null">
                    <div id="lv_page">
                        <div class="Pages" id ="pageId_tabs-1">
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<!-- 新的订单列表开始----------------------------------------------------------------------------------------------------- -->
<!-- <div class="mod_tcontent js_con" style="display:block;">
    <table class="order_table">
        <thead>
        <tr class="col-name">
            <th width="400">产品信息</th>
            <th width="80">订单金额</th>
            <th width="72">出行时间</th>
            <th width="70">订单状态</th>
            <th width="110">操作</th>
            <th width="110">其他操作</th>
        </tr>
        </thead>
        <tbody>
        近期没有下过订单
        <tr class="sep-row">
            <td colspan="7" >
                <div class="no_order">
                    <a href="http://www.lvmama.com" class="noimg"><img src="http://pic.lvmama.com/img/v6/myspace/noorder.png" /></a>
                    <div class="content">
                        <p>最近您没有下过订单哦~</p>
                        <a href="http://www.lvmama.com" class="gohome">去首页看看</a>
                    </div>
                </div>
            </td>
        </tr>
        </tbody>
    </table>
</div> -->
<!-- 新的订单列表结束----------------------------------------------------------------------------------------------------- -->


<div class="nova-overlay" style="z-index: 1; display: none;"></div>

<!-- 弹出层 -->
<div class="bg-tan"></div>
<div class="cancel_wapper order_cancel_t" style="display: none; top: 114.5px; left: 597.5px;">
    <input type="hidden" id="orderIdBtn" name="orderId"/>
    <h4>取消订单</h4>
    <a class="cancel_bg"><img src="http://pic.lvmama.com/img/myspace/myspace_fapiao/cancel_bt.jpg" onclick="$('div.cancel_wapper').hide();$('div.nova-overlay').hide();" alt="关闭" id="close_btn" /></a>
    <div class="cancel_list">
        <h3>为了更好的改进我们的服务，请选择取消原因：</h3>
        <ul class="cancel_list_s">
            <li><input type="radio" id="reason" class="input_radio" name="itemCode" value="50" data="支付遇到问题">支付遇到问题</li>
            <li><input type="radio" id="reason" class="input_radio" name="itemCode" value="51" data="行程变更">行程变更</li>
            <li><input type="radio" id="reason" class="input_radio" name="itemCode" value="52" data="产品定错（时间、房型、数量等）">产品定错（时间、房型、数量等）</li>
            <li><input type="radio" id="reason" class="input_radio" name="itemCode" value="53" data="重复订单">重复订单</li>
            <li><input type="radio" id="reason" class="input_radio" name="itemCode" value="54" data="在其他网站购买">在其他网站购买</li>
            <li><input type="radio" id="reason" class="input_radio" name="itemCode" value="55" data="价格不够优惠">价格不够优惠</li>
            <li><input type="radio" id="reason" class="input_radio" name="itemCode" value="56" data="想直接去景区/酒店">想直接去景区/酒店</li>
            <li><input type="radio" id="other" class="input_radio"  name="itemCode" value="57" >其他<input name="" id="otherReason" type="text" class="input_01" /></li>
            <li class="sub_bt"><input name="" type="button" value="确认" class="denglv denglv01" onclick="cancel();" /><input name="" type="button" onclick="$('div.cancel_wapper').hide();$('div.nova-overlay').hide();" value="取消" class="denglv denglv03" /></li>
        </ul>
    </div>
</div>

<div class="cancel_wapper01 order_cancel_t01">
    <h4>取消订单</h4>
    <a class="cancel_bg"><img src="http://pic.lvmama.com/img/myspace/myspace_fapiao/cancel_bt.jpg" alt="关闭" id="close_btn" /></a>
    <div class="cancel_list">
        <div class="cancel_ka"><span class="cancel_closed"> 您的订单已取消</span><span style="display: block; margin-top: -2px; margin-left: 20px;">谢谢反馈！</span>
            <div class="tips_list" id="fleshId"></div>
        </div>
    </div>
</div>

<!--取消意外险确认弹出框 start-->
<div class="cancel_insurance_box">
    <h4>是否取消意外险?</h4>
    <p class="cancel_insurance_dialog_tip">
        <span class="tip-icon tip-icon-warning"></span>取消意外险的金额会在3-15个工作日退回至您的账户
    </p>
</div>
<!--取消意外险确认弹出框 end-->

<table cellspacing="0" cellpadding="0" id = "contactList" class="contact_list">
    <tr>
        <th width="8%" style="text-align:center;">序号</th>
        <th width="15%" style="text-align:center;">合同编号</th>
        <th width="20%" style="text-align:center;">合同类型</th>
        <th width="20%" style="text-align:center;">商品名称</th>
        <th width="15%" style="text-align:center;">游玩时间</th>
        <th width="15%" style="text-align:center;">操作栏</th>
    </tr>
</table>
<!--迪士尼门票下载凭证列表-->
<table cellspacing="0" cellpadding="0" class="contact_list" id = "disney_list">
    <tr>
        <th width="8%" style="text-align:center;">序号</th>
        <th width="35%" style="text-align:center;">商品名称</th>
        <th width="30%" style="text-align:center;">游玩时间</th>
        <th width="27%" style="text-align:center;">操作栏</th>
    </tr>
</table>
        </div><!--广告位开始-->
    </div>
</div><!-- 会员中心页面结束 -->


<div class="user-update-pop">
    <span class="user-update-head">
        <i class="user_grade_Icon user-update-v0"></i>
    </span>

    <div class="user-update-content">
        <span class="title">您已获得以下特权</span>
    </div>
    <div class="user_grade_list clearfix">
        <a title="专属活动" hidefocus="false"><i
                class="user_grade_Icon user_myle_v1"></i><span
                class="name">专属活动</span></a>
        <a title="生日礼包" hidefocus="false"><i
                class="user_grade_Icon dis_user_myle_v3"></i><span
                class="name">生日礼包</span></a>
        <a title="等级优惠券" hidefocus="false"><i
                class="user_grade_Icon dis_user_myle_v4"></i><span
                class="name">等级优惠券</span></a>
        <a title="等级专享价" hidefocus="false"><i
                class="user_grade_Icon dis_user_myle_v5"></i><span
                class="name">等级专享价</span></a>
        <a title="邮轮优先登船" hidefocus="false"><i
                class="user_grade_Icon dis_user_myle_v6"></i><span
                class="name">邮轮优先登船</span></a>
        <a title="WiFi特权" hidefocus="false"><i
                class="user_grade_Icon dis_user_myle_v7"></i><span
                class="name">WiFi特权</span></a>
    </div>
</div>
<script src="js/footer.js"></script>
</body>

</html>