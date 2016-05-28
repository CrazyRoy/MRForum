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
	String pageNum = request.getParameter("pageNum");
	String dealType = "allPosts";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'postsManage.jsp' starting page</title>
    
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
				dealType :  "all",
				pageNum : $("#content").attr("pageNum")
			},
			success : function(value) {
				setData(value.posts);
				if(value.pages > 1) {
					setPages(value.page, value.pages);
				}
			},
			error : function(value) {
				alter("error");
			},
		});
		};

		function setData(posts) {
			var str = "";
			for(var i = 0 ; i < posts.length ; i++) {
				str += "<tr>"
						+ "<td style='text-align:center'>" + posts[i].title.substring(0,10) + "</td>"
						+ "<td style='text-align:center'>" + posts[i].publishTime +"</td>"
						+ "<td style='text-align:center'>" + posts[i].pageview +"</td>"
						+ "<td style='text-align:center'><button class='btn btn-info btn-sm' type='button' onClick='view(" + posts[i].postID +")'>查看</button>&nbsp;&nbsp;<button class='btn btn-danger btn-sm' type='button' onClick='delcfm(" + posts[i].postID + ")'>删除</button></td>"
					+ "</tr>";
			}
			$("#posts").html(str);
		};
		
		function setPages(page, pages) {
			var strGo = "";
			var str = "";
			for(var i = 1; i <= pages; i++) {
				if (i == page) {
					str += "<li class='disabled'><a href='admin/postsManage.jsp?pageNum=" + i + "' target='backContent'>" + i + "</a></li>";
				} else {
					str += "<li class='active'><a href='admin/postsManage.jsp?pageNum=" + i + "' target='backContent'>" + i + "</a></li>";
				}
			}
			strGo = "<input type='text' id='goText' name='pageNum' placeholder='页码'>"
					+ "<button class='btn btn-info' type='button' onClick='go()'>&raquo;</button>";
					
			$("#pageGo").html(strGo);
			$("#pageButton").html(str);
		};
		
		//	跳转到指定页数的方法
	function go() {
		$.ajax({
			url : "UserPosts",
			type : "POST",
			dataType : "json",
			data : {
				dealType :  "all",
				pageNum : $("#goText").val()
			},
			success : function(value) {
				setData(value.posts);
				if(value.pages > 1) {
					setPages(value.page, value.pages);
				}
			},
			error : function(data) {
				alert("error");
			},
		});
	};
	// 确认删除
	function delcfm(id) {
        if (confirm("确认要删除？")) {
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
    
    // 查看帖子
    function view(id) {
    	window.location.href = "admin/adminPostDetail.jsp?postID=" + id;
    };
    
	</script>
<style type="text/css">
body {
	background-color: #FFFFFF;
	margin-top: 40px;
}

#content {
	margin: 20px 60px 0px auto;
	height: 400px;
}

#tab_title {
	text-align: center;
	color: #0088D8;
}

#pageDiv {
	float: right;
	width: 500px;
	margin-right: 20px;
	margin-top: -0px;
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
  <body onload="setContent()">
	<div id="content" pageNum=<%=pageNum %> dealType=<%=dealType %>>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr id="tab_title">
					<th style="text-align:center">帖子标题</th>
					<th style="text-align:center">发帖时间</th>
					<th style="text-align:center">浏览次数</th>
					<th style="text-align:center">操作</th>
				</tr>
			</thead>
			<tbody id="posts">
			</tbody>
		</table>
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
