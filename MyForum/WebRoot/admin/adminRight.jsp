<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminRight.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.js">
</script>
<script src="js/bootstrap.min.js">
</script>
<style type="text/css">
#div1 {
	margin: 110px auto auto 40px;
}

#div2{
   margin-left:70px;
}

#p1{
    color:#0088D8;
    font-size:70px;
    margin-left:20px;
}

#p2{
    color:#0088D8;
    font-size:50px;
    margin-left:500px;
}
</style>
  </head>
  
  <body>
  <div id="div1">
  <div id="div2">
   <img src="images/logo.png" width="448" height="201"> <br>
   </div>
   <div>
   <p id="p1"><b>Bwly后台管理网站</b></p>
   <p id="p2">欢迎你</p>
   </div>
   </div>
  </body>
</html>
