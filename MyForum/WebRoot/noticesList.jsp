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
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'postList.jsp' starting page</title>
    
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<style type="text/css">
#tab_title {
	text-align: center;
	color: #0088D8;
}

body {
	background-color: #EBEBEB;
	margin-top: 60px;
}

#div1 {
    padding: 40px;
	background-color: #FFFFFF;
	margin: auto auto;
	width: 70%;
	height: 100%;
}

#title{
    text-align: center;
	font-size: 22px;
}

#img {
	margin-top: -2px;
}

#content {
	width: 80%;
	margin: auto auto;
}

</style>
  </head>
  <body>
    <div id="div1">
    <div class='panel panel-primary' style="width:80%; margin-left:87px">
				<div class="panel-heading" id="title">
				<b>公告栏</b>
				</div>
	</div>
		<div id="content">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr id="tab_title">
						<th style="text-align:center">公告标题</th>
						<th style="text-align:center">发布时间</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${notices}" var="notice">
						<tr id="tab_item">
							<td style="text-align:center"><a href="NoticesServlet?noticeID=${notice.id}">${notice.title}</a>
							</td>
							<td style="text-align:center">${notice.publishTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
  </body>
</html>
