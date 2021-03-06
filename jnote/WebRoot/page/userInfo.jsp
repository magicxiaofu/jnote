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
	<link href="page/css/userInfo.css" rel="stylesheet" type="text/css"/>
	<script src="page/assets/bootstrap-3.3.7/dist/js/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript"> 
	//JS控制文件的上传，包括文件格式和大小
		var isIE = /msie/i.test(navigator.userAgent) && !window.opera; 
		function fileChange(target,id) { 
			var fileSize = 0; 
			var filetypes =[".jpg",".png",".gif"]; 
			var filepath = target.value; 
			var filemaxsize = 1024*2;//2M 
			if(filepath){ 
				var isnext = false; 
				var fileend = filepath.substring(filepath.indexOf(".")); 
				if(filetypes && filetypes.length>0){ 
					for(var i =0; i<filetypes.length;i++){ 
						if(filetypes[i]==fileend){ 
							isnext = true; 
							break; 
						} 
					} 
				} 
				if(!isnext){ 
					alert("不接受此文件类型！"); 
					target.value =""; 
					return false; 
				} 
			}else{ 
				return false; 
			} 
			if (isIE && !target.files) { 
				var filePath = target.value; 
				var fileSystem = new ActiveXObject("Scripting.FileSystemObject"); 
				if(!fileSystem.FileExists(filePath)){ 
					alert("附件不存在，请重新输入！"); 
					return false; 
				} 
				var file = fileSystem.GetFile (filePath); 
				fileSize = file.Size; 
			} else { 
				fileSize = target.files[0].size; 
			} 
			var size = fileSize / 1024; 
			if(size>filemaxsize){ 
				alert("附件大小不能大于"+filemaxsize/1024+"M！"); 
				target.value =""; 
				return false; 
			} 
		} 
		
		function upload(){
			var file = document.uploadForm.upload.value; 
			if(file == ""){
				alert("请选择文件");
				return false;
			}
		}
		
		//图片缓存刷新问题（增加参数使浏览器认为刷新了图片）
		var srcTemp='${userInfoExist.headurl}?timestemp='+new Date().getTime();
 		$('#headIMG').attr('src',srcTemp);
 		//alert(srcTemp);
		
		$(document).ready(function(){
			//上传按钮
			/* $('#uploadSubmit').click(function(){
				var file = document.uploadForm.upload.value; 
				if(file == ""){
					alert("请选择文件");
					return false;
				}
				$('#uploadSubmit').submit();
			}); */
		
		  $('#userInfoSubmit').click(function(){
		    //check tel
		    var tel = /^1[34578]\d{9}/;
			if (!tel.test($('#tel').val())) {
				$('#tel').focus().css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
					});
				$('#userCue').html("<font color='red'><b>×电话号码格式不正确</b></font>");
				return false;
			} else {
				$('#tel').css({
					border: "1px solid #D7D7D7",
					boxShadow: "none"
				});	
			}
			//eamil check
			var email = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
			if (!email.test($('#email').val()) || $('#email').val().length < 5 || $('#email').val().length > 30) {
				$('#email').focus().css({
					border: "1px solid red",
					boxShadow: "0 0 2px red"
				});
				$('#userCue').html("<font color='red'><b>×邮箱格式不正确</b></font>");
				return false;
			} else {
				$('#email').css({
					border: "1px solid #D7D7D7",
					boxShadow: "none"
				});
			}
			$('#userInfoForm').submit();
		  });//userInfo.click end
			
			
		});//document.ready end
</script> 
  </head>
  
  <body class="body">
  	<%-- <div class="card">
  		<a class="btn btn-primary btn-back" href="note/home">返回</a><br>
  		<img id="headIMG" class="img" alt="pic" src="${userInfoExist.headurl}" style=""><br>
  		<!--文件域-->
  		<form id="uploadForm" name="uploadForm" class="upload-form" action="note/uploadFile" method="post" enctype="multipart/form-data">
    		<input id="filePath" type="file" class="" name="upload" onchange="fileChange(this);"/><br>
    		<input id="uploadSubmit" class="btn btn-pull" type="submit" value="上传">
    		<span>不要忘记点击上传哦。</span>
  		</form>
  		<hr style="border-top:2px solid #CDCDCD"/>
  		<div id="userCue" class="cue">请按照正确格式填写</div>
  		<form class="userInfo-form" action="note/userinfo" method="post" id="userInfoForm">
			<div class="input-group">
				<span class="input-group-addon">用户手机：</span>
				<input class="form-control md-title-text" type="text" name="tel" id="tel" value="${userInfoExist.tel}">
			</div><br>
			<div class="input-group">
				<span class="input-group-addon">用户邮箱：</span>
				<input class="form-control md-title-text" type="text" name="email" id="email" value="${userInfoExist.email}"><br>
			</div><br>
			<input id="userInfoSubmit" class="btn btn-pull btn-userInfo" type="button" value="提交">
		</form>
  	</div> --%>
  	<a class="btn btn-primary btn-back" href="note/home">返回</a><br>
  	<div class="single-member effect">
		<div class="member-image">
			<img id="headIMG" src="${userInfoExist.headurl}" alt="headPic">
		</div>
		<div class="member-info">
			<h3>${session.user.username}</h3>
			<!--  -->
			<form id="uploadForm" name="uploadForm" class="upload-form" action="note/uploadFile" method="post" enctype="multipart/form-data">
    			<input id="filePath" type="file" class="" name="upload" onchange="fileChange(this);"/><br>
    			<input id="uploadSubmit" class="btn btn-pull" type="submit" value="上传">
    			<span>不要忘记点击上传哦。</span>
  			</form>
  			<hr style="border-top:2px solid #CDCDCD"/>
  			<div id="userCue" class="cue">请按照正确格式填写</div>
  			<form class="userInfo-form" action="note/userinfo" method="post" id="userInfoForm">
			<div class="input-group">
				<span class="input-group-addon">用户手机：</span>
				<input class="form-control md-title-text" type="text" name="tel" id="tel" value="${userInfoExist.tel}">
			</div><br>
			<div class="input-group">
				<span class="input-group-addon">用户邮箱：</span>
				<input class="form-control md-title-text" type="text" name="email" id="email" value="${userInfoExist.email}"><br>
			</div><br>
			<input id="userInfoSubmit" class="btn btn-pull btn-userInfo" type="button" value="提交">
		</form>
		    
		</div>
	</div>
  </body>
  
</html>
