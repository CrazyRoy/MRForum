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
<script type="text/javascript">
	//  发布帖子的事件
	function addPost() {
		$.ajax({
			url : "CheckState",
			type : "POST",
			/* data : {
				postID : $("#postID").val(),
				pageNum : $("#goText").val()
			}, */
			dataType : "json",
			success : function(value) {
				var state = value.loginState;
				if (state == "false") {
					alert("请先登录");
				} else {
					// 所评论的帖子的ID
				 	var postID = $("#head").attr("postID");
					var userID = value.loginID;
					var userAccount = value.loginAccount;
					var userName = value.loginName;
					alert("帖子：" + postID + "userID:" + userID);
					window.location.href = "addPost.jsp?userID="
							+ userID + "&userAccount=" + userAccount
							+ "&userName=" + userName;
				}
			},
			error : function(data) {
				alert("请求失败");
			},
		});
	};
</script>
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
	background-color: #FFFFFF;
	margin: auto auto;
	width: 70%;
	height: 100%;
}

#div2 {
	padding: 40px;
	width: 800px;
	height: 35px;
	margin-left: 58px;
	margin-bottom: 20px;
}

#img {
	margin-top: -2px;
}

#content {
	width: 80%;
	margin: auto auto;
}

#submit_btn {
	margin-top: -22px;
	margin-left: 210px;
	width: 31px;
	height: 31px;
	background: url(images/search.png) no-repeat center;
	cursor: pointer;
	/* 上面的代码是常规设置， 即：引入一个图片背景，设置在中心位置，大小和按钮的大小一致，以及鼠标指针为手型 */
	display: block;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
	/* 上面的不用多问，四句一起拷贝就可以了，大概意思就是把value值设置为0像素，也就是肉眼无法看到，但却又是存在的（用$_POST['submit_btn'] 可以证明）*/
}
</style>
</head>

<body>
	<div id="div1">
		<div id="div2">
			<form role="form" action="PostList" method="post">
				<div class="form-group">
					<input style="width: 200px;float: left; height: 30px" type="text"
						class="form-control" name="querytitle" placeholder="输入关键字">
					<input type="hidden" name="actionType" value="themeQuery" />
					&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" id="submit_btn" />
				</div>
			</form>
			<!-- 发帖的按钮 -->
			<button class="btn btn-info"
				style="float:right; margin-top:-50px; margin-right:-30px"
				type="button" onClick="addPost()">发帖</button>
		</div>
		<div id="content">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr id="tab_title">
						<th>帖子标题</th>
						<th style="text-align:center">发帖时间</th>
						<th style="text-align:right">浏览次数</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${posts}" var="post">
						<tr id="tab_item">
							<td><a href="postDetail.jsp?postID=${post.postID}&pageNum=1">${post.title}</a>
							</td>
							<td style="text-align:center">${post.publishTime}</td>
							<td style="text-align:right">${post.pageview}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<c:if test="${not empty pages}">
				<div class="page">${pages}</div>
			</c:if>
		</div>
	</div>
</body>
</html>
