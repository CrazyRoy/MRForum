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
	String userID = request.getParameter("userID");
	String pageNum = request.getParameter("pageNum");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>我的评论</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	function setContent() {
		$.ajax({
			url : "UserComments",
			type : "POST",
			dataType : "json",
			data : {
				userID : $("#backCenter").attr("userID"),
				pageNum : $("#backCenter").attr("pageNum")
			},
			success : function(value) {
				setData(value);
			},
			error : function(value) {
				alter("error");
			},
		});
	};
	
	
	// 设置数据
	function setData(value) {
		var state = value.state;
		if(state == "haveComments") {
			var comments = value.comments;
			var pages = value.pages;
			var page = value.page;
			setComments(comments);
			setPages(page, pages);
		}else {
			var str = "<div style='text-align:center; font-size:20px; padding:70px;'>暂无评论</div>";
			$("#comment").html(str);
		}
	};
	
	/** 用于填充帖子的评论信息  */
	function setComments(obj) {
		var str = "";
		for ( var i = 0; i < obj.length; i++) {
			str += "<div class='panel panel-warning'>"
					+ "<div class='panel-heading'>"
						+ "<img class='img-circle' style='width:30px; height:30px; float:left; margin-right:20px' src='http://localhost:8080" + obj[i].userPhoto +"'/>" 
						+ "<div id='foot2' style='margin-right:20px'>"
						+ "帖子标题：<a href='postDetail.jsp?postID=" + obj[0].postID + "&pageNum=1'>" + obj[i].postTitle + "</a>"
						+ "</div>"
						+ "<div id='foot2'>"
						+ "评论时间:" + obj[i].commentTime
						+ "</div>"
						+ "<div style='float:right; display: inline'>"
							+ "<button class='btn btn-danger btn-sm' type='button' onClick='deteleComment(" + obj[i].id + ")'>删除</button>"
						+ "</div>"
					+ "</div>"
					+ "<div class='panel-body'>"
						+ "<div id='message'>" + obj[i].content 
						+ "</div>"
					+ "</div>" 
				+ "</div>";
		}
		$("#comment").html($(str));
	};
	
	// 设置分页的按钮和文本框
	function setPages(page, pages) {
		var str = "";
		var strGo = "";
		var userID = $("#backCenter").attr("userID");
		if(pages > 1) {
			for(var i = 1; i <= pages; i++) {
				if (i == page) {
					str += "<li class='disabled'><a href='userComments.jsp?userID="
							+ userID + "&pageNum=" + i + "' target='content'>" + i + "</a></li>";
				} else {
					str += "<li class='active'><a href='userComments.jsp?userID="
							+ userID + "&pageNum=" + i + "' target='content'>" + i + "</a></li>";
				}
			}
			strGo = "<input type='text' id='goText' name='pageNum' placeholder='页码'>"
					+ "<input type='hidden' id='commentID' name='userID' value=" + userID + ">"
					+ "<button class='btn btn-info' type='button' onClick='go()'>&raquo;</button>";
					
			$("#pageGo").html(strGo);
			$("#pageButton").html(str);
		}
	}
	
	//	跳转到指定页数的方法
	function go() {
		$.ajax({
			url : "UserComments",
			type : "POST",
			dataType : "json",
			data : {
				userID : $("#backCenter").attr("userID"),
				pageNum : $("#goText").val()
			},
			success : function(value) {
				setData(value);
			},
			error : function(data) {
				alert("error");
			},
		});
	};
	
	// 发帖
	function addPost() {
		userID = $("#backCenter").attr("userID");
		window.location.href = "addPost.jsp?userID="
							+ userID;
	};
	
	// 删除评论
	function deteleComment(id) {
		if (confirm("确认要删除该条评论？")) {
         $.ajax({
			url : "DeleteComments",
			type : "POST",
			dataType : "json",
			data : {
				commentID : id
			},
			success : function(value) {
				if(value.state == "success") {
					alert("删除成功！");
					window.location.reload();// 刷新页面 
				}else {
					alert("删除失败！");
				}
			},
			error : function(data) {
				alert("error");
			},
		});
        }else {
        	
        }
	};
</script>
<style type="text/css">
body {
	background-color: #EBEBEB;
	margin-top: 50px;
}

#backCenter {
	margin: auto auto;
	padding: 40px;
	width: 75%;
	height: 900px;
	background-color: #FFFFFF;
}

#div1 {
	width: 730px;
	height: 35px;
	margin-left: 60px;
	margin-bottom: 10px;
}

#foot2 {
	width: 150px;
	display: inline;
}

#content {
	width: 85%;
	height: 470px;
	margin: auto auto;
}

#tab_title {
	text-align: center;
	color: #0088D8;
}

#comment {
	padding: 10px;
}

#submit_btn {
	margin-top: -22px;
	margin-left: 210px;
	width: 31px;
	height: 31px;
	background: url(images/search.png) no-repeat center;
	cursor: pointer;
	display: block;
	font-size: 0;
	line-height: 0;
	text-indent: -9999px;
}

#pageDiv {
	float: right;
	width: 700px;
	margin-right: 40px;
	margin-top: -20px;
}

#pageNum {
	width: 80px;
}

#pageGo {
	margin-top: 20px;
	float: right;
}

#goText {
	width: 80px;
	margin-right: 10px;
}

#pages {
	width: 80px;
	float: right;
}
</style>
</head>
<body onload="setContent();">
	<div id="backCenter" userID=<%=userID %> pageNum=<%=pageNum %>>
		<div id="div1">
			<div>
				<font size="3px" color="#0088D8"><b>当前位置 &nbsp;&nbsp;》》》&nbsp;&nbsp;</b></font>我的评论
			</div>
			<!-- 发帖的按钮 -->
			<button class="btn btn-info"
				style="float:right; margin-top:-30px; margin-right:-65px"
				type="button" onClick="addPost()">发帖</button>
		</div>
		<div id="content">
			<div pageNum=<%=pageNum%> id="comment"></div>
			<div id="pageDiv">
				<div id="pageGo"></div>
				<div id="pages">
					<ul id="pageButton" class='pagination'>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
