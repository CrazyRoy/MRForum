<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
    response.setContentType("text/html;charset=GBK");
    request.setCharacterEncoding("GBK");
    
    String back = "back";
 %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script src="js/jquery-1.11.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
<style type="text/css">
body {
	margin-top: 80px;
}
	
#div1{
    margin:auto auto;
	width: 50%;
	height: 400px;
	background-color: #FFFFFF;
}

#title {
	text-align: center;
	font-size: 26px;
	height:30px;
}

#login{
    margin-top:50px;
    text-align: center;
	font-size: 16px;
	color: #0088D8;
}

#button1{
    margin-left:70px;
}

#button2{
    margin-left:60px;
}
</style>
<script type="text/javascript">
function checkLogin() {
		 $.ajax({
					url : "LoginServlet",
					type : "POST",
					dataType : "json",
					data : {
						account : $("#account").val(),
						password : $("#password").val(),
						actionType:$("#actionType").val()
					},
					success : function(value) {
						if (value.result == "1") {
							alert("登录成功");
							window.location.href = "admin/adminIndex.jsp";
						}else if (value.result == "2") {
							alert("密码错误");
						}else if (value.result == "4"){
						    alert("该用户没有权限");
						}else{
						    alert("用户名错误");
						}
					},
					error : function(data) {
						alert("error");
					},
				}); 
			};
			
			function reset() {
				$("#account").val("");
				$("#password").val("");
			};
</script>
  </head>
  
  <body>
	<div class="panel panel-primary" id="div1">
		<div class="panel-heading">
			<div id="title">
				<b>浏览器论坛后台管理登录页面</b>
			</div>
		</div>
		<div class="panel-body">
		<div id = "login" back=<%=back %>>
		<b>用户名：</b><input id = "account" type="text" size="17" maxlength="15"/>
		<br><br>
		<b>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</b><input id="password" type="password" size="17" maxlength="15"/>
		<br><br><input type="hidden" id="actionType"  value="li" />
		<input value="登录" type="button"  id="button1" onClick="checkLogin()"/>
		<input type="button" name="button" id="button2" onClick="reset()" value="重置"/>
		</div>
		</div>
	</div>
</body>
</html>
