<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>账户余额-兔爸爸旅游网</title>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/image/favicon.png" type="image/png" />
</head>
<body class = "lv_newhome lvnav_balance">
<!-- 无搜索版，公共头部开始  -->
<jsp:include  page="mySpaceTop.jsp" flush="true"/>

<script type="text/javascript">
	$(function(){
		var tel = $('span.new-acc-name').find('strong').text().trim();
		var mtel = tel.substr(0, 3) + '****' + tel.substr(7);
		$('span.new-acc-name').find('strong').text(mtel);
		$('em.font17').text(mtel);
		var operation = "${requestScope.operation}";
		var page = $('div.page_box');
		if(operation == 0){
			$('#consumer_li').addClass('active');
			$('#consumer_div').append(page);
		}else if(operation == 1){
			$('#recharge_li').addClass('active');
			$('#recharge_div').append(page);
		}else if(operation == 2){
			$('#refund_li').addClass('active');
			$('#refund_div').append(page);
		}else if(operation == 3){
			$('#draw_li').addClass('active');
			$('#darw_div').append(page);
		}
	})
</script>

<!-- 导航标签渲染 -->
<script type="text/javascript" src="http://www.lvmama.com/js/2017/jQuerySuperScript.js"></script>
<!-- 无搜索版，公共头部结束 --><!---会员中心导航开始--->

<!---会员中心导航结束--->
<!-- 会员中心页面开始-->
<div class="newmember_main">
<!-- 会员中心左侧菜单栏 -->
<jsp:include page="myPageLeft.jsp" flush="true" />


    <!--  右边部分开始 -->
    <div class="newmember_rightside">
        <div class="mod_box shadow_down">
            <div class="mod_content p20_4">
                <div class="password_edit_title">
                    <h4>账户余额</h4>
                    <div class="new-acc-box">
                          <span class="new-acc-name">账户：<strong>${users.iphone }</strong></span>
                          <span class="new-mod-name"><a href="${pageContext.request.contextPath}/phone_update_1" target="_blank" >修改手机</a>
                          <c:if test="${empty users.paymentCode }">
                          	|<a id="save_phone" href="#" onclick="bindPasswordShow()">开启支付密码</a>
                          </c:if>
                          <c:if test="${!empty users.paymentCode }">
                          	|<a id="save_phone" href="#" onclick="bindPasswordShow()">修改支付密码</a>
                          </c:if>
                          </span>
                          <span class="nova-tip-form">
                          <span class="nova-icon-xs nova-icon-info"></span>开启支付密码后，账户资金更安全！</span>
                          <span class="new-mod-name"><a href="#" onclick="rechargeShow(this)">充值</a>|<a href="#" onclick="rechargeShow(this)">提现</a></span>
                    </div>
                </div>

                <form id="forms" action="#" method="post"></form>
                <div class="integral_content">
                    <ul class="list">
                        <li class="wd_260">
                            <em class="new-price-title">可用余额：</em>
                            <p class="mart10">
                                <em class="font32 f_f60 marR2">¥${users.money }</em>
                                <!--						   <a id="income_div" class="apy_btn marL20 js-apy">充值</a>
-->
                            </p>
                        </li>
                        <li class="wd_180">
                            <em class="new-price-title">可提现金额：</em>
                            <p class="mart10">
                            	<span class="f_f60">￥<em class="font16" id="withdrawalMoney">${users.money }</em></span>
                            </p>
                        </li>
                        <li class="wd_140">
                            <p>已充值金额：<em class="f_f60">￥${consumeMoney }</em></p>
                        </li>

                    </ul>
                    <p class="endohter a_gray99"><i class="conmon_icon yel_mark"></i>存款账户是兔爸爸的现金账户，您可进行现金充值、<em>提现（为避免部分恶意套现行为，目前仅限退款金额可提现）</em>或退款。</p>
                </div>
            </div>
        </div>

        <div class="detail_box "  >
            <div class="comon_tit">
                <ul   class="comon_tab">
                    <li id="consumer_li" >
                        <a id="tab_PAY" href="${pageContext.request.contextPath}/myAccount/0/1"> 消费<i class="conmon_icon icon_jt"></a></i>
                    </li>
                    <li id="recharge_li">
                        <a id="tab_RECHARGE" href="${pageContext.request.contextPath}/myAccount/1/1"> 充值<i class="conmon_icon icon_jt"></a></i>
                    </li>
                    <li id="refund_li">
                        <a id="tab_REFUND" href="${pageContext.request.contextPath}/myAccount/2/1">退款<i class="conmon_icon icon_jt"></a></i>
                    </li>
                    <li id="draw_li">
                        <a id="tab_DRAW" href="${pageContext.request.contextPath}/myAccount/3/1">提现<i class="conmon_icon icon_jt"></a></i>
                    </li>
                </ul>
            </div>
           <c:choose>
            	<c:when test="${operation == 0 }">
            		<!---消费开始-->
		            <div id="consumer_div" class="mod_icontent mod_bg js_con" style="display: block;">
                          <table class="inf_table">
                              <thead>
                              <tr class="inf-col-name">
                                  <th width="600">产品名称</th>
                                  <th width="120">消费金额（元）</th>
                                  <th width="120">订单号</th>
                                  <th width="120">消费时间</th>
                              </tr>
                              </thead>
                              <tbody>
                              	<c:forEach items="${pageList.listIterator() }" var="userrecord">
		            				<tr class="inf-sep-row">
	                                  <td width="600">${userrecord.indent.commodity }</td>
	                                  <td width="120">${userrecord.money }</td>
	                                  <td width="120">${userrecord.indent.ordernumber }</td>
	                                  <td width="120"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${userrecord.operationTime }" /></td>
	                              </tr>
		            			</c:forEach>
                              </tbody>
                          </table>
                          <!--分页开始-->
               				<!--分页结束-->
		            </div>
		            <!---消费结束-->
            	</c:when>
            	<c:when test="${operation == 1 }">
            		<!---充值开始-->
		            <div id="recharge_div" class="mod_icontent mod_bg js_con" style="display: block;">
                        <table class="inf_table">
                            <thead>
                            <tr class="inf-col-name">
                                <th width="220">充值金额（元）</th>
                                <th width="790">充值时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${pageList.listIterator() }" var="userrecord">
		            				<tr class="inf-sep-row">
	                                  <td width="220">${userrecord.money }（元）</td>
	                                  <td width="790"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${userrecord.operationTime }" /></td>
	                              </tr>
		            			</c:forEach>
                            </tbody>
                        </table>
                        <!--分页开始-->
		                <!--分页结束-->
        			</div>
        <!---充值结束-->
            	</c:when>
            	<c:when test="${operation == 2 }">
            		 <!---退款开始-->
			           <div id="refund_div" class="mod_icontent mod_bg js_con" style="display: block;">
                            <table class="inf_table">
                                <thead>
                                <tr class="inf-col-name">
                                    <th width="600">产品名称</th>
                                    <th width="130">退款金额（元）</th>
                                    <th width="130">订单号</th>
                                    <th width="130">退款时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${pageList.listIterator() }" var="userrecord">
			            				<tr class="inf-sep-row">
		                                  <td width="600">${userrecord.indent.commodity }</td>
		                                  <td width="130">${userrecord.money }</td>
		                                  <td width="130">${userrecord.indent.ordernumber }</td>
		                                  <td width="130"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${userrecord.operationTime }" /></td>
		                              </tr>
			            			</c:forEach>
                                </tbody>
                            </table>
                            <!--分页开始-->
                            <!--分页结束-->
			            </div>
			            <!---退款结束-->
            	</c:when>
            	<c:when test="${operation == 3 }">
            		<!---提现开始-->
		            <div id="darw_div" class="mod_icontent mod_bg js_con" style="display: block;">
                        <table class="inf_table">
                            <thead>
                            <tr class="inf-col-name">
                                <th width="640">收款账号</th>
                                <th width="160">提现金额（元）</th>
                                <th width="160">状态</th>
                                <th width="160">提现时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            		<c:forEach items="${pageList.listIterator() }" var="userrecord">
			            				<tr class="inf-sep-row">
		                                  <td width="640">${userrecord.paymentAccount }</td>
		                                  <td width="160">${userrecord.money }</td>
		                                  <td width="160">${userrecord.paymentStatus == 1 ? "已到账" :"未到账"}</td>
		                                  <td width="160"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${userrecord.operationTime }" /></td>
		                               </tr>
			            			</c:forEach>
                            </tbody>
                        </table>
                        <!--分页开始-->
                        <!--分页结束-->
		            </div><!---提现结束-->
            	</c:when>
           </c:choose>
           <div class="page_box p20">
				<div id="pages_" class="pages" style="null"> 
					<div id="lv_page"><div class="Pages">
						<c:choose>
							<c:when test="${pageList.getPageNum() == 1 }">
								<a href="#" title="上一页" class="PrevPage">上一页</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/myAccount/${operation }/${pageList.getPageNum() - 1 }" title="上一页" class="PrevPage">上一页</a>
							</c:otherwise>
						</c:choose>
						<c:forEach begin="1" end="${pageList.getPages() }" varStatus="index">
							<c:choose>
								<c:when test="${pageList.getPageNum() == index.index }">
									<span class="PageSel">${index.index }</span>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/myAccount/${operation }/${index.index }" class="PageLink" title="第 ${index.index }页">${index.index }</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageList.getPageNum() == pageList.getPages() }">
								<a href="#" title="下一页" class="NextPage">下一页</a><br>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath}/myAccount/${operation }/${pageList.getPageNum() + 1 }" title="下一页" class="NextPage">下一页</a><br>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>							
		</div>
           							
        </div>

    </div>
</div>
<script type="text/javascript">
	function bindPasswordShow(){//开启支付密码弹框
		$('div#paymentCode').show();
		$('div.nova-overlay').show();
	}
	function bindPasswordHide(){//关闭支付密码弹框
		$('#div_error_tips').empty();
		$('div#paymentCode').hide();
		$('div.nova-overlay').hide();
		$('#pay_notice').hide();
	}
	function sendNote(){//发送短信
		var phone = $('#mobileValue').val();
		var flag=false;
		$.ajax({
			url:'${pageContext.request.contextPath}/send_code',
			type:'get',
			async: false,
			data:'phone='+phone,
			success:function(result){
				if(result.trim() == 'true'){
					alert('发送成功');
					flag = true;
				}else{
					alert('发送失败');
					flag = false;
				}
			}
		})
		if(flag == false){
			return;
		}
		settime();
	}
	function settime() { //发送验证码倒计时
		var time = $('#countdown').text();
		 if (time == 0) { 
			   $('#countdown').parent().hide();
			   $('#send-verifycode-old').show();
			   $('#countdown').text(60);
		       return;
		    } else { 
		    	 $('#countdown').parent().show();
				$('#send-verifycode-old').hide();
		    	time = time - 1;
		    	$('#countdown').text(time);
		    } 
		setTimeout('settime()',1000) 
	}
	function bindPasswordSubmit(){//支付密码提交时验证
		 if($('#authenticationCode').val() != ''){
			if($('#sso_password').val() != ''){
				var flag;
				$.ajax({
					url:'${pageContext.request.contextPath}/checkPhoneCode',
					type:'get',
					data:'code='+$('#authenticationCode').val(),
					async: false,
					success:function(result){
						if(result.trim() == '2'){
							flag = true;
						}else{
							flag = false;
						}
					}
				})
				if(flag){
					var reg=/^[1-9]+[0-9]*]*$/;
					if($('#sso_password').val().length == 6 && reg.test($('#sso_password').val())){
						if($('#sso_againPassword').val() == $('#sso_password').val()){
							$.ajax({
								url:'${pageContext.request.contextPath}/updateUserPaymentCode',
								type:'get',
								data:'id='+$('#codeResult').val()+"&paymentCode="+$('#sso_password').val(),
								async: false,
								success:function(result){
									if(result.result > 0){
										window.location.reload();
									}else{
										alert("操作失败");
									}
								}
							})
						}else{
							error('您两次密码输入不一致，请重新输入');
							$('#sso_againPassword').addClass('input_error');
						}
					}else{
						error('请输入正确的6位数字支付密码');
						$('#sso_password').addClass('input_error');
					}
				}else{
					error('验证码输入错误');
					$('#authenticationCode').addClass('input_error');
				}
			}else{
				error('请您输入支付密码');
				$('#sso_password').addClass('input_error');
			}
		}else{
			error('请填写短信验证码');
			$('#authenticationCode').addClass('input_error');
		} 
	}
	function error(errorText){//输出错误信息
		$('#div_error_tips').text(errorText);
		$('#div_error_tips').append('<span id="span_tips" class="nova-icon-xs nova-icon-error"></span>');
		$('#div_error_tips').show();
	}
	function focudeOnAuthCode(){//关闭验证码错误提示
		if($('#authenticationCode').is('.input_error')){
			$('#div_error_tips').empty();
			$('#div_error_tips').hide();
			$('#authenticationCode').removeClass('input_error');
		}
	}
	function focuseOnPassword(){//关闭密码错误提示
		if($('#sso_password').is('.input_error')){
			$('#div_error_tips').empty();
			$('#div_error_tips').hide();
			$('#sso_password').removeClass('input_error');
		}
	}
	function focuseOnAgainPassword(){//关闭验证密码错误提示
		if($('#sso_againPassword').is('.input_error')){
			$('#div_error_tips').empty();
			$('#div_error_tips').hide();
			$('#sso_againPassword').removeClass('input_error');
		}
	}
	
	function rechargeShow(obj){
		if($('#save_phone').text() == '修改支付密码'){
			if($(obj).text() == '充值'){
				$('#label_account').text('充值账户：');
				$('#label_money').text('请输入充值金额：'); 
				$('#spanSubmit').click(function(){
					rechargeSubmit();
				})
			}else{
				$('#label_account').text('提现账户：');
				$('#label_money').text('请输入提现金额：'); 
				$('#spanSubmit').click(function(){
					withdrawalSubmit();
				})
			}
			$('#recharge').show();
		}else{
			$('div#paymentCode').show();
			$('#pay_notice').show();
		}
		$('div.nova-overlay').show();
	}
	function rechargeHide(){
		$('#recharge').hide();
		$('div.nova-overlay').hide();
		$('#spanSubmit').unbind('click');
	}
	function rechargeSubmit(){//充值时的提交
		if($('#recharge_money').val() != ''){
			var reg=/^[1-9]+[0-9]*]*$/;
			if(reg.test($('#recharge_money').val())){
				if($('#recharge_money').val() >= 100 && $('#recharge_money').val() <= 10000){
					if($('#payment_code').val() != ''){
						var flag = false;
						$.ajax({
							url:'${pageContext.request.contextPath}/findByUserPaymentCode',
							type:'get',
							data:'id='+$('#codeResult').val(),
							async: false,
							success:function(result){
								if(result.paymentCode == $('#payment_code').val()){
									flag = true;
								}else{
									flag = false;;
								}
							}
						})
						if(flag){
							$.ajax({
								url:'${pageContext.request.contextPath}/updateUserMoney',
								type:'post',
								data:'id='+$('#codeResult').val()+"&money="+$('#recharge_money').val()+"&phone="+$('#mobileValue').val().trim()+"&status=1",
								async: false,
								success:function(result){
									if(result.result == true){
										window.location.reload();
									}else{
										alert("操作失败");
									}
								}
							})
						}else{
							rechargeError('支付密码错误');
							$('#payment_code').addClass('input_error');
						}
					}else{
						rechargeError('请输入支付密码');
						$('#payment_code').addClass('input_error');
					}
				}else{
					rechargeError('金额不正确');
					$('#recharge_money').addClass('input_error');
				}
			}else{
				rechargeError('只能输入整数');
				$('#recharge_money').addClass('input_error');
			}
		}else{
			rechargeError('请输入金额');
			$('#recharge_money').addClass('input_error');
		}
	}
	function withdrawalSubmit(){//提现时的提交
		if($('#recharge_money').val() != ''){
			var reg=/^[1-9]+[0-9]*]*$/;
			if(reg.test($('#recharge_money').val())){
				if($('#recharge_money').val() >= 100 && $('#recharge_money').val() <= 10000){
					if($('#payment_code').val() != ''){
						var flag = false;
						$.ajax({
							url:'${pageContext.request.contextPath}/findByUserPaymentCode',
							type:'get',
							data:'id='+$('#codeResult').val(),
							async: false,
							success:function(result){
								if(result.paymentCode == $('#payment_code').val()){
									flag = true;
								}else{
									flag = false;;
								}
							}
						})
						if(flag){
							if($('#withdrawalMoney').text() >= $('#recharge_money').val()){
								$.ajax({
									url:'${pageContext.request.contextPath}/updateUserMoney',
									type:'post',
									data:'id='+$('#codeResult').val()+"&money="+$('#recharge_money').val()+"&phone="+$('#mobileValue').val().trim()+"&status=3",
									async: false,
									success:function(result){
										if(result.result == true){
											window.location.reload();
										}else{
											alert("操作失败");
										}
									}
								})
							}else{
								rechargeError('账户余额不足');
								$('#recharge_money').addClass('input_error');
							}
						}else{
							rechargeError('支付密码错误');
							$('#payment_code').addClass('input_error');
						}
					}else{
						rechargeError('请输入支付密码');
						$('#payment_code').addClass('input_error');
					}
				}else{
					rechargeError('金额不正确');
					$('#recharge_money').addClass('input_error');
				}
			}else{
				rechargeError('只能输入整数');
				$('#recharge_money').addClass('input_error');
			}
		}else{
			rechargeError('请输入金额');
			$('#recharge_money').addClass('input_error');
		}
	}
	function rechargeError(errorText){
		$('#div_error_rechargeMoney').text(errorText);
		$('#div_error_rechargeMoney').show();
		$('#div_error_rechargeMoney').append('<span id="span_tips" class="nova-icon-xs nova-icon-error"></span>');
		
	}
	function focuseOnRechargeMmoney(){
		$('#div_error_rechargeMoney').hide();
		$('#recharge_money').removeClass('input_error');
	}
	function focuseOnPaymentCode(){
		$('#div_error_rechargeMoney').hide();
		$('#payment_code').removeClass('input_error');
	}
</script>
<div class="nova-dialog js-apy-warp" id="paymentCode" style="display:none;width: 500px; height: 357px; z-index: 2; position: fixed; top: 20%; left: 35%;" data-mask="mask">    <div class="nova-dialog-close" style="display: block;"><i onclick="bindPasswordHide()"></i></div>    <div class="nova-dialog-header">设置支付密码</div>    <div class="nova-dialog-body"><div class="pay_password_content js-drawals-box" style="display: block;">
    <span id="pay_notice" class="nova-tip-form" style="display:none">
        <span class="nova-icon-xs nova-icon-warning"></span>为保证账户资金安全，需要先设置支付密码，才可以正常使用存款账户功能。
    </span>
    <input id="codeResult" name="codeResult" type="hidden" value="${users.id }">
    <input id="mobileValue" name="mobile" type="hidden" value="${users.iphone }">
    <div id="div_error_tips" class="nova-tip nova-tip-error" style="display:none"></div>
    <div id="div_succ_tips" class="nova-tip nova-tip-success" style="display:none"></div>
    <p><label>　　手机验证：</label><em class="font16 font17">${users.iphone }</em></p>
    <p><label>　　验证码：</label><input id="authenticationCode" onfocus="focudeOnAuthCode()" class="input_text" ><a id="send-verifycode-old" class="code1 code-time" href="javascript:void(0)" onclick="sendNote()">获取验证码</a><a class="code1 code-time" href="javascript:void(0)" style="display: none;"><em id="countdown">60</em>秒后重发</a></p>
    <p><label id="label_pass">创建支付密码：</label><input id="sso_password" type="password" placeholder="请输入6位数字" onfocus="focuseOnPassword()" class="input_text default-text"></p>
    <p><label id="label_confirm_pass">确认支付密码：</label><input id="sso_againPassword" type="password" placeholder="请重复6位数字" onfocus="focuseOnAgainPassword()" class="input_text"></p>
</div></div>    <div class="nova-dialog-footer"><span onclick="bindPasswordSubmit()" class="btn btn-orange">确定</span></div></div>
<div class="nova-overlay" style="z-index: 1; display:none;"></div>


<div class="nova-dialog js-apy-warp" id="recharge" style="display:none;width: 500px; height: 270px; z-index: 2; position: fixed; top: 20%; left: 35%;" data-mask="mask"> 
<div class="nova-dialog-close" style="display: block;"><i onclick="rechargeHide()"></i></div>
<div class="nova-dialog-body"><div class="pay_password_content js-drawals-box" style="display: block;">
<span id="pay_notice" class="nova-tip-form" style="display:block">
        <span class="nova-icon-xs nova-icon-warning"></span>金额只能输入100~10000整数
</span>
<div id="div_error_rechargeMoney" class="nova-tip nova-tip-error" style="display:none"></div>
<p><label id="label_account">充值账户：</label><em class="font16 font17">${users.iphone }</em></p>
<p><label id="label_money">请输入充值金额：</label><input id="recharge_money" type="text" onfocus="focuseOnRechargeMmoney()" class="input_text default-text"></p>
<p><label id="label_code">请输入支付密码：</label><input id="payment_code" type="password" onfocus="focuseOnPaymentCode()" class="input_text default-text"></p>
</div></div>
<div class="nova-dialog-footer"><span id="spanSubmit" class="btn btn-orange">确定</span></div>
</div>
<script src="${pageContext.request.contextPath}/js/footer.js"></script>
</body>

</html>