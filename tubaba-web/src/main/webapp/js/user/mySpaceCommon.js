$(function(){
	var userid=$("#userid").val()
	if (userid != undefined) {
		var type=$("#type").val();
		if (type=='ddp') {
			$("#ddp").attr("class","cmtTab-li active current");
			$("#ydp").attr("class","cmtTab-li");
		}
		else {
			$("#ddp").attr("class","cmtTab-li active");
			$("#ydp").attr("class","cmtTab-li current");
		}
	}
	else {
		alert("没有登录");
	}
})

//在Jquery里格式化Date日期时间数据
function format(time){
    var datetime = new Date();
    datetime.setTime(time);
    var year = datetime.getFullYear();
    var month = datetime.getMonth() + 1 < 10 ? "0" + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
    var date = datetime.getDate() < 10 ? "0" + datetime.getDate() : datetime.getDate();
    /*var hour = datetime.getHours()< 10 ? "0" + datetime.getHours() : datetime.getHours();
    var minute = datetime.getMinutes()< 10 ? "0" + datetime.getMinutes() : datetime.getMinutes();
    var second = datetime.getSeconds()< 10 ? "0" + datetime.getSeconds() : datetime.getSeconds();*/
    return year + "-" + month + "-" + date/*+" "+hour+":"+minute+":"+second*/;
}