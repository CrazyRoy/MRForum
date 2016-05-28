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
			url : "UserServlet",
			type : "POST",
			dataType : "json",
			data : {
				actionType :  "view",
				pageNum : $("#content").attr("pageNum")
			},
			success : function(value) {
				setData(value.users);
				if(value.pages > 1) {
					setPages(value.page, value.pages);
				}
			},
			error : function(value) {
				alter("error");
			},
		});
		};

		function setData(users) {
			var str = "";
			for(var i = 0 ; i < users.length ; i++) {
				str += "<tr>"
						+ "<td style='text-align:center'>" + users[i].account + "</td>"
						+ "<td style='text-align:center'>" + users[i].name +"</td>"
						+ "<td style='text-align:center'>" + users[i].gender +"</td>"
						+ "<td style='text-align:center'>" + users[i].email +"</td>"
						+ "<td style='text-align:center'><img class='img-circle' style='width:30px; height:30px;' src='http://localhost:8080" + users[i].photo +"'/></td>";
					if(users[i].state == 1) {
						str += "<td style='text-align:center'><button class='btn btn-info btn-sm' type='button' onClick='unfreezecfm(" + users[i].userID +")'>解冻账号</button></td>";
					}else {
						str +=  "<td style='text-align:center'><button class='btn btn-warning btn-sm' type='button' onClick='freezecfm(" + users[i].userID +")'>冻结账号</button></td>";
					}
				str += "</tr>";
			}
			$("#users").html(str);
		};
		
		function setPages(page, pages) {
			var strGo = "";
			var str = "";
			for(var i = 1; i <= pages; i++) {
				if (i == page) {
					str += "<li class='disabled'><a href='admin/usersManage.jsp?pageNum=" + i + "' target='backContent'>" + i + "</a></li>";
				} else {
					str += "<li class='active'><a href='admin/usersManage.jsp?pageNum=" + i + "' target='backContent'>" + i + "</a></li>";
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
			url : "UserServlet",
			type : "POST",
			dataType : "json",
			data : {
				actionType :  "view",
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
	
	// 确认冻结账号
	function freezecfm(id) {
        if (confirm("确认要冻结该用户？  冻结之后该用户将没有发帖和评论权限...")) {
         $.ajax({
			url : "UserServlet",
			type : "POST",
			dataType : "json",
			data : {
				actionType :  "deal",
				dealType : "freeze",
				userID : id
			},
			success : function(value) {
				if(value.state == "freezeSuccess") {
					alert("成功冻结该用户！");
					window.location.reload();// 刷新页面 
				}else {
					alert("冻结失败！");
				}
			},
			error : function(data) {
				alert("error");
			},
		});
        }else {
        	
        }
    };
    
    // 确认解冻账号
	function unfreezecfm(id) {
        if (confirm("确认要解冻该用户？  解冻之后该用户将拥有发帖和评论权限...")) {
         $.ajax({
			url : "UserServlet",
			type : "POST",
			dataType : "json",
			data : {
				actionType :  "deal",
				dealType : "unfreeze",
				userID : id
			},
			success : function(value) {
				if(value.state == "unfreezeSuccess") {
					alert("成功解冻该用户！");
					window.location.reload();// 刷新页面 
				}else {
					alert("解冻失败！");
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
	<div id="content" pageNum=<%=pageNum %>>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr id="tab_title">
					<th style="text-align:center">账号</th>
					<th style="text-align:center">昵称</th>
					<th style="text-align:center">性别</th>
					<th style="text-align:center">邮箱</th>
					<th style="text-align:center">头像</th>
					<th style="text-align:center">操作</th>
				</tr>
			</thead>
			<tbody id="users">
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
