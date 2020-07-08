function submits(){
	var qTitle=$("#qTitle");
	var qContent=$("#qContent");
	var destName=$("#destName");//问题相关的目的地
	var tagNames=$("#tagNames");//问题分类标签
	if (qTitle.val().trim()=='') {
		qTitle.parent().attr("class","nchtextarea error");
		return;
	}else {
		qTitle.parent().attr("class","nchtextarea");
	}
	if (qContent.val().trim()=='') {
		qContent.parent().attr("class","nchtextarea error");
		return;
	}else {
		qContent.parent().attr("class","nchtextarea");
	}
	if (destName.val().trim()=='') {
		destName.parent().attr("class","dev_input relation-input js_mdd js_yz dev_dest_text dev_focus error");
		return;
	}else {
		destName.parent().attr("class","dev_input relation-input js_mdd js_yz dev_dest_text dev_focus");
	}
	if (tagNames.val().trim()=='') {
		tagNames.parent().attr("class","relation-input js_classic js_yz dev_tag_text error");
		return;
	}else {
		tagNames.parent().attr("class","relation-input js_classic js_yz dev_tag_text");
	}
}
$(function(){
	//问题相关目的地
	//点击显示
	$("#destName").click(function(){
		$(".float-relation-mdd").attr("style","top:684px;left:232.5px;display:block;");
		$('#dest').focus();
	});
	//div失去焦点隐藏
	$("#dest").blur(function(){
		$('#dest').hide();
	});
	//选中div内容之后隐藏
	$("span.dev_remove").click(function(){
		$("#destName").val($(this).text())
		$('#dest').hide();
	})
    //问题分类标签
	$("#tagNames").click(function(){
		$(".float-relation-classic").attr("style","top: 775px; left: 232.5px; display: block;");
		$('.float-relation-classic').focus();
	})
	//div失去焦点隐藏
	$(".float-relation-classic").blur(function(){
		$(".float-relation-classic").attr("style","top: 775px; left: 232.5px; display: none;");
	})
	$("span input").click(function(){
		$("#tagNames").val($(this).val())
	})
})

/*
 *  $("#test1").parent(); // 父节点
    $("#test1").parents(); // 全部父节点
    $("#test1").parents(".mui-content");
    $("#test").children(); // 全部子节点
    $("#test").children("#test1");
    $("#test").contents(); // 返回#test里面的所有内容，包括节点和文本
    $("#test").contents("#test1");
    $("#test1").prev();  // 上一个兄弟节点
    $("#test1").prevAll(); // 之前所有兄弟节点
    $("#test1").next(); // 下一个兄弟节点
    $("#test1").nextAll(); // 之后所有兄弟节点
    $("#test1").siblings(); // 所有兄弟节点
 */