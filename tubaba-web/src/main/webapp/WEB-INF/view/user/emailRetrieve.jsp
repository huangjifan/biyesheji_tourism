<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>邮箱找回</title>
<link rel="shortcut icon" href="image/favicon.png" type="image/png" />
    <link rel="stylesheet" href="css/header-air.css"/>
    <link rel="stylesheet" href="css/register_new.css"/>
    <link rel="stylesheet" href="css/eamilRetrieve.css">
    <script type="text/javascript" src="js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="js/user/jquery.validate.min.js"></script>
    <script type="text/javascript">
	    function refreshCheckCode(id){
	    	var obj = $('#'+id);
	    	 //获取当前的时间作为参数，无具体意义     
	        var timenow = new Date().getTime();     
	           //每次请求需要一个不同的参数，否则可能会返回同样的验证码     
	        //这和浏览器的缓存机制有关系，也可以把页面设置为不缓存，这样就不用这个参数了。     
	        obj.attr('src','code?d='+timenow);
	        $("#sjRegForm").validate().resetForm();//更换验证码之后重置验证
	    }
	    $(function(){
	    	$('#submitForm').validate({
	    		rules:{
	    			txtUsername:{
	    				required:true,
	    				email:true,
	    				remote:{
	    					type:'get',
	    					url:'/checkEmail',
	    					dataType:"html",
	    					async:false,//默认为异步请求，设置false为同步
	    					data:{
	    						email:function() {
	    			              return $("#sso_email_c").val();
	    			            }
	    					},
	    					dataFilter:function(data,type){
	    						if(data.trim() == 'true'){
	    							return false;
	    						}else{
	    							return true;
	    						}
	    					}
	    				}
	    			},
	    			verifycode:{
	    				required:true,
	    				remote:{
	    					type:'get',
	    					url:'/checkCode',
	    					dataType:"html",
	    					async:false,//默认为异步请求，设置false为同步
	    					data:{
	    						code:function() {
	    			              return $("#sso_verifycode1").val();
	    			            }
	    					},
	    					dataFilter:function(data,type){
	    						if(data.trim() == 'true'){
	    							return true;
	    						}else{
	    							return false;
	    						}
	    					}
	    				}
	    			}
	    		},
	    		messages:{
	    			txtUsername:{
	    				required:'邮箱不能为空',
	    				email:'请输入正确的邮箱',
	    				remote:'邮箱错误,请重新输入'
	    			},
	    			verifycode:{
	    				required:'验证码不能为空',
	    				remote:'验证码错误',
	    			}
	    		},
	    		errorPlacement:function(error, element){
	    	    	   //改变报错信息位置
	    	    	   error.appendTo(element.parent());
	    	       },
	    	       showErrors : function(errorMap, errorList) {
	    	    	   var id;
	    	    	   if(errorList[0] != undefined){
	    	    		   id = $(errorList[0].element).attr('id');
	    	    		   $($('#'+id)).parent().find('label[class="success"]').hide();
	    	    	   }
	    	           // 遍历错误列表
	    	           for(var obj in errorMap) {
	    	               // 自定义错误提示效果
	    	               $('#' + obj).parent().addClass('has-error');
	    	           }
	    	           // 此处注意，一定要调用默认方法，这样保证提示消息的默认效果
	    	           this.defaultShowErrors();
	    	       },
	    	       success:function(label) {
	    	    	   console.log($(label).attr('id').substring(0,$(label).attr('id').lastIndexOf("-")));
	    	    	   $($('#'+$(label).attr('id').substring(0,$(label).attr('id').lastIndexOf("-")))).parent().find('label[class="success"]').show();
	    	       }
	    	})
	    	
	    	
	    	 /* $('input').keyup(function(){//键盘松开时验证
	    		if($(this).data('previousValue') != undefined && $(this).attr('id')  == 'sso_verifycode1'){
	    			$(this).data('previousValue').old = $(this).val();
	    		}
	    		if($("#submitForm").validate().element($(this)) && $(this).attr('id')  == 'sso_verifycode1' && $(this).data('previousValue') != undefined && $(this).data('previousValue').valid == true){
	    			$(this).parent().find('label[class="success"]').show();
	    		}else if($("#submitForm").validate().element($(this)) && $(this).attr('id')  != 'sso_verifycode1'){
	    			$(this).parent().find('label[class="success"]').show();
	    		}else{
	    			$(this).parent().find('label[class="success"]').hide();
	    		}
	    	}); 
	    	$('input').blur(function(){//失去焦点时验证
	    		if($("#submitForm").validate().element($(this))){
	    			$(this).parent().find('label[class="success"]').show();
	    		}
	    	}); */
	    	
	    	$('#submitBtn').click(function(){
	    		if($('#submitForm').valid()){
	    			$('#submitForm').submit();
	    		}
	    	})
	    })
    </script>
</head>
<body class="regist_body">
<div id="login_main" class="login_main">
    <div class="login_top zhfs_logo_top">
			<span class="login_logo">
				<a href=""><img src="image/login_logo.jpg"></a> <label class="text">|</label> <a class="text">重置密码</a>
			</span>
        <span class="login_hotline">1010-6060</span>
    </div>

    <div class="register_center">
        <ul class="zhfs_step">
            <li><i>3</i><label class="zhfs_step_text">新密码设置成功</label></li>
            <li class="curr"><i>2</i><label class="zhfs_step_text">设置新密码</label><em class="zhfs_jiao"></em></li>
            <li><i class='oneround'>1</i><label class="zhfs_step_text">选择找回密码方式</label><em class="zhfs_jiao"></em></li>
        </ul>
        <form action="emailSubmit" method="get" id="submitForm">
            <div class="zhfs_t_left">邮箱找回密码</div>
            <ul class="zhfs_form yxzh_form">
                <li><label class="csmm_form_col">Email</label>
                    <input type="text" class="zhfs_form_input" id="sso_email_c" name="txtUsername" value=""/>
                	<label class="success" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                </li>
                <li>
                    <label class="csmm_form_col">验证码</label><input type="text" name="verifycode" class="zhfs_form_input zhfs_w99" id="sso_verifycode1"/>
                    <img id="image_code" style="height:30px;width:80px;" src="code" /><a href="#" id="image_code" class="link_blue" onClick="refreshCheckCode('image_code');return false;">换一张</a>
                	<label class="success" style="display:none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                </li>
                <li><label class="csmm_form_col"></label><a href="javascript:void(0)" class="csmm_sj_submit" id="submitBtn"></a></li>
            </ul>
        </form>
    </div>
</div>

<!-- <script src="js/index.php.js" type="text/javascript"></script>
<script type="text/javascript" src="js/register.validate.js"></script>
<script src="js/eluminate.js"></script>
<script src="js/coremetrics-initalize.js"></script>
<script type="text/javascript" src="js/frms-fingerprint.js"></script>
<script src="js/losc.js" language="javascript"></script> -->

<!-- 公共底部  -->
<!-- footer\ -->
<div class="wrap" style="clear: both;">
<a class="public_ft" href="" target="_blank">
<ul class="public_ft_list"><li><i class="ft_ioc1"></i>
<strong>价格保证</strong>同类产品，保证低价</li><li><i class="ft_ioc2">
</i><strong>退订保障</strong>因特殊情况影响出行，保证退订</li><li>
<i class="ft_ioc3"></i><strong>救援保障</strong>旅途中遇意外情况，保证援助</li>
<li><i class="ft_ioc4"></i><strong>7x24小时服务</strong>快速响应，全年无休</li>
</ul></a></div>
<!-- copyright\ -->
<div class="lv-footer clearfix wrap" style="margin:0 auto;">   
 <p class="footer-link">      
  <a href="http://www.lvmama.com/public/about_lvmama" rel="nofollow">关于我们</a> |
 <a href="http://www.lvmama.com/public/lianxi_us" rel="nofollow">联系我们</a> | 
 <a href="http://www.lvmama.com/public/site_map">网站地图</a> |
 <a href="http://hotels.lvmama.com/brand/">酒店品牌</a> | 
<a href="http://hotels.lvmama.com/area/">酒店查询</a> | 
<a href="http://www.lvmama.com/public/help" rel="nofollow">帮助中心</a> |
<a href="http://www.lvmama.com/public/links">友情链接</a> | 
<a href="http://www.lvmama.com/public/jobs" rel="nofollow">诚聘英才</a> |
<a href="http://www.lvmama.com/public/zizhi_lvmama" rel="nofollow">旅游度假资质</a> |
<a href="http://www.lvmama.com/userCenter/user/transItfeedBack.do" rel="nofollow">意见反馈</a> |
<a rel="nofollow" href="http://www.lvmama.com/public/adwy">广告业务</a>
</p>
<p class="lv-copyright">Copyright © 2018 www.lvmama.com. 上海景域文化传播股份有限公司版权所有
<a href="http://www.miitbeian.gov.cn" target="_blank" rel="nofollow">沪ICP备13011172号-3</a>
增值电信业务经营许可证编号：<a rel="nofollow" href="http://pic.lvmama.com/img/ICP.jpg" target="_blank">
沪B2-20100030</a></p>
<div class="lv-safety">
<a class="safety2" target="_blank" rel="nofollow" title="经营性网站备案信息" href="http://www.miibeian.gov.cn/"></a>
<a class="safety3" target="_blank" rel="nofollow" title="网络110报警服务" href="http://www.cyberpolice.cn"></a>
<a class="safety4" target="_blank" rel="nofollow" title="支付宝特约商家"></a>
<a class="safety5" target="_blank" rel="nofollow" title="AAA级信用企业" href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1664396140"></a>
<a class="safety6" target="_blank" rel="nofollow" title="上海工商" href="http://www.sgs.gov.cn/lz/licenseLink.do?method=licenceView&amp;entyId=20110930103539539"></a>
<a class="safety7" target="_blank" rel="nofollow" title="可信网站" href="https://ss.knet.cn/verifyseal.dll?sn=2010101800100002662&amp;comefrom=trust&amp;trustKey=dn&amp;trustValue=www.lvmama.com"></a>
<a class="safety8" target="_blank" rel="nofollow" title="诚信认证示范企业" href="https://credit.szfw.org/CX20160614015657160455.html" id="___szfw_logo___" hidefocus="false"></a>
<a class="safety9" target="_blank" rel="nofollow" title="网络社会征信网" href="http://www.zx110.org"></a>
<a class="safety10" target="_blank" rel="nofollow" title="360网站安全检测" href="http://webscan.360.cn"></a>
<a class="safety11" target="_blank" rel="nofollow" title="网监安全" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=31010702001030"></a>
<a class="safety13" target="_blank" rel="nofollow" title="举报中心" href="http://www.shjbzx.cn/"></a>
</div>
</div>
<script type="text/javascript" src="https://dfp.lvmama.com/public/downloads/frms-fingerprint.js?custID=dfp&amp;serviceUrl=https://dfp.lvmama.com/public/generate/jsonp"></script>
<div class="complete_box" style="display:none"><ul class="complete_list"></ul></div><div class="complete_box_hotel hotelDestBox" style="display:none"></div><div class="complete_box_hotel hotelKeywordBox" style="display:none"></div><div class="complete_error_tips" style="display:none;"><span>找不到目的地：</span><span class="word"></span><i>×</i></div><div id="right-bottom-tools"></div><div id="userdata_el" style="visibility: hidden; position: absolute;"></div></body>
</html>