<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的订单-驴妈妈旅游网</title>
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
	<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script>
<!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="lib/laypage/1.2/laypage.js"></script>
</head>
<body  class="lv_newhome lvnav_order">
<!---会员中心导航开始--->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>
<!---会员中心导航结束--->
<!-- 主体部分开始-->
<div class="newmember_main">
<!-- 会员中心左侧菜单栏 -->
<jsp:include page="myPageLeft.jsp" flush="true" />


<!-- 新的订单列表开始----------------------------------------------------------------------------------------------------- -->
<div class="newmember_rightside">
    <!--近期订单开始-->
    <div class="mod_box">
        <input type="hidden" id="bodyStyle" value="lvnav_order">
        <!-- 新下单页 -->
        <div class="order-v1-box">
            <ul class="order-head-tab js-order-tab" id="tabId">
                <li class="active" data="all">全部订单</li>
                <li data="1">待支付<em></em></li>
                <li data="0">待出行<em></em></li>
                <li data="5">待点评<em></em></li>
                <li data="4">退款<em></em></li>
            </ul>
            <div class="order-body-tab ">
                <ul class="order-body-list">
                    <li class="order-width270">产品信息</li>
                    <li class="order-width100">
                        &nbsp;
                        <div class="order-usergift_tab_box fl usergift_tab_active" tabindex='0' onclick="showList(this)">
                            <cite>
                           		 全部订单
                                <i class="conmon_icon usergift_down" ></i>
                            </cite>
                            <script type="text/javascript">
	                            $(function(){
	                            	showIndentList('all','all');
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
	                        					var hint='';
	                        					if(indentstatus == 7){
	                        						hint = '<div class="nova-dialog del-wrap-box" data-id="1541607045872" style="z-index: 1; position: fixed; top: 30%; left: 35%;" data-mask="mask">    <div class="nova-dialog-close" style="display: block;"><i onclick="window.location.reload()"></i></div>    <div class="nova-dialog-header">温馨提示</div>    <div class="nova-dialog-body">订单删除成功。</div>    <div class="nova-dialog-footer"><span class="btn btn-orange" onclick="window.location.reload()">确定</span></div></div>';
	                        					}else if(indentstatus == 3){
	                        						hint = '<div class="nova-dialog del-wrap-box" data-id="1541607045872" style="z-index: 1; position: fixed; top: 30%; left: 35%;" data-mask="mask">    <div class="nova-dialog-close" style="display: block;"><i onclick="window.location.reload()"></i></div>    <div class="nova-dialog-header">温馨提示</div>    <div class="nova-dialog-body">退款申请成功，等待管理员审核。</div>    <div class="nova-dialog-footer"><span class="btn btn-orange" onclick="window.location.reload()">确定</span></div></div>';
	                        					}
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
	                            function cancel(indentstatus){//取消
	                            	var input = $('input[name="itemCode"]:checked');
	                            	if(input.val() != undefined){
	                            		var vause = '';
	                            		if(input.val() == 57){
	                            			vause = input.parent().text() + '-' + input.parent().find('input[type=text]').val();
	                            		}else{
	                            			vause = input.parent().text()
	                            		}
	                            		var id = $('#orderIdBtn').val();
		                            	/* var indentstatus = 6; */
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
	                            function showIndentList(type,indentstatus){
	                            	$.ajax({
	                            		type:"post",
	                            		url: "getIndent",
	                            		dataType: "json",
	                        			data: {
	                        				type: type,
	                        				indentstatus:indentstatus,
	                        			},
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
                            	function attractions_add(title,url,id,w,h){
                            		$.ajax({
                            			url:"checkComment",
                            			type:"post",
                            			data:{
                            				id:id
                            			},success:function(result){
                            				if(result==false){
                            					alert("您已评论过");
                            				}else{
                            					layer_show(title,url,w,h);
                            				}
                            			}
                            		})
                            	}
                            </script>
                            <ul class="order-usergift_tab_lsit"  style="display: none;"  id="ulId">
                                <li data="" id="all" platform="VST" class="selected">全部订单</li>
                                <li data="11,12,13" id="scenicid" platform="VST">门票</li>
                                <li data="15,16,17,18,29,42" id="scenicwayId" platform="VST">度假</li>
                            </ul>
                            <input name="" type="hidden" value="" id="inputselect">
                        </div>
                    </li>
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
    <!--近期订单结束-->
</div>


<!-- 主体部分结束-->



<div class="hr_b"></div>
</div>
<script src="${pageContext.request.contextPath}/js/footer.js"></script>
<div class="bg-tan" id="cancleOrder-tan" style="display: none;"></div>

<!-- 弹出层 -->
<div class="nova-overlay" style="z-index: 1; display: none;"></div>
<div class="cancel_wapper order_cancel_t" style="display: none; top: 114.5px; left: 597.5px;">
    <input type="hidden" id="orderIdBtn" name="orderId">
    <input type="hidden" id="isNS" name="isNS" value="false">
    <h4>取消订单</h4>
    <a class="cancel_bg"><img onclick="$('div.cancel_wapper').hide();$('div.nova-overlay').hide();" src="${pageContext.request.contextPath}/image/cancel_bt.jpg" alt="关闭" id="close_btn"></a>
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
            <li><input type="radio" id="other" class="input_radio" name="itemCode" value="57">其他<input name="" id="otherReason" type="text" class="input_01"></li>
            <li class="sub_bt"><input name="" type="button" value="确认" class="denglv denglv01" onclick="cancel(2);"><input name="" type="button" onclick="$('div.cancel_wapper').hide();$('div.nova-overlay').hide();" value="取消" class="denglv denglv03"></li>
        </ul>
    </div>
</div>
</body>
</html>