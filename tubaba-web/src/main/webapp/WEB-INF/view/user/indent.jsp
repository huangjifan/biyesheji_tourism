<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>填写订单</title>
 	<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
    <link rel="stylesheet" href="http://s1.lvjs.com.cn/min/index.php?f=/styles/new_v/header-air.css,/styles/v3/core.css,/styles/v4/modules/step.css,/styles/v5/modules/tip.css,/styles/v5/modules/tags.css,/styles/v4/modules/calendar.css">
     <link rel="stylesheet" href="http://s2.lvjs.com.cn/styles/v6/order.css">
    <link rel="stylesheet" href=" http://s3.lvjs.com.cn/min/index.php?f=/styles/v5/modules/dialog.css,/styles/common/poplogin.css">
    <style type="text/css">	
        .ui-calendar .calmonth {
            font-size: 12px;
        }
    </style>
    <script type="text/javascript">
        var path="http://www.lvmama.com:80/tnt_order";
        var distModel = 'DISTRIBUTION_PRICE';
    </script>
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/indent.js"></script>

    <style>
        .order .order_bx dd {
            float: left;
            width: 878px;
        }
        .order_dl {
            width: 878px;
        }
        .btn-sm {
            height: 24px;
            line-height: 24px;
            padding: 0 14px;
            font-size: 12px;
            font-family: "Arial","PingFang SC","Microsoft Yahei","SimSun",sans-serif;
        }
        .package-type-select .btn {
            position: relative;
            vertical-align: top;
            text-align: center;
            display: inline-block;
            box-sizing: content-box;
            cursor: pointer;
            height: 18px;
            line-height: 18px;
            padding: 0 12px;
            font-size: 12px;
            font-family: "Arial","PingFang SC","Microsoft Yahei","SimSun",sans-serif;
            -webkit-border-radius: 3px;
            -moz-border-radius: 3px;
            border-radius: 3px;
            color: #fff;
            margin-right: 10px;
        }
        .package-type-select .btn-active {
            background: #fff;
            color: #666;
        }

        .package-type-select em {
            display: none;
            line-height: 16px;
            font-style: normal;
            font-size: 12px;
            color: #29e;
            cursor: pointer;
        }
        .package-type-select .btn i {
            display: none;
            width: 16px;
            height: 16px;
            background: url(http://s1.lvjs.com.cn/img/hotel/order-icon.png) no-repeat -40px -120px;
            position: absolute;
            bottom: 0px;
            right: 0px;
        }
        .package-type-select .btn-active i {
            display: block;
        }
        .package-type-select .btn-active+em {
            display: inline-block;
        }
        .bx_list1 {
            width: 430px;
        }
        .bx_list3 {
            width: 120px;
        }
        .bx_list4 {
            width: 160px;
        }
        .bx_list4 big{
            font-size: 18px;
        }
        .order .bx_list3 {
            width: 120px;
        }
        .order_dl dd span {
            color: #666;
            line-height: 20px;
        }
        .bx_title {
            font-size: 16px;
            color: #666;
            line-height: 40px;
        }
        .order_bx .package-type-select .btn {
            background: #f80;
        }
        .order_bx .package-type-select .btn-active  {
            background: #fff;
        }
    </style>
    
</head>
<link rel="stylesheet" href="css/poplogin.css">
<body class="hotel-order">

<!-- 后台不需要此模块 -->
<div class="order-header wrap">
	<div class="header-inner">
		<a href="index" class="logo">自助天下游 就找驴妈妈</a>
		<p class="welcome">
		</p>
		<p class="info">24小时服务热线：<strong>1010-6060</strong></p>
	</div>
</div>
<div class="main_box">
    <div class="wrap">
        <div id="ticketErrorInfoDiv" style="display:none;" class="warning_box">
            <div class="tiptext tip-warning">
                <span class="tip-icon tip-icon-big-warning"></span>
            </div>
        </div>
<!-- 操作步骤 -->
<ol class="ui-step ui-step-3">
	<li class="ui-step1 ui-step-start ui-step-active">
		<div class="ui-step-arrow">
			<i class="arrow_r1"></i> <i class="arrow_r2"></i>
		</div> <span class="ui-step-text">填写订单信息</span>
	</li>
	<!-- <li class="ui-step3 ui-step-end ">
		<div class="ui-step-arrow">
			<i class="arrow_r1"></i> <i class="arrow_r2"></i>
		</div> <span class="ui-step-text">预订成功</span>
	</li> -->
</ol>

<!-- 操作步骤 -->
        <form method="POST" name="orderForm" id="order_submit">	
			<!-- <div class="tiptext tip-info order_login">
			     <span class="tip-icon tip-icon-info"></span>您当前未登录，如您是驴妈妈会员，<a class="order_login_btn" href="javascript:;">登录</a>后可使用账户中奖金以及存款。
			</div> -->
            <div class="order_box border_3">
            <input type="hidden"  id="scenic" value="${scenic.id}"/>
                    <h1 class="order_name"><span>${scenic.scenicname}</span>（ 在线支付）
                    </h1>
                        <dl class="order_dl">
                            <dt>游玩日期</dt>
                            <dd>
                                <div class="input_time">
			                             <input id="visitTimeInput" class="input js_youwanTime" type="text" maxlength="10" name="visitTime" value="" readonly="readonly" placeholder="请选择游玩日期">
			                             <i class="order_icon icon_titme"></i>
                                </div>
                            </dd>
                        </dl>
                <dl class="order_dl mb0">
                    <dt>预定数量</dt>
                    <dd class="hasfx">
                        <div class="table_list table_tit">
                            <ul class="table_list_t">
                                <li class="table_1">商品名称</li>
                                <li class="table_2">市场价</li>
                                <li class="table_3">驴妈妈价</li>
                                <li class="table_5">特卖价</li>
                                <li class="table_4">数量</li>
                            </ul>
                        </div>
                        <!--商品信息-->
<div style="display:block;" class="table_list table_t">
    <ul class="table_list_t">
        <li class="table_1">
        <c:if test="${ticket.type=='childprice'}">
            <a href="javascript:;" class="pro_name" hidefocus="false">儿童票<i class="icon_arrow"></i></a>
        </c:if>
          <c:if test="${ticket.type=='adultprice'}">
            <a href="javascript:;" class="pro_name" hidefocus="false">成人票<i class="icon_arrow"></i></a>
        </c:if>
        </li>
           <li class="table_2">
          			￥${ticket.price}
             </li>
	<!--  修改分销价格问题 -->
           <li class="table_3"><b>
				￥${ticket.price}
             </b></li>

           <li class="table_5"><b>
           <input style="width:18px;border: 0px" value="￥" readonly>
            <input id=txtPrice value="${ticket.price}" disabled="disabled" onkeyup="checkP(this);"
            onpaste="checkP(this);" oncut="checkP(this);" 
            ondrop="checkP(this);" onchange="checkP(this);" 
            style="width:45px; border: 0px"> 
				 </b></li>
        
        <li class="table_4">
            <span class="num_box">
            <input  class="input num_text item_quantity" 
            id="txtAmount" value="0" onkeyup="checkInt(this);"
            onpaste="checkInt(this);" oncut="checkInt(this);"
             ondrop="checkInt(this);" onchange="checkInt(this);"
         > 
            </span>
        </li>
    </ul>
    <div class="pro_info clearfix">
    			详细信息
        <a href="javascript:;" class="pro_info_sq" hidefocus="false">收起</a>
        <div class="info_arrow"><span>◆</span><i>◆</i></div>
    </div>
    
</div>
						<div id="otherTicketDiv">
						</div>
                       <!--  <p class="pro_jiage">
                            <b>门票总价：</b><span class="zj">
                            
                            </span>&#160;&#160;&#160;&#160;
							（ 在线支付）
                        </p> -->
                    </dd>
                </dl>
            </div>
            <div class="order_box">
                
                <!--联系人信息-->
                
               <h3 class="order_tit">用户信息</h3>
                <input id="users" type="hidden" value="${user}" >
               <!--用户信息-->
                  <!-- <input type="hidden" id="login_user" value="0" status="0" /> -->
                  <div id="userinfoDiv">
				<div id="Jtenantlist">
                    <div class="user_info no_bd">
                        <input type="hidden" id="travellersId0" name="travellers[0].receiverId" value="" autocomplete="off">
                        <dl class="user_dl">
                            <dt><span class="red">*</span>姓名：</dt>
                            <dd>
                                <input class="input js_yz" id="fullName0" travellersid="" type_name="text" name="travellers[0].fullName" type="text" placeholder="姓名">
                                
                                <span class="error_text"><i class="tip-icon tip-icon-error"></i>请输入姓名</span>
                            </dd>
                        </dl>
                       
                                <dl class="user_dl">
                                    <dt id="sjts"><span class="red" >*</span>手机号码：</dt>
                                    <dd id="unlogin" style="display:inline-block">  
									<input type="text" style="margin-bottom:6px;" class="input js_yz" value="" name="iphone" id="mobileLoginText" item_type="mobile" type_name="mobile" maxlength="11" placeholder="手机号码">                              
                                      <!-- <span class="ts_text">此手机号为接收短信所用，作为订购与取票凭证，请准确填写。</span> -->
                                     <span id="init" class="ts_text" zitem="init">此手机号为接收短信所用，作为订购与取票凭证，请准确填写。</span>
                                    </dd> 
                                </dl>
                                   <!--  <dl class="user_dl" ztype="ifUnLogin">
                                        <dt><span class="red">*</span>图片验证码：</dt>
                                        <dd>
                                            <input class="input js_yz" id="picCode" item_type="picCode" type="text" maxlength="4" placeholder="请输入图片验证码">
                                            <em id="picCodeSpan" style="display: inline-block">
                                                <img class="vertical_t" src="http://login.lvmama.com/nsso/account/checkcode.htm?nocache=1541838378397" id="createCheckCode" align="middle" onclick="javascript:reloadPicCode();" width="60" height="30">
                                                <a class="c_09c" href="javascript:void(0);" onclick="reloadPicCode();" hidefocus="false">看不清,换一张</a>
                                            </em>
                                            <span class="error_text" zitem="exception"><i class="tip-icon tip-icon-error"></i>为了验证您的身份，请输入正确的图片验证码或刷新图形验证码重新填写</span>
                                            <span class="error_text" zitem="danger"><i class="tip-icon tip-icon-error"></i>该手机号存在风险,无法返回图片验证码</span>
                                        </dd>
                                    </dl> -->
                                <!--     <dl class="user_dl" ztype="ifUnLogin">
                                        <dt><span class="red" id="dtcode">*</span>短信验证码：</dt>
                                        <dd>
                                            <input class="input" id="mobileCode" item_type="smsCode" type="text" maxlength="6" name="yzm" placeholder="请输入短信验证码">
                                            div class="" id="btnSendSms">发送验证码</div>
                                            <input type="button" value="获取动态验证码" class="btn cbtn-default js_order_yzm" onclick="checkCode()" id="codefr"><br />
                                            <span class="ts_text" zitem="init">（温馨提示：验证有效时间为：15分钟，超出时间请重新获取）</span>
                                            <span class="error_text" zitem="exception"><i class="tip-icon tip-icon-error"></i><em>无效的验证码</em></span>
                                        </dd>
                                    </dl> -->
                                <dl class="user_dl">
                                    <dt><span class="red">*</span>证件类型：</dt>
                                    <dd>
                                        <select class="select" id="idType0" num="0" name="travellers[0].idType">
                                                <option value="ID_CARD">身份证</option>
                                        </select>
                                        <input class="input js_yz" type_name="shenfenzheng" id="idNo0" name="travellers[0].idNo" type="text" placeholder="证件号码">
                                        <span class="ts_text">取票时需出示身份证确认。</span>
                                        <span class="error_text"><i class="tip-icon tip-icon-error"></i>证件错误</span>
                                    </dd>
                                </dl>
                                <dl class="user_dl xb_check" id="xingbieDl0" number_index="0" style="display:none;"></dl>
                                <dl class="user_dl" id="birthdayDl0" number_index="0" style="display:none;"></dl>
                        <dl class="user_dl bx_check" style="display: none;">
                            <dt>&nbsp;</dt>
                            <dd> 
                                <span class="error_text"></span>
                            </dd>
                        </dl>	
                        <h5 class="youwan_tit">游玩人(取票人)</h5>
                    </div>
</div>
</div>
<div id="userinfoDiv">                   

 <!-- <script type="text/javascript" >
	var userStatus=$("#login_user").attr("status");
	if(userStatus&&userStatus==1){
		$("[zType='ifUnLogin']").hide();
		$("#logining").css('display','inline-block');
		$("#unlogin").css('display','none');
        $('#unlogin').remove();
	}else{
		$("#logining").css('display','none');
        $("#logining").remove();
		$("#unlogin").css('display','inline-block');
		if(Number($("#picPopCnt").val())==0){
			var page_picSrc = "http://login.lvmama.com/nsso/account/checkcode.htm";
			document.getElementById("createCheckCode").src = page_picSrc+"?nocache=" + new Date().getTime();
		}	
	}
</script> -->
         <!--  <script type="text/javascript">
          $(function(){
          	var userStatus=$("#login_user").attr("status");
          	if(userStatus&&userStatus==1){
          		$("[zType='ifUnLogin']").hide();
          		$("#logining").css('display','inline-block');
          		$("#unlogin").css('display','none');
          	}else{
          		$("#logining").css('display','none');
          		$("#unlogin").css('display','inline-block');
          		var page_picSrc = "http://login.lvmama.com/nsso/account/checkcode.htm";
          		document.getElementById("createCheckCode").src = page_picSrc+"?nocache=" + new Date().getTime();
          	}
          }); 
          </script> -->
               </div>              
           </div>
           <!--付款按钮-->
           <div class="fk_box">
               <a  id="go" class="btn_fk" hidefocus="false">
					提交订单
               </a>
               <div class="fk_l">
                   <div id="orderPriceDiv" class="fk_jg">
                       <p class="fk_p1">应付总价:<span>
					<input style="width:30px;border:0px" value="￥" readonly> 
					<input id=txtTotal value="0" style="width: 80px;border: 0px" readonly> 
				</span></p>
                   </div>                   
               </div>
           </div>
           
        </form>
<!-- <p class="xieyi_ok mt_40"><label class="check"><input id="check" type="checkbox" class="checkbox" 
    >我已同意以下条款</label></p>
 </div>
 -->
</div>
<script> 
	function checkInt(o){ 
		theV=isNaN(parseInt(o.value))?0:parseInt(o.value); 
		if(theV!=o.value){
			o.value=theV;
		} 
		txtTotal.value=txtAmount.value*txtPrice.value; 
	} 
	function checkP(o){ 
		theV=isNaN(parseFloat(o.value))?0:parseFloat(o.value); 
		theV=parseInt(theV*100)/100; 
		if(theV!=o.value){ 
			theV=(theV*100).toString(); 
			theV=theV.substring(0,theV.length-2)+"."+theV.substring(theV.length-2,theV.length) 
			o.value=theV; 
		} 
		txtTotal.value=txtAmount.value*txtPrice.value; 
	} 
</script> 
 
<!-- <input id=txtAmount value=1 onkeyup="checkInt(this);" onpaste="checkInt(this);" oncut="checkInt(this);" ondrop="checkInt(this);" onchange="checkInt(this);"> 
 --> 
<!-- <input id=txtPrice value=99 onkeyup="checkP(this);" onpaste="checkP(this);" oncut="checkP(this);" ondrop="checkP(this);" onchange="checkP(this);" style="border-right-width:0px;margin-right:0px;"> 
<input style="border-left-width:0px;margin-left:-4px;width:18px" value="￥" readonly> --> 

<!-- <input id=txtTotal value=0 style="border-right-width:0px;margin-right:0px;" readonly> 
<input style="border-left-width:0px;margin-left:-4px;width:18px" value="￥" readonly> -->

<script src="http://s3.lvjs.com.cn/min/index.php?f=js/new_v/jquery-1.7.2.min.js,/js/ui/lvmamaUI/lvmamaUI.js,/js/new_v/top/header-air_new.js,/js/v5/modules/pandora-poptip.js,/js/v6/modules/pandora-calendar.js"></script>
<script src="http://s2.lvjs.com.cn/js/v6/order.js"></script>
<script src="http://www.lvmama.com:80/tnt_order/js/saleTicket/bookTicket.js?verson=201409050001"></script>
<script src="http://www.lvmama.com:80/tnt_order/js/saleTicket/express.js?verson=201408051234"></script>
<script type="text/javascript">
		$("#go").click(function(){	
				var pattern = /^1[34578]\d{9}$/; 
				if($("#visitTimeInput").val()==""||$("#visitTimeInput").val()==null){
					alert("请输入日期")
				}else
				if($("#fullName0").val()==""||$("#fullName0").val()==null){
					alert("请输入姓名")
				}else
				if($("#mobileLoginText").val()==""||$("#mobileLoginText").val()==null||!pattern.test($("#mobileLoginText").val())||$("#mobileLoginText").val().length!=11){
					alert("电话号码错误")
				}else
				if($("#idNo0").val()==""||$("#idNo0").val()==null){
					alert("请输入身份证号")
				}else if($("#txtAmount").val()==0){
					alert("至少需要购买一张")
				}else if($("#txtAmount").val()>5){
					alert("最多购买五张")
				}else if($("#users").val()!=""||$("users").val()!=null){
					if (confirm("你确定提交吗？")) {	
						var user = $("#users").val()
						var visitTimeInput = $("#visitTimeInput").val()
						var fullName0 = $("#fullName0").val()
						var mobileLoginText = $("#mobileLoginText").val()
						var idNo0 = $("#idNo0").val()	
						var txtAmount= $("#txtAmount").val()
						var scenic= $("#scenic").val()
						var txtTotal = $("#txtTotal").val()
						$.ajax({
							url:"addIndent",
							dataType:"json",
							data:{
								user:user,
								visitTimeInput:visitTimeInput,
								fullName0:fullName0,
								mobileLoginText:mobileLoginText,
								idNo0:idNo0,
								txtAmount:txtAmount,
								scenic:scenic,
								txtTotal:txtTotal,
							},
							success:function(data){
								window.location.href="success.jsp"
							},						
						})
						
			        }else{
			        	alert("已取消")
			        	location.reload();
			        }
				}else{
					alert("当前未登录")
					window.location.href="login"
				}
		})
</script>

</body>
</html>