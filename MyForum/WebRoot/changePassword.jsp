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
    	function updatePwd() {
    		var check = checkNewPwd();
    		if(check == 1) {
	    			$.ajax({
						url : "UserServlet",
						type : "POST",
						dataType : "json",
						data : {
							actionType : "updatePwd",
							userID : $("#setting-profile").attr("userID"),
							oldPwd : $("#oldPwd").val(),
							newPwd : $("#newPwd").val()
						},
						success : function(value) {
							if(value.updatePwd == "success"){
								alert("更新成功!");
								window.location.reload();// 刷新页面
							}else if(value.updatePwd == "error"){
								alert("原始密码输入错误!");
							}else {
								alert("更新失败！");
							}
						},
						error : function() {
						 	alert("error");
						},
					});
	    		}else {
	    			alert("密码确认错误!!!");
	    		}
    	};
    	
    	function checkNewPwd() {
    		var newPwd = $("#newPwd").val();
    		var conNewPwd = $("#cfmNewPwd").val();
    		if(newPwd == conNewPwd) {
    			return 1;
    		}else {
    			return 0;
    		}
    	};
    </script>
<style type="text/css">
#setting-profile{
    margin:100px auto auto 200px;
   
}	
#left{
    float:left;
    margin:20px auto;
    color:#0088D8;
    font-size:25px;
}
#right{
   float:right;
   margin:22px 300px auto auto;
   font-size:20px;
}
#nick{
   margin:10px auto;
}
#profile-submit{
   margin:30px auto auto 220px;
}
</style>
  </head>
  
  <body>
    <div id="setting-profile" userID=<%=userID %>>
        <div  id="left">
            <label>当前密码</label><br><br>
        	<label>&nbsp;&nbsp;&nbsp;新密码</label><br><br>
        	<label>确认密码</label><br><br>
        </div>
        <div id="right">
        	<input  type="password"  id="oldPwd" placeholder="请输入当前密码."/>
        	<br><br>
        	<input  type="password"  id="newPwd" placeholder="请输入密码."/>
            <br><br>
            <input  type="password"  id="cfmNewPwd" data-validate="nick" placeholder="请输入密码."/>
        </div>
        <div>
            <button id="profile-submit" class="btn btn-primary" onClick="updatePwd()">保存</button>
        </div>
     </div>
  </body>
</html>
