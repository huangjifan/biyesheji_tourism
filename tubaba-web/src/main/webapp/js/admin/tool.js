/**
 * 验证textarea输入框字数限制,只作提示不作提交限制
 * 1、必须将总数用<am>标签装起来 2、调用本方法
 * 参考：<em class="textarea-length">0</em>/<am>100</am>
 * @param obj
 * @constructor
 */
/*var Huitextarealength = function (obj){
    var html = $(obj).parent();
    var tatal = html.find('am').html();
    var sets = $(obj).val().length;
    if(sets*1 < 10){
    	 var str = '<div style="width: auto;position: absolute; right: 4%;color: red;">最少输入10个字符</div>';
    	  $(obj).after(str);
    }else if(sets*1>tatal*1){
    	$(obj).parent().find('div').remove();
        var str = '<div style="width: auto;position: absolute; right: 4%;color: red;">内容超出限制</div>';
        $(obj).after(str);
        html.find('em').css({color:'red'});
    }else {
        $(obj).parent().find('div').remove();
        html.find('em').css({color:'black'});
    }
    //设置已输入数量
    html.find('em').html(sets);
}*/
function coverFile(obj){
	 var preview = $(obj).parent().find('img')[0];
	  var file    = obj.files[0];
	  var reader  = new FileReader();

	  
	  	reader.onloadend = function () {
	    preview.src = reader.result;
	    $(preview).show();
	    $(preview).next().show();
	    
	    
	  }
	  if (file) {
	    reader.readAsDataURL(file);
	  } else {
	    preview.src = "";
	  }
}
/*
 * 上传多张图片
 */
function previewFile(obj) {
	  var preview = $(obj).parent().find('img')[0];
	  var file    = obj.files[0];
	  var reader  = new FileReader();
	  
	var filepath=$(obj).val();
    //获得上传文件名
    var fileArr=filepath.split("\\");

    var fileTArr=fileArr[fileArr.length-1].toLowerCase().split(".");
    var filetype=fileTArr[fileTArr.length-1].toUpperCase();
    //切割出后缀文件名
    if(filetype != "BMP" && filetype != "JPG" && filetype != "JPEG"
		&& filetype != "PNG" && filetype != "GIF"){
    	preview.src = "";
	    var imgs = $('img[src=""][id!="cover"]');
	    alert(imgs.length);
	    if(imgs.length > 1){
		    $(preview).hide();
		    $(preview).next().hide();
		    var imgs = $('img[src=""][id!="cover"]');
		    for(var i = 0 ; i < imgs.length ; i++){
		    	//console.log(imgs[i] != preview + '---'+i);
		    	if(imgs[i] != preview){
		    		$(imgs[i]).parent().remove();
		    	}
		    }
	    }
    	return;
    }
	    
	  	reader.onloadend = function () {
  		var imgss = $('img');
  		
  		//判断是否上传的是同一张图片
		for(var i=0;i<imgss.length;i++){
			if(imgss[i].src == reader.result){
				 if (file.outerHTML) {
		             file.outerHTML = file.outerHTML;
		         } else { // FF(包括3.5)
		             file.value = "";
		         }
				 alert('不能选择两张一样的图片');
				return;
			}
		}
	    preview.src = reader.result;
	    $(preview).show();
	    $(preview).next().show();
	    var imgs = $('img[src=""][id!="cover"]');
	    if(imgs.length < 1){
	    	$(obj).parent().parent().append('<div class="layui-col-md6"><input type="file"  name="file" onchange="previewFile(this)" class="layui-btn layui-btn-sm" id="upLoadImge" style="width: 188px;" /><br><img src="" style="display:none" height="200" alt="Image preview..."><a src="javascript:void()" style="display:none;" onclick="imgRemove(this)">删除</a></div>');
	    }
	  }
	  if (file) {
	    reader.readAsDataURL(file);
	  } else {
	    preview.src = "";
	    $(preview).hide();
	    $(preview).next().hide();
	    var imgs = $('img[src=""]');
	    for(var i = 0 ; i < imgs.length ; i++){
	    	//console.log(imgs[i] != preview + '---'+i);
	    	if(imgs[i] != preview){
	    		$(imgs[i]).parent().remove();
	    	}
	    }
	  }
}
/**
 * 删除父节点
 */
function imgRemove(obj){
	$(obj).parent().remove();
}

jQuery.validator.addMethod("checkPic", function(value, element) {
    var filepath=$(element).val();
    //获得上传文件名
    var fileArr=filepath.split("\\");
    var fileTArr=fileArr[fileArr.length-1].toLowerCase().split(".");
    var filetype=fileTArr[fileTArr.length-1].toUpperCase();;
    //切割出后缀文件名
    if(filetype != "BMP" && filetype != "JPG" && filetype != "JPEG"
		&& filetype != "PNG" && filetype != "GIF"){
        return false;
    }else{
        return true;
    }
}, "上传图片格式不适合");
jQuery.validator.addMethod("checkcover", function(value, element) {
    var filepath=$(element).val();
    //获得上传文件名
    var fileArr=filepath.split("\\");
    var fileTArr=fileArr[fileArr.length-1].toLowerCase().split(".");
    var filetype=fileTArr[fileTArr.length-1].toUpperCase();;
    //切割出后缀文件名
    if(filetype != "BMP" && filetype != "JPG" && filetype != "JPEG"
		&& filetype != "PNG" && filetype != "GIF"){
        return false;
    }else{
        return true;
    }
}, "上传图片格式不适合");
jQuery.validator.addMethod("checkadult", function(value, element) {
   var floor_price = $("#floor_price").val();
   var adultprice = $("#adultprice").val();
   var childprice = $("#childprice").val();
   if(adultprice.length > floor_price.length & adultprice.length > childprice.length){
	   return true;
   }else if(adultprice.length > floor_price.length & adultprice > childprice){
	   return true;
   }else if (adultprice.length > childprice.length & adultprice > floor_price){
	   return true;
   }else if(adultprice > floor_price & adultprice > childprice){
	   return true;
   }else{
	   return false;
   }
}, "输入的价格有误，成人价格不能低于等于底价或 儿童价格");
jQuery.validator.addMethod("checkchild", function(value, element) {
	   var floor_price = $("#floor_price").val();
	   var adultprice = $("#adultprice").val();
	   var childprice = $("#childprice").val();
	   if(childprice.length > floor_price.length & adultprice.length > childprice.length){
		   return true;
	   }else if(childprice.length > floor_price.length & adultprice > childprice){
		   return true;
	   }else if(adultprice.length > childprice.length & childprice > floor_price){
		   return true;
	   }else if(childprice > floor_price & childprice < adultprice){
		   return true;
	   } else{
		   return false;
	   }
	}, "输入的价格有误，儿童价格不能低于等于底价或者高于等于成人价格");
