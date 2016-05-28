<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
    response.setContentType("text/html;charset=UTF-8");
    String noticeID = request.getParameter("noticeID");
    request.setCharacterEncoding("UTF-8");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'noticeDetail.jsp' starting page</title>
    
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
	margin-top: 80px;
}
	
#div1{
    margin: auto auto;
	width: 70%;
	height: 480px;
	background-color: #FFFFFF;
}

#title {
	text-align: center;
	font-size: 26px;
	height:30px;
}

#foot1 {
	width: 130px;
	hight:28px;
	margin-right: 150px;
	align:center;
	display: inline;
}

#message {
	width: 850px;
	height:330px;
}

#sendBtn {
	margin-left:1100px;
	margin-top: 4px;
}
</style>

</head>

 <body>	
	 <c:forEach items="${notice}" var="no">
	 	<div class="panel panel-primary" id="div1" noticeID=<%=noticeID%>>
		 	<div class="panel-heading">
		 	<div><a href='NoticesServlet' style="color:white">公告》</a></div>
	 			<div id="title"><b>${no.title}</b>
				</div>
			</div>
			<div class="panel-body">			
				<div id ="message">${no.content}</div>
		 	</div>
	 		<div class="panel-footer">
	 			<div id='foot1'>发布时间：${no.publishTime}
				</div>
	 		</div>
	 	</div>
	 	<div>
					<a href="ThemeServlet"><button class="btn btn-primary" type="button" id="sendBtn"
						onClick="discuss()">返回</button></a>
				</div>
	 </c:forEach>
 </body>
</html>
