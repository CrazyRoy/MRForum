<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String userID = request.getParameter("userID");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'personData.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">

	// 设置用户的已有数据
	function setContent() {
		$.ajax({
			url : "UserServlet",
			type : "POST",
			dataType : "json",
			data : {
				actionType : "set",
				userID : $("#setting-profile").attr("userID")
			},
			success : function(value) {
				var user = value.user;
				$("#nickname").val(user[0].account);
				$("#nick").val(user[0].name);
				$("#email").val(user[0].email);
				var obj = document.getElementById("sex");
				for(var i=0; i<obj.length; i++){
					if(obj[i].val == user[0].gender){
						obj[i].selected == true;
					}
				}
			},
			error : function() {
			 	alert("error");
			},
		});
	};
	
	// 提交更新
	function update() {
		var gender = "男";
		var obj = document.getElementById("sex");
		for(var i=0; i < obj.length; i++){
		alert("dd");
			if(obj[i].selected == true){
				gender = obj[i].val();
				alert(gender);
			}
		}
		$.ajax({
			url : "UserServlet",
			type : "POST",
			dataType : "json",
			data : {
				actionType : "update",
				userID : $("#setting-profile").attr("userID"),
				sex : gender,
				account : $("#nickname").val(),
				email : $("#email").val(),
				name : $("#nick").val()
			},
			success : function(value) {
				if(value.updateState == "success"){
					alert("更新成功!");
					window.location.reload();// 刷新页面
				}else {
					alert("更新失败!");
				}
			},
			error : function() {
			 	alert("error");
			},
		});
	};
	
</script>
<style type="text/css">
#setting-profile {
	margin: 100px auto auto 200px;
}

#left {
	float: left;
	margin: 20px auto auto 70px;
	color: #0088D8;
	font-size: 25px;
}

#right {
	float: right;
	margin: 18px 270px auto auto;
	font-size: 20px;
}

#nick {
	text-length: 20px;
	margin: 10 auto;
}

#profile-submit {
	margin: 50px auto auto 200px;
}

#lable {
	margin: 10 auto;
}
</style>
</head>
<body onLoad="setContent()">
	<div id="setting-profile" userID=<%=userID %>>
		<div id="left">
			<label>用户名</label><br> <br> <label>&nbsp;&nbsp;&nbsp;昵称</label><br>
			<br> <label>&nbsp;&nbsp;&nbsp;性别</label><br> <br> <label>&nbsp;&nbsp;&nbsp;邮箱</label>
		</div>
		<div id="right">
			<input type="text" id="nickname" name="nickname" autocomplete="off"
				placeholder="请输入用户名." /> <br> <br> <input type="text"
				name="nickname" id="nick" autocomplete="off" data-validate="nick"
				placeholder="请输入昵称." /> <br> <br>
			<div id="lable">
				<label><input type="radio" hidefocus="true"
					checked="checked" value="男" name="sex" id="sex">男</label> <label><input
					type="radio" hidefocus="true" value="女" name="sex" id="sex">女</label>
			</div>
			<br> <input type="text" id="email" name="nickname"
				autocomplete="off" placeholder="请输入邮箱." />
		</div>
		<div>
			<button id="profile-submit" class="btn btn-primary" onClick="update()">保存</button>
		</div>
	</div>
</body>
</html>
