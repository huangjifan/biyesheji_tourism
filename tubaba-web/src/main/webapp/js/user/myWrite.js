function submits(){
	var theme=$("#theme").val();
	var content=$("#myEditor").text();
	if (theme.trim()=='') {
		alert("标题不能为空");
		return;
	}
	else {
		if ($.trim(content.replace(/(^\s*)|(\s*$)/g, ""))=="") {
			alert("内容不能为空");
			return;
		}
		else {
			$.ajax({
				url:"addWrite",
				data:{
					theme:theme,
					content:$("#myEditor").html(),
					iid:$("#iid").val()
				},
				type:"post",
				success:function(data){
					if(data=='false'){
						alert("游记发布失败！");
						location.href="mywrite"
					}
					else if (data=='nologin') {
						alert("没有登录");
					}
					else {
						alert("游记发布成功!");
						location.href="mySecond?tid="+data
					}
				},
				error:function(){
					alert("游记增加失败");
				}
			})
		}
	}
}
//过滤掉html标签
function delHtmlTag(str){
	 str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag  
     str = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白  
     str = str.replace(/&nbsp;/gi,'')//去掉&nbsp;
     return str;  
}
function img(){
	var filepath=$("#file").val();
	//获取上传文件名
	var fileArr=filepath.split("\\");
    var fileTArr=fileArr[fileArr.length-1].toLowerCase().split(".");
    var filetype=fileTArr[fileTArr.length-1];
    //切割出后缀文件名
    if(filetype == "jpg"){
        return true;
    }else if(filetype == "png"){
    	return true;
    }
    else if(filetype == "gif"){
    	return true;
    }else if(filetype == "jpeg"){
    	return true;
    }else if (filepath==''||filepath==null) {
    	alert("请选择图片");
		return false;
	}
    else{
    	alert("只能上传图片");
        return false;
    }
}
