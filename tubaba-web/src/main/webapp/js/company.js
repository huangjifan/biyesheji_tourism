function showCity(){
	var node=$('#city');
	if(node.is(':hidden')){　　//如果node是隐藏的则显示node元素，否则隐藏
	　　node.show();　
	}else{
	　　node.hide();
	}
}
function searchBoxChangeCity(id,area){
	//console.log("搜索框左侧的切换城市");
	searchBoxChangeCityCommonalityFunction($("#cityname"),id,area);
	//隐藏搜索框左侧的切换城市面板
	hideSearchBoxChangeCity();
}
function searchBoxChangeCityCommonalityFunction(root,id,area){
	//console.log(root);
	root.val(area);
	root.attr({
		cid: id
	});
}

function hideSearchBoxChangeCity(){
	//console.log("隐藏搜索框左侧的切换城市面板");
	$(".search_city").removeClass("search_city_hover");
}
function findcity(root,val){
	//console.log("显示搜索框左侧的切换城市的按字母展示面板");
	//console.log("val:"+val);
	li = $(root).children("li");
	//console.log(li);
	letter = $(root).next("ul").children(".search-station-cities-pane"); 
	
	for(i = 0;i < li.length;i++){
		if(val == i){
			//console.log("xxx:"+i);
			$(li.get(i)).addClass("active");
			//隐藏字母开头的城市
			$(letter.get(i)).addClass("active");
		}else{
			//console.log("yyy:"+i);
			$(li.get(i)).removeClass("active");
			//展示字母开头的城市
			$(letter.get(i)).removeClass("active");
		}
	}
}


function toCity(){	
	var node=$('#multiple');
	if(node.is(':hidden')){　　//如果node是隐藏的则显示node元素，否则隐藏
		　　node.show();　
		}else{
		　　node.hide();
		}
	
	$.ajax({
        url: '/address/queryAddressAll',
        dataType: "json",
        success:function(result){
       	 if(result.length) {      
                allCities = result;
            }
            var allData = allCities.concat(result);
           // console.log(allData)
            for (var i = 0; i < allData.length; i++) {
	           	if (allData[i].upid!=0) {
	           		 cityName = allData[i].area
	           		 $('#multiple').append('<option value='+i+' onclick="writhCity()">'+cityName+'</option>')       		
	           	}
        	}  
           
        }
    }) 
}
function writhCity(){
     b = $("#multiple option:checked").text();
     $("#textdb").val(b);
     $('#multiple').hide();
}


function showIdent(){
	var cityname = $("#cityname").val()
	var city = $("#multiple option:checked").text();
	var end = $("#datemin").val()
	var start = $("#datemax").val()
	var people = $("#people").val()
	var yusuan = $("#yusuan").val()	
	if(city == ""||city==null){
		$("#cityerror").show()
	}else{
		$("#cityerror").hide()
	}
	if(start == ""||start ==null){
		$("#starterror").show()
	}else{
		$("#starterror").hide()
	}
	if(end==""||end==null){
		$("#enderror").show()
	}else{
		$("#enderror").hide()
	}
	if(people==""||people==null||people==0){
		$("#peopleerror").show()
	}else{
		$("#peopleerror").hide()
	}
	if(yusuan==""||yusuan==null){
		$("#yusuanerror").show()
	}else{
		$("#yusuanerror").hide()
	}
	if(city!=""&&city!=null&&start != ""&&start !=null&&end!=""&&end!=null&&people!=""&&people!=null&&people!=0&&yusuan!=""&&yusuan!=null){
		$("#more").show()
	}	
	
	var xinxi =[cityname,city,start,end,people,yusuan]
	return xinxi;
}
function end(){
	if($("#datemin").val()==""||$("#datemin").val()==null){
		$("#enderror").show()
	}else{
		$("#enderror").hide()
	}
}
function start(){
	if($("#datemax").val()==""||$("#datemax").val()==null){
		$("#starterror").show()
	}else{
		$("#starterror").hide()
	}
}
function youwang(){
	if($("#people").val()==""||$("#people").val()==null){
		$("#peopleerror").show();
	}else{
		$("#peopleerror").hide();
	}	
}

function yusuans(){
	if($("#yusuan").val().length<1){
		$("#yusuanerror").show();
	}else{
		$("#yusuanerror").hide();
	}	
}

function hidemore(){
	$("#more").hide()
}

function man(){
	var manname = $("#manname").val()
	if(manname==""||manname==null){
		$("#nameerror").css("color","red").html("请不要为空")
	}else {
		$("#nameerror").hide()
	}
}
function phone(){
	var phone = $("#phone").val()
		var pattern = /^1[34578]\d{9}$/; 
	if(phone==""||phone==null){
		$("#phoneerror").css("color","red").html("请输入手机号码")
	}else if(phone.length !=11){
		$("#phoneerror").css("color","red").html("电话号码为11位")
	}else if(!pattern.test(phone)){
		$("#phoneerror").css("color","red").html("电话号码格式错误")
	}else if(pattern.test(phone)){
		$("#phoneerror").hide()
	}
}
function email(){
	var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;  
	var email = $("#email").val()
	if(email==""||email==null){
		$("#emailerror").css("color","red").html("请输入邮箱")
	}else if(!myreg.test(email)){
		$("#emailerror").css("color","red").html("请输入正确的邮箱")
	}else if(myreg.test(email)){
		$("#emailerror").hide()
	}
}

function cmCreateElementTag(tag){
	if(tag=="亲子游学"){
		$("#qinzi").addClass("active")
		$("#zangdi").removeClass("active")
		$("#hot").hide()
		$("#tags").show()
		
	}else if(tag=="藏地天堂"){
		$("#zangdi").addClass("active")
		$("#qinzi").removeClass("active")
		$("#tags").hide()
		$("#hot").show()
	}
}
function submit(){
	var manname = $("#manname").val()
	if(manname==""||manname==null){
		$("#nameerror").css("color","red").html("请不要为空")
	}else {
		$("#nameerror").hide()
	}
	var phone = $("#phone").val()
	var pattern = /^1[34578]\d{9}$/; 
	if(phone==""||phone==null){
		$("#phoneerror").css("color","red").html("请输入手机号码")
	}else if(phone.length !=11){
		$("#phoneerror").css("color","red").html("电话号码为11位")
	}else if(!pattern.test(phone)){
		$("#phoneerror").css("color","red").html("电话号码格式错误")
	}else if(pattern.test(phone)){
		$("#phoneerror").hide()
	}
	var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;  
	var email = $("#email").val()
	if(email==""||email==null){
		$("#emailerror").css("color","red").html("请输入邮箱")
	}else if(!myreg.test(email)){
		$("#emailerror").css("color","red").html("请输入正确的邮箱")
	}else if(myreg.test(email)){
		$("#emailerror").hide()
	}
	var username = $("#username").val()
	if(manname!=""&&phone!=""&&pattern.test(phone)&&myreg.test(email)&&email!=""){
		
		var cityname = showIdent()[0]
		var city = showIdent()[1]
		var start = showIdent()[2]
		var end = showIdent()[3]
		var people = showIdent()[4]
		var yusuan = showIdent()[5]
		if(username!=""&&username!=null){
			$.ajax({
				url:"addCoustom",
				dataType:"json",
				data:{
					startcity:cityname,
					endcity:city,
					start:start,
					end:end,
					people:people,
					budget:yusuan,
					name:manname,
					phone:phone,
					email:email,
					username:username,
				},
				success:function(data){
					alert("提交成功,请耐心等候给您的制定计划")
					location.reload();
				},
				error:function(){
					alert("提交失败")
					location.reload();
				},
			})
		}else{
			alert("当前未登录")
			window.location.href="login"
		}
	}
}
/*function myCustom(){
	var username = $("#username").val()	
	if(username!=""&&username!=null){
		$.ajax({
			url:"queryUsername",
			dataType:"json",
			data:{
				username:username
			},
			success:function(data){
				
			},
			error:function(data){
				alert("加载失败")
			}
		})
	}else{
		alert("当前未登录")
		window.location.href="login"
	}
}
*/
/*$(function(){
	//获取所有城市数据
	 $.ajax({
         url: '/address/queryAddressAll',
         dataType: "json",
         success:function(result){
        	 if(result.length) {
                 allCities = result;
             }
             var allData = allCities.concat(result);
            // console.log(allData)
             for (var i = 0; i < allData.length; i++) {
            	if (allData[i].upid!=0) {
            		 cityName = allData[i].area
            		 $('.form-control').append('<option>'+cityName+'</option>')
				}                
                
             }
             $('.form-control-chosen').chosen({
                 allow_single_deselect: true,
                 no_results_text: "没有找到",
                 max_selected_options:6,
                 placeholder_text_single:'1e',
                 width: '100%'
             });

             $(".form-control-chosen").bind("chosen:maxselected",function (e) {
                 $(this).siblings('.error-message').show();
                 $(this).siblings('.error-message').find('.error-message-con').html('<i class="nova-icon-xs nova-icon-warning"></i>最多可选择6个城市')
                 return;
             });
         }
     })
})
        $(document).bind("click",function(e){
            if($(e.target).closest(".js-select,.JS_start_address,.js_all_city,.js-drop").length == 0){
                $('.js-drop,.js_all_city').hide();
                $('.js-select,.js_s_city_btn,.js_all_city').addClass('on')
            }
        })

        $(document).on('click', '.js-select,.js_all_city', function(e) {
            var This = $(this);
            if (This.hasClass('on')) {
                This.find('.js-drop').show();
                This.removeClass('on')
            }else{
                This.find('.js-drop').hide()
                This.addClass('on')
            };

        });
        //游玩人数
        $(document).on('click', '.js-drop li', function(event) {
            var This = $(this),
                oEm = This.find('em');
            This.addClass('oactive').siblings().removeClass('oactive')
            for (var i = 0; i < This.length; i++) {
                var oText = oEm.eq(i).text()
                This.parent().siblings('input').val(oText).trigger('change');
                if(This.parent().siblings('b').length>0){
                    This.parent().siblings('b').html(oText)
                }
            };
        });

        function dropHide (){
            $('.js-drop').hide();
            $('.js-select,.js_s_city_btn,.js_all_city').addClass('on')
        }


        // 日历
        $(".timeInfo").click(function (e) {
            var event = e || window.event;

            //IE用cancelBubble=true来阻止而FF下需要用stopPropagation方法
            event.stopPropagation ? event.stopPropagation() : (event.cancelBubble = true);

            var $input = $(this).siblings("input.J_calendar");
            $input.focus();
            $input.click();

        });

        function selectDateCallback() {
            var $input = this.$trigger;
            $input.change();
            var weekText = this.getDayOfWeek();
            $input.siblings(".timeInfo").find('i').html(weekText);

        }
        window.lvCalendar = lv.calendar({
            autoRender: false,
            trigger: ".J_calendar",
            triggerEvent: "click",
            bimonthly: true,
            template: "small",
            cascading: true,
            showNumberOfDays: true,
            // cascadingMax: 20,  //起始与结束日期最大范围
            monthNext:-1,
            zIndex: 21,
            cascadingMin: 0,
            selectDateCallback:selectDateCallback,
            completeCallback:function () {
                dropHide ()
            }
        });
        window.lvCalendar1 = lv.calendar({
            autoRender: false,
            trigger: ".J_calendar1",
            triggerEvent: "click",
            bimonthly: true,
            template: "small",
            cascading: true,
            showNumberOfDays: true,
            // cascadingMax: 20,  //起始与结束日期最大范围
            monthNext:-1,
            zIndex: 21,
            cascadingMin: 0,
            selectDateCallback:selectDateCallback,
            completeCallback:function () {
                dropHide ()
            }

        });


        //个人右侧验证规则
        var rightPersonValidate = nova.validate({
            rules: {
                ".JS_non_empty": {
                    "required": true,
                    "required-message": "请不要为空。"
                },
                ".JS_non_empty_order": {
                    "required": true,
                    "required-message": "您填写的订单信息有误，请核实后重新填写。"
                },
                ".JS_mobile": {
                    "required": true,
                    "required-message": "请输入手机号码。",
                    "minlength": 11,
                    "minlength-message": "手机号码必须为11位的数字，请重新输入",
                    "mobile": true
                },
                ".JS_email": {
                    "required": true,
                    "required-message": "请输入邮箱地址。",
                    "email": true
                },
            },
            validateCallback: function (ret, val, $input, errorMessage) {

                var $parent = $input.parent();
                var $tsText = $parent.find(".ts_text");
                var $errorText = $parent.find(".error_text");
                var $successText = $parent.find(".success_text");
                if ($successText.length < 1) {
                    $successText = $('<span class="nova-tip-form success_text"><span class="nova-icon-xs nova-icon-success"></span></span>')
                    $parent.append($successText)
                }

                if (ret) {
                    $tsText.hide();
                    $errorText.hide();
                    $successText.css("display", "inline-block");

                } else {
                    $successText.hide();
                    $tsText.hide();
                    $errorText.html('<span class="nova-icon-xs nova-icon-error"></span>' + errorMessage);
                    $errorText.css("display", "inline-block");
                }
                $successText.hide();
            }
        });
        //企业右侧验证规则
        var rightCompanyValidate = nova.validate({
            rules: {
                ".JS_non_empty1": {
                    "required": true,
                    "required-message": "请不要为空。"
                },
                ".JS_non_empty_order1": {
                    "required": true,
                    "required-message": "您填写的订单信息有误，请核实后重新填写。"
                },
                ".JS_mobile1": {
                    "required": true,
                    "required-message": "请输入手机号码。",
                    "minlength": 11,
                    "minlength-message": "手机号码必须为11位的数字，请重新输入",
                    "mobile": true
                },
                ".JS_email1": {
                    "required": true,
                    "required-message": "请输入邮箱地址。",
                    "email": true
                },
            },
            validateCallback: function (ret, val, $input, errorMessage) {

                var $parent = $input.parent();
                var $tsText = $parent.find(".ts_text");
                var $errorText = $parent.find(".error_text");
                var $successText = $parent.find(".success_text");
                if ($successText.length < 1) {
                    $successText = $('<span class="nova-tip-form success_text"><span class="nova-icon-xs nova-icon-success"></span></span>')
                    $parent.append($successText)
                }
                if (ret) {
                    $tsText.hide();
                    $errorText.hide();
                    $successText.css("display", "inline-block");
                } else {
                    $successText.hide();
                    $tsText.hide();
                    $errorText.html('<span class="nova-icon-xs nova-icon-error"></span>' + errorMessage);
                    $errorText.css("display", "inline-block");
                }
                $successText.hide();
            }
        });

        //组装提交数据
        function buildingData(type){
            var parent;
            var arr = [];
            if(type=="company"){
                parent = $(".form-compay-box");
            }else{
                parent = $(".form-per-box");
            }
            parent.find("input[name='customType'],input[name='subStation'],input[name='starting'],input[name='startTime'],input[name='endTime'],input[name='playDays'],input[name='peopleNumber'],input[name='travelBudget'],input[name='contacts'],input[name='areaCode'],input[name='phone'],input[name='email'],input[name='customType'], .other-needs").each(function(){
                if(this.name == "remark"){
                    var remark = this.value;
                    //去除html标签
                    remark=remark.replace(/<\/?.+?>/g,"");
                    // 特殊符号：%,&处理
                    remark = remark.replace(/%/g, '%25');
                    remark = remark.replace(/&/g, '%26');
                    arr.push(this.name+'='+remark);
                }else{
                    arr.push(this.name+'='+this.value);
                }
            });
            var destination = '';
            parent.find("ul.chosen-choices li.search-choice span").each(function () {
                destination += $(this).text()+",";
            });
            arr.push('destination=' + destination.substr(0,destination.length-1));
            var traffic = "";
            parent.find(".traffic").each(function () {
                traffic += $(this).val()+",";

            });
            arr.push('traffic=' + traffic.substr(0,traffic.length-1));
            var hotel = "";
            parent.find(".hotel").each(function () {
                hotel += $(this).val()+",";
            });
            arr.push('hotel=' + hotel.substr(0,hotel.length-1));

            if(type=="company"){
                parent.find("input[name='companyName']").each(function(){
                    arr.push(this.name+'='+this.value);
                });
                var playTypes = "";
                parent.find(".playTypes").each(function(){
                    playTypes += $(this).val()+",";

                });
                arr.push('playTypes='+playTypes.substr(0,playTypes.length-1));
                var dinner = "";
                parent.find(".dinner").each(function(){
                    dinner += $(this).val()+",";

                });
                arr.push('dinner='+dinner.substr(0,dinner.length-1));
            }
            var data = arr.join("&");
            return data;
        }
        //个人定制游提交

        $(".js-submit-btn").on("click", function () {
            //提交按钮disabled
            var validated = rightPersonValidate.getValidate();
            if(validated){
                $(".js-submit-btn").text("定制提交中").attr("disabled","disabled").css("background","#FFC37F");
                var type = $(".form-tab").find("li.active").attr("data-type");
                var data = buildingData(type);
                console.log(data)
                //提交数据
                saveCustom(data);
            }

        });
        //企业定制游提交

        $(".js-submit-btn1").on("click", function () {
            //提交按钮disabled
            var validated = rightCompanyValidate.getValidate();
            if(validated){
                $(".js-submit-btn1").text("定制提交中").attr("disabled","disabled").css("background","#FFC37F");
                var type = $(".form-tab").find("li.active").attr("data-type");
                var data = buildingData(type);
                //提交数据
                saveCustom(data);
            }
        });

        var saveCustomJosnObj={};
        function saveCustom(data){
            saveCustomJosnObj.saveData =data;
            //先判断登陆
            $.getJSON(
               
                {},
                function(re){
                    if(re.success){
                        longinCallback();
                    }else{
                        showLogin(longinCallback);
                        $(".login_dialog").on('click',' a.dialog-close',function(){
                            //先判断登陆
                            console.log(1111);
                            $.getJSON(
                               
                                {},
                                function(re){
                                    if(re.success){
                                    }else{
                                        var type = $(".form-tab").find("li.active").attr("data-type");
                                        if(type=="company"){
                                            $(".js-submit-btn1").removeAttr("disabled").text("提交定制需求").css("background","#f60");
                                        }else{
                                            $(".js-submit-btn").removeAttr("disabled").text("提交定制需求").css("background","#f60");
                                        }

                                    }
                                }
                            );
                        });
                        return false;
                    }
                }
            );
        }
        //未登录成功后调用函数
        function longinCallback() {
            $.ajax({
                url: '',
                type: 'post',
                dataType: 'json',
                data: saveCustomJosnObj.saveData,
                success:function (result) {
                    var type = $(".form-tab").find("li.active").attr("data-type");
                    if(type=="company"){
                        $(".js-submit-btn1").removeAttr("disabled").text("提交定制需求").css("background","#f60");
                    }else{
                        $(".js-submit-btn").removeAttr("disabled").text("提交定制需求").css("background","#f60");
                    }
                    if (result.code==1) {
                        //成功弹出层
                        nova.dialog({
                            showClose: false,
                            content: "我们的工作时间为：周一~周五（09:00~18:00）</br>非工作时间，定制师会在24小时内联系您",
                            okCallback: function (){
                                window.location.href='http://www.lvmama.com/company';
                            },
                            cancelCallback:function (){
                                window.location.href='http://www.lvmama.com/company/myCustom.do';
                            },
                            okText: "我知道了",  //确定按钮文本
                            cancelText: "查看订单",  //取消按钮文本
                            wrapClass: "opp-tip-warp",  //弹窗class
                            zIndex:99,
                            title: "<h4>提交成功</h4>"
                        });
                    } else if (result["message"] != null) {
                        alert(result["message"]);
                    } else {
                        alert("提交失败，请稍后再试..");
                    }
                }
            });
        }

        //左侧个人验证规则
        var leftValidate = nova.validate({
            target: ".form-per-box .form-content-list",
            rules: {
                ".JS_non_empty": {
                    "empty_address": true
                },
                ".JS_start_address": {
                    "start_address": true
                },
                ".JS_end_address": {
                    "end_address": true
                },
                ".JS_Num_address": {
                    "empty_Num": true
                },
                ".JS_per_address": {
                    "empty_per": true
                }
            },
            //对组件进行扩展
            expandMethods: {
                //地址
                start_address: function (value, $element) {
                    var startLen = $element.find('b').text().length;
                    if (startLen == 0) {
                        $element.siblings('.error-message').show();
                        return false;

                    } else {
                        $element.siblings('.error-message').hide();
                    };
                    return true;
                },
                end_address: function (value, $element) {
                    var startLen = $element.siblings('.chosen-container').find('.search-choice').length;
                    if (startLen == 0) {
                        $element.siblings('.error-message').show();
                        return false;
                    }else {
                        $element.siblings('.error-message').hide();
                    };
                    return true;
                },
                empty_address: function (value, $element) {
                    var startLen = $element.val().length;
                    if (startLen == 0) {
                        $element.parents().siblings('.error-message').show();
                        return false;
                    } else {
                        $element.parents().siblings('.error-message').hide();
                    };
                    return true;
                },
                empty_Num: function (value, $element) {
                    var startLen = $element.val().length;
                    if ($element.val() == 0 ||startLen == 0) {
                        $element.siblings('.error-message').show();
                        return false;
                    } else {
                        $element.siblings('.error-message').hide();
                    };
                    return true;
                },
                empty_per: function (value, $element) {
                    var startLen = $element.val().length;
                    if ($element.val() == 0 || startLen == 0) {
                        $element.siblings('.error-message').show();
                        return false;
                    } else {
                        $element.siblings('.error-message').hide();
                    };
                    return true;
                }
            },
            validateCallback: function (ret, val, $input, errorMessage) {
                var $parent = $input.parent();
                var $tsText = $parent.find(".ts_text");
                var $successText = $parent.find(".success_text");
                $successText.hide();
            }
        });
        //个人定制填写更多信息
        $(".js-free-per-btn").on("click", function () {
            var validated = leftValidate.getValidate();
            if (validated) {
                $(this).parents('.form-btn-box').siblings('.more-form-box').show();
            };
        });
        //左侧公司验证规则
        var leftCompanyValidate = nova.validate({
            target: ".form-compay-box .form-content-list",
            rules: {
                ".JS_non_empty1": {
                    "empty_address": true
                },
                ".JS_start_address1": {
                    "start_address": true
                },
                ".JS_end_address1": {
                    "end_address": true
                },
                ".JS_Num_address1": {
                    "empty_Num": true
                },
                ".JS_per_address1": {
                    "empty_per": true
                }
            },
            //对组件进行扩展
            expandMethods: {
                //地址
                start_address: function (value, $element) {
                    var startLen = $element.find('b').text().length;
                    if (startLen == 0) {
                        $element.siblings('.error-message').show();
                        return false;
                    } else {
                        $element.siblings('.error-message').hide();
                    };
                    return true;
                },
                end_address: function (value, $element) {
                    var startLen = $element.siblings('.chosen-container ').find('.search-choice').length;
                    if (startLen == 0) {
                        $element.siblings('.error-message').show();
                        return false;
                    }else {
                        $element.siblings('.error-message').hide();
                    };
                    return true;
                },
                empty_address: function (value, $element) {
                    var startLen = $element.val().length;
                    if (startLen == 0) {
                        $element.parents().siblings('.error-message').show();
                        return false;
                    } else {
                        $element.parents().siblings('.error-message').hide();
                    };
                    return true;
                },
                empty_Num: function (value, $element) {
                    var startLen = $element.val().length;
                    if ($element.val() ==0 || startLen == 0) {
                        $element.siblings('.error-message').show();
                        return false;
                    } else {
                        $element.siblings('.error-message').hide();
                    };
                    return true;
                },
                empty_per: function (value, $element) {
                    var startLen = $element.val().length;
                    if ($element.val() == 0 ||startLen == 0) {
                        $element.siblings('.error-message').show();
                        return false;
                    } else {
                        $element.siblings('.error-message').hide();
                    };
                    return true;
                }
            },
            validateCallback: function (ret, val, $input, errorMessage) {
                var $parent = $input.parent();
                var $tsText = $parent.find(".ts_text");
                var $successText = $parent.find(".success_text");
                $successText.hide();
            }
        });
        //企业定制填写更多信息
        $(".js-company-per-btn").on("click", function () {
            var validated = leftCompanyValidate.getValidate();
            if (validated) {
                $(this).parents('.form-btn-box').siblings('.more-form-box').show();
            };

        });

        //更多定制需求选中事件
        $(document).on('click', '.js-btn', function(event) {
            var This = $(this);
            var name = $(this).parent().find("label").attr("data-name");
            var value = $(this).attr("data-value");

            if(value =="not" || value=="none"){
                This.addClass('active').siblings().removeClass('active');
                $(this).parent().find("input").remove();
                input = "<input type='hidden' class='"+name+"' name='"+name+"' value='"+value+"'/>";
                $(this).parent().append(input);
            }else{
                if(This.siblings("a[data-value='not']").has('active')){
                    This.siblings("a[data-value='not']").removeClass('active');
                    $(this).parent().find("input[value='not']").remove();
                }
                if(This.siblings("a[data-value='none']").has('active')){
                    This.siblings("a[data-value='none']").removeClass('active');
                    $(this).parent().find("input[value='none']").remove();
                }
                if (This.hasClass('active')) {
                    This.removeClass('active');
                    $(this).parent().find("input[value='"+value+"']").remove();
                }else{
                    This.addClass('active')
                    //添加input框
                    var input = "<input type='hidden' class='"+name+"' name='"+name+"' value='"+value+"'/>";
                    $(this).parent().append(input);
                };
            }
        });

        //关闭更多填写
        function closeMoreInput(){
            $('.more-form-box').hide()
            $('.js-free-per-btn').show();
        }
        //关闭详细定制弹框
        $(document).on('click', '.form-close', function(event) {
            closeMoreInput()
        });

        //个人定制和企业定制切换
        $(document).on('click', '.js-from-tab li', function(event) {
            var This = $(this),
                oNum = This.index();
            This.addClass('active').siblings().removeClass('active');
            This.parent().siblings('.form-content').eq(oNum).show().siblings('.form-content').hide()
            closeMoreInput()
        });

        function scenicotourHide() {
            $(".scenictour_search_hot").hide();
        }

        $(".js_s_city_btn").on("click", function () {
            var This = $(this);
            if (This.hasClass('on')) {
                This.removeClass('on')
                This.siblings('.js_all_city').show();
            }else{
                This.addClass('on')
                This.siblings('.js_all_city').hide();
            };

            lvCalendar.destroy()
            lvCalendar1.destroy()
            $('.js-drop').hide();
            $('.js-select').addClass('on');
        });
        //出发地选择
        var $cityComplete = $('.form-content-list .js_all_city');
        $cityComplete.on('click','a',function(){
            var $this = $(this),
                val = $(this).text();
            var p = $this.parents('.js_all_city').siblings('.js_s_city_btn');
            p.find('b').text(val);
            p.find('input[name=starting]').val($this.attr("data-name"));
            $cityComplete.hide();
            $cityComplete.siblings('.js_s_city_btn').addClass('on');
            $this.parents().siblings('.error-message').hide();
        });
    })
*/      