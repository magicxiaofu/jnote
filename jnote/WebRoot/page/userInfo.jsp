<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	<script src="page/assets/bootstrap-3.3.7/js/tests/vendor/jquery.min.js" type="text/javascript"></script>
	<link href="page/assets/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<script src="page/assets/bootstrap-3.3.7/dist/js/bootstrap.min.js" type="text/javascript"></script>

  </head>
  
  <body>
  	<a class="btn btn-primary" href="note/home">返回</a>
    <br>
    <br>
    <img alt="yurisa" src="${pageContext.request.contextPath}/head/yurisa.jpg">
	<form action="note/uploadFile" method="post" enctype="multipart/form-data">
    <!--文件域-->
    <input type="file" name="upload"/><input type="submit" value="上传">
  	</form>
  	<span>不要忘记点击上传哦。</span>
	<br>
	<form action="note/userinfo">
		用户手机：<input type="text" name="tel" id="tel"><br>
		用户邮箱：<input type="text" name="email" id="email"><br>
		<input type="submit" value="提交">
	</form>
  </body>
  
</html>
