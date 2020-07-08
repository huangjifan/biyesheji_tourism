<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="js/admin/layui-v2.4.5/layui/css/layui.css"  media="all"/>
<title>Insert title here</title>
</head>
<body>
	<form enctype="multipart/form-data" method="post"
		action="/testuploadimg">
		图片<input type="file" name="file" /> <input type="submit" value="上传" />
	</form>

	<form method="POST" enctype="multipart/form-data"
		action="/batch/upload">
		<p>
			文件1：<input type="file" name="file" />
		</p>
		<p>
			文件2：<input type="file" name="file" />
		</p>
		<p>
			<input type="submit" value="上传" />
		</p>
	</form>
	<h1>------------------------------------</h1>
	<fieldset class="layui-elem-field layui-field-title"
		style="margin-top: 30px;">
		<legend>多文件列表上传</legend>
	</fieldset>

	<div class="layui-upload">
		<button type="button" class="layui-btn layui-btn-normal" id="testList">选择多文件</button>
		<div class="layui-upload-list">
			<table class="layui-table">
				<thead>
					<tr>
						<th>文件名</th>
						<th>大小</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody id="demoList"></tbody>
			</table>
		</div>
		<img class="layui-upload-img" id="demo1" width="100px" height="50px">
		<button type="button" class="layui-btn" id="testListAction">开始上传</button>
	</div>
</body>
<script type="text/javascript" src="js/admin/layui-v2.4.5/layui/layui.js"></script>

<script type="text/javascript">
layui.use('upload', function(){
	  var $ = layui.jquery
	  ,upload = layui.upload;
	 
	  //多文件列表示例
	  var demoListView = $('#demoList')
	  ,uploadListIns = upload.render({
	    elem: '#testList'
	    ,url: 'uploadFile'
	    ,accept: 'file'
	    ,multiple: true
	    ,auto: false
	    ,size: 5120
	    ,bindAction: '#testListAction'
	    ,choose: function(obj){   
	      var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
	      //读取本地文件
	      obj.preview(function(index, file, result){
	    	$('#demo1').attr('src', result);
	        var tr = $(['<tr id="upload-'+ index +'">'
	          ,'<td>'+ file.name +'</td>'
	          ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
	          ,'<td>等待上传</td>'
	          ,'<td>'
	            ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
	            ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
	          ,'</td>'
	        ,'</tr>'].join(''));
	        
	        //单个重传
	        tr.find('.demo-reload').on('click', function(){
	          obj.upload(index, file);
	        });
	        
	        //删除
	        tr.find('.demo-delete').on('click', function(){
	          delete files[index]; //删除对应的文件
	          tr.remove();
	          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
	        });
	        
	        demoListView.append(tr);
	      });
	    }
	    ,done: function(res, index, upload){
	      if(res.code == 0){ //上传成功
	        var tr = demoListView.find('tr#upload-'+ index)
	        ,tds = tr.children();
	        tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
	        tds.eq(3).html(''); //清空操作
	        return delete this.files[index]; //删除文件队列已经上传成功的文件
	      }
	      this.error(index, upload);
	    }
	    ,error: function(index, upload){
	      var tr = demoListView.find('tr#upload-'+ index)
	      ,tds = tr.children();
	      tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
	      tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
	    }
	  });
	  
	});
</script>
</html>