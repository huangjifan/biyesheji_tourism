//用户编号
var userId = $("#userId").val();
//订单编号
var indentId = $("#indentId").val();
//旅游路线名称
var name = $("#name").val();
//路线描述
var description = $("#description").val();
//优惠后的金额
var money = $("#money").val();
$(function(){
	$(".c-title h3").append(name+"("+description+")");
	$(".c-title .price-num dfn").append(money);
	$(".tip-title.tip-title-group dfn").append(money);
});

function payment(){
	
	let pass = userId ?prompt("你需要支付金额的是"+money+"元,请输入你的支付密码",""):
				prompt("你需要支付金额的是"+money+"元,请输入你的微信支付密码","");
	console.log(pass);
	var re = /^[0-9]+$/ ;
	if(!re.test(pass)){
		alert("只能是正整数");
		return;
	}
	$.ajax({
		url: "../../indent/paymentIndent",
		type: "post",
		dataType: "json",
		data: {
			indentId: indentId,
			pass: pass,
		},
		success: function(res){
			console.log(res.success);
			flag = res.success;
			message = res.message;
			alert(message);
			if(flag){
				location.href = "../../index";
			}
		}
	});
}