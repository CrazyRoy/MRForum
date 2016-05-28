<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<%
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
	String userID = request.getParameter("userID");
%>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'information.jsp' starting page</title>
    
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
	margin: 80px auto 0 auto;
	width: 85%;
	height: 500px;
}

#left{
    margin:auto auto auto 80px;
    height: 300px;
    width:230px;
    background-color: #FFFFFF;
    float:left;
}

#li{
    font-size:20px;
    
}

#right{
    margin:80px auto 20px 380px;
    height: 500px;
    width:890px;
    background-color: #FFFFFF;
}
</style>
  </head>
  <body>
    <div id="left">
    <ul class="nav nav-pills nav-stacked">
     <li class="active" id="li"><a><b>&nbsp;&nbsp;个人中心</b></a></li>
     <li class="divider"></li>
     <li><a href="personData.jsp?userID=<%=userID %>" target="personContent"><b>&nbsp;&nbsp;个人资料</b></a></li>
     <li class="divider"></li>
     <li><a href="headPortrait.jsp?userID=<%=userID %>" target="personContent"><b>&nbsp;&nbsp;头像设置</b></a></li>
     <li class="divider"></li>
     <li><a href="changePassword.jsp?userID=<%=userID %>" target="personContent"><b>&nbsp;&nbsp;修改密码</b></a></li>
     <li class="disabled"><a href="##">Responsive</a></li>
</ul>
    </div>
    <div id="right">
    <iframe style="width:100%; height:100%;" src="personData.jsp?userID=<%=userID %>" name="personContent"
			frameborder="no"></iframe>
    </div>
  </body>
</html>
