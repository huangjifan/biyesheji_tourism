<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user/jquery.validate.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#myform").validate({
			rules:{
				file:{required:true}
			},
			messages:{
				file:{required:"空文件"}
			}
		})
	})
</script>
</head>
<body>
<form action="" method="post" id="myform">
	<input type="file" id="file" name="file"><br>
	<input type="submit" value="上传">
</form>
</body>
</html>