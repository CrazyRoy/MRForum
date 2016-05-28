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
	width: 90%;
	height: 100%;
}

#themes {
	border: 1px solid white;
	width: 200px;
	height: 215px;
	float: left;
	margin-left: 38px;
	text-align: center;
	padding: 5px;
	float: left;
}

thead {
	color: #0088D8;
	font-size: 20px;
}

#blank {
	background-color: #EBEBEB;
	float: left;
	width: 1150px;
	height: 15px;
	color: #0088D8;
	font-size: 24px;
	margin-left: 35px;
	margin-bottom: 10px;
}

tr {
	line-height: 30px;
	text-align: center;
}

hr {
	width: 2px;
	height: 300px;
	background-color: #0088D8;
	float: left;
	margin-left: 20px;
}

.feature-divider {
	margin: 40px 0;
}

.feature {
	padding: 30px 0;
}

#dataTable {
	margin-top: 25px;
	border: 1px solid gray;
}

#postDiv {
	margin: 60px auto 80px auto;
	width: 1100px;
}

#newDiv {
	float: left;
	width: 350px;
}

#topRight {
	margin-top: 35px;
	float: right;
	margin-left: 5px;
	width: 350px;
	float: right;
}

#info {
	color: #0088D8;
	font-size: 20px;
	text-align: center
}

a:hover {
	background-color: #008800;
}

#messItem {
	white-space:  nowrap;
	text-overflow:  ellipsis;
	overflow:  hidden;
	width:  150px;
	max-height:  20px;
}
</style>

</head>
<body>
	<div id="content">
		<div id="postDiv">
			<div id="newDiv">
				<h3 id="info">
					<img src="images/news.png" width="22" height="22">&nbsp;<a
						href='NoticesServlet'>公告栏</a>
				</h3>
				<div class="list-group">
					<c:forEach items="${noticeList}" var="notices">
						<div id="messItem">
							<a href="NoticesServlet?noticeID=${notices.id}"
								class="list-group-item" id="items"><span
								class="label label-success" style="margin-right:20px">${notices.publishTime}</span>${notices.title}</a>
						</div>
					</c:forEach>
				</div>
			</div>
			<hr />
			<div id="topRight">
				<h3 id="info">
					<img src="images/new.png" width="22" height="22">&nbsp;最新帖子
				</h3>
				<div class="list-group">
					<c:forEach items="${newList}" var="news">
						<a href="postDetail.jsp?postID=${news.postID}&pageNum=1"
							class="list-group-item" id="items"><span
							class="label label-warning" style="margin-right:20px">${news.publishTime}</span>${news.title}</a>
					</c:forEach>
				</div>
			</div>
			<div id="topRight">
				<h3 id="info">
					<img src="images/hot.png" width="22" height="22">&nbsp;最火帖子
				</h3>
				<div class="list-group">
					<c:forEach items="${hotList}" var="hot">
						<a href="postDetail.jsp?postID=${hot.postID}&pageNum=1"
							class="list-group-item" id="items"><span
							class="label label-danger" style="margin-right:20px">${hot.pageview}</span>${hot.title}</a>
					</c:forEach>
				</div>
			</div>
		</div>
		<div id="blank"></div>
		<div>
			<c:forEach items="${types}" var="type">
				<div id="themes"
					onmouseover="javascript:this.style.border='1px solid red'"
					onmouseout="javascript:this.style.border='1px solid white'">
					<div>
						<a
							href="PostList?themeID=${type.postTypeID}&actionType=themeIdQuery"><img
							src="images/u50.png"> </a>
					</div>
					&nbsp;&nbsp;
					<div>
						<a
							href="PostList?themeID=${type.postTypeID}&actionType=themeIdQuery"><font
							face="楷体" size="4">${type.name} 浏览器</font><br> <br> <font
							face="楷体" size="4">帖 数：${type.count}</font> </a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
