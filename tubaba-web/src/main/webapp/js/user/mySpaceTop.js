$(function(){
	$("#lv_newaccount").mouseover(function(){
		move();
		
	});
	$("#lv_newaccount").mouseout(function(){
		move();
	})
})
function move(){
	if ($("#lv_newaccount").attr("class")=="newmember_list") {
		$("#lv_newaccount").attr("class","newmember_list newmember_act");
	}
	else {
		$("#lv_newaccount").attr("class","newmember_list");
	}
}