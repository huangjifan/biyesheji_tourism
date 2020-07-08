//显示APP扫码下载图片
function showShopAppDownloadImage(){
	//console.log("显示APP扫码下载图片");
	$(".global-apphide.JS_global-sider-hide").show();
}
//隐藏APP扫码下载图片
function hideShopAppDownloadImage(){
	//console.log("隐藏APP扫码下载图片");
	$(".global-apphide.JS_global-sider-hide").hide();
}
//显示注册活动图片
function showRightSidebarRegisterImage(){
	//console.log("显示注册活动图片");
	$("#rightSidebarRegister").show();
}
//隐藏注册活动图片
function hideRightSidebarRegisterImage(){
	//console.log("隐藏注册活动图片");
	$("#rightSidebarRegister").hide();
}
//返回顶部
function goBackToTop(){
	//console.log("返回顶部");
	$("html,body").animate({scrollTop:0},'slow');
}
//显示右侧边栏
function showRightSidebar(){
	//console.log("显示右侧边栏");
	$(".JS_open-sider.lv_icon.global-open-sider").animate({"left":"80px"},'slow',function(){
		$(".global-sider").animate({"right":"0px"},'slow');
	});
}
//隐藏右侧边栏
function hideRightSidebar(){
	//console.log("隐藏右侧边栏");
	$(".global-sider").animate({"right":"-36px"},'slow',function(){
		$(".JS_open-sider.lv_icon.global-open-sider").animate({"left":"-70px"},'slow');
	});
}