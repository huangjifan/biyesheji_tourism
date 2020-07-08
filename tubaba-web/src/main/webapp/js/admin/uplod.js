$(function () {
    initFileInput("input-id");
})
var List = new Array();//定义一个全局变量去接受文件名和id
function initFileInput(ctrlName) {
    var control = $('#' + ctrlName);
    control.fileinput({
        language: 'zh', //设置语言
        uploadUrl: "uploadBatch", //上传的地址
        allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
        maxFilesNum : 5,//上传最大的文件数量
        //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
        uploadAsync: true, //默认异步上传
        showUpload: true, //是否显示上传按钮
        showRemove : true, //显示移除按钮
        showPreview : true, //是否显示预览
        showCaption: false,//是否显示标题
        browseClass: "btn btn-primary", //按钮样式
        //dropZoneEnabled: true,//是否显示拖拽区域
        //minImageWidth: 50, //图片的最小宽度
        //minImageHeight: 50,//图片的最小高度
        //maxImageWidth: 1000,//图片的最大宽度
        //maxImageHeight: 1000,//图片的最大高度
        maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
        //minFileCount: 0,
        maxFileCount: 6, //表示允许同时上传的最大文件个数
        enctype: 'multipart/form-data',
        validateInitialCount:true,
        previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",

    }).on('filepreupload', function(event, data, previewId, index) {     //上传中
        var form = data.form, files = data.files, extra = data.extra,
        response = data.response, reader = data.reader;
        console.log('文件正在上传');
    }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
        console.log('文件上传成功！');
    	var date = data.response[0];
    	console.log(date);
    	List.push({ FileName: data, KeyID: previewId });
    	console.log(previewId);
    }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
        console.log('文件上传失败！');
        console.log(data);
    }).on('filereset', function(event, data, msg) {
       
    	console.log("文件删除");
    	console.log(data)
    }).on('filecleared', function(event) {
        
    	console.log('文件移除');
    	
    }).on('filesuccessremove', function(event, previewId, data, extra) {
    	//小图标文件上传成功后的删除
    	console.log("上传成功后删除");
    	console.log(data);
    	console.log(previewId);
    	for (var i = 0; i < List.length; i++) { 
    	      if (List[i].KeyID == previewId) { 
    	        delete List[i];
    	        console.log("进没进");
    	      } 
    	   }
    });
	}