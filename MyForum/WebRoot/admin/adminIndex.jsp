<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>BwLy论坛后台</title>
    
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
	background-color: #EBEBEB;
}

#content {
	background-color: #FFFFFF;
	margin: auto auto;
	width: 85%;
	height: 680px;
}

#left{
    width:19%;
    height:100%;
    float:left;
}

#li{
   width:80%;
   margin: 30px auto auto 20px;
}

hr {
	width: 2px;
	height: 565px;
	background-color: #0088D8;
	float: left;
}

#right{
    width:75%;
    height:100%;
    float:right;
}
</style>
  </head>
  <body>
  <div id="content">
    <div id="left">
    <ul class="nav nav-pills nav-stacked" id="li">
	     <li class="active"><a><b>后台管理导航</b></a></li>
	     <li><a href="admin/postsManage.jsp?pageNum=1" target="backContent">帖子管理</a></li>
	     <li><a href="admin/noticesManage.jsp?pageNum=1" target="backContent">公告管理</a></li>
	     <li><a href="admin/usersManage.jsp?pageNum=1" target="backContent">用户管理</a></li>
	     <li><a href="index.jsp">转到前台页面</a></li>
	     <li class="disabled"><a href="#">欢迎您,luo</a></li>
	     <li><a href="admin/adminLogin.jsp">退出</a></li>
	</ul>
    </div>
    <hr/>
    <div id="right">
    <iframe style="width:100%; height:100%;" src="admin/adminRight.jsp" name="backContent"
			frameborder="no"></iframe>
    </div>
    </div>
  </body>
</html>
