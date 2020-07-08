<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加广告分类</title>
<link rel="stylesheet" type="text/css" href="lib/bootstrap-fileinput-master/css/fileinput.min.css" />
<link rel="stylesheet" type="text/css" href="lib/bootstrap-fileinput-master/css/fileinput-rtl.min.css"/>
<link rel="stylesheet" type="text/css" href="lib/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
</head>
<body>

<div class="container-fluid">
    <form id="form" action="" method="post" enctype="multipart/form-data">
      <div class="row form-group">
         <div class="panel panel-primary">
           <div class="panel-heading" align="center">
             <label style="text-align: center;font-size: 18px;">文 件 上 传</label>
           </div>
         <div class="panel-body">
           <div class="col-sm-12">
              <input id="input-id" name="file" multiple type="file" data-show-caption="true">
              <input id="fileName" name="fileName"  hidden="hidden" />
           </div>
         </div>
        </div>
      </div>
    </form>
</div>

<!-- 引入js文件 -->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="lib/bootstrap-fileinput-master/js/fileinput.min.js"></script>
<script type="text/javascript" src="lib/bootstrap-fileinput-master/js/locales/zh.js"></script>
<script type="text/javascript" src="lib/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/admin/uplod.js"></script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>