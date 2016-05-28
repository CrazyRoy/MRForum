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
    <title>My JSP 'userPosts.jsp' starting page</title>
    
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
			url : "UserPosts",
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
		if(state == "havePosts") {
			var posts = value.posts;
			var pages = value.pages;
			var page = value.page;
			setPosts(posts);
			
			setPages(page, pages);
		}else {
			var str = "<div style='text-align:center; font-size:20px; padding:70px;'>暂无评论</div>";
			$("#userposts").html(str);
		}
	};
	
	//  添加我的帖子内容
	function setPosts(posts) {
		var str = "";
		for(var i = 0 ; i < posts.length ; i++) {
			str += "<tr id='tab_item'>"
					+ "<td style='text-align:center'><a href='postDetail.jsp?postID=" + posts[i].postID + "&pageNum=1'>" + posts[i].title + "</a></td>"
					+ "<td style='text-align:center'>" + posts[i].publishTime +"</td>"
					+ "<td style='text-align:center'>" + posts[i].pageview +"</td>"
					+ "<td style='text-align:center'><button class='btn btn-warning btn-sm' type='button' onClick='delcfm(" + posts[i].postID + ")'>删除</button></td>"
					+ "</tr>";
		}
		$("#userposts").html(str);
	}
	
	// 设置分页的按钮和文本框
	function setPages(page, pages) {
		var str = "";
		var strGo = "";
		var userID = $("#backCenter").attr("userID");
		if(pages > 1) {
			for(var i = 1; i <= pages; i++) {
				if (i == page) {
					str += "<li class='disabled'><a href='userPosts.jsp?userID="
							+ userID + "&pageNum=" + i + "' target='content'>" + i + "</a></li>";
				} else {
					str += "<li class='active'><a href='userPosts.jsp?userID="
							+ userID + "&pageNum=" + i + "' target='content'>" + i + "</a></li>";
				}
			}
			strGo = "<input type='text' id='goText' name='pageNum' placeholder='页码'>"
					+ "<button class='btn btn-info' type='button' onClick='go()'>&raquo;</button>";
					
			$("#pageGo").html(strGo);
			$("#pageButton").html(str);
		}
	}
	
	//	跳转到指定页数的方法
	function go() {
		$.ajax({
			url : "UserPosts",
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
	
	// 确认删除
	function delcfm(id) {
        if (confirm("确认要删除该条帖子？")) {
         $.ajax({
			url : "DeletePosts",
			type : "POST",
			dataType : "json",
			data : {
				postID : id
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
	height: 700px;
	background-color: #FFFFFF;
}

#div1 {
	width: 730px;
	height: 35px;
	margin-left: 60px;
	margin-bottom: 10px;
}

#content {
	width: 80%;
	height: 470px;
	margin: auto auto;
}

#tab_title {
	text-align: center;
	color: #0088D8;
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
	margin-right: 95px;
	margin-top: 50px;
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
				<font size="3px" color="#0088D8"><b>当前位置 &nbsp;&nbsp;》》》&nbsp;&nbsp;</b></font>我的帖子
			</div>
			<!-- 发帖的按钮 -->
			<button class="btn btn-info"
				style="float:right; margin-top:-30px; margin-right:-60px"
				type="button" onClick="addPost()">发帖</button>
		</div>
		<div id="content">
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr id="tab_title">
						<th style="text-align:center">帖子标题</th>
						<th style="text-align:center">发帖时间</th>
						<th style="text-align:center">浏览次数</th>
						<th style="text-align:center">操作</th>
					</tr>
				</thead>
				<tbody id="userposts">
				</tbody>
			</table>
		</div>
		<div id="pageDiv">
			<div id="pageGo"></div>
			<div id="pages">
				<ul id="pageButton" class='pagination'>
				</ul>
			</div>
		</div>
  	</div>
  </body>
</html>
