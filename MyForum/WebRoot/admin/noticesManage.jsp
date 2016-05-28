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
			url : "NoticesAdmin",
			type : "POST",
			dataType : "json",
			data : {
				pageNum : $("#content").attr("pageNum")
			},
			success : function(value) {
				setData(value.notices);
				if(value.pages > 1) {
					setPages(value.page, value.pages);
				}
			},
			error : function(value) {
				alter("error");
			},
		});
		};

		function setData(obj) {
			var str = "";
			for(var i = 0 ; i < obj.length ; i++) {
				str += "<div class='panel panel-info'>"
					+ "<div class='panel-heading'>"
						+ "<div id='foot2' style='margin-right:50px'>"
						+ "公告标题：" + obj[i].title 
						+ "</div>"
						+ "<div id='foot2' style='margin-right:50px'>"
						+ "公布时间:" + obj[i].publishTime 
						+ "</div>"
						+ "<div style='float:right; display: inline'>"
							+ "<button class='btn btn-danger btn-sm' type='button' onClick='deteleNotice(" + obj[i].id + ")'>删除</button>"
						+ "</div>"
					+ "</div>"
					+ "<div class='panel-body'>"
						+ "<div id='message'>" + obj[i].content 
						+ "</div>"
					+ "</div>" 
				+ "</div>";
			}
			$("#notices").html(str);
		};
		
		function setPages(page, pages) {
			var strGo = "";
			var str = "";
			for(var i = 1; i <= pages; i++) {
				if (i == page) {
					str += "<li class='disabled'><a href='admin/noticesManage.jsp?pageNum=" + i + "' target='backContent'>" + i + "</a></li>";
				} else {
					str += "<li class='active'><a href='admin/noticesManage.jsp?pageNum=" + i + "' target='backContent'>" + i + "</a></li>";
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
			url : "NoticesAdmin",
			type : "POST",
			dataType : "json",
			data : {
				pageNum : $("#goText").val()
			},
			success : function(value) {
				setData(value.notices);
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
	function deteleNotice(id) {
        if (confirm("确认要删除？")) {
         $.ajax({
			url : "NoticesAdmin",
			type : "POST",
			dataType : "json",
			data : {
				dealType : "delete",
				noticeID : id
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
    
    // 新增公告
    function addNotice() {
    	window.location.href = "admin/addNotice.jsp";
    };
	</script>
<style type="text/css">
body {
	background-color: #FFFFFF;
}

#content {
	margin: 90px 60px 30px auto;
	height: 400px;
}

#tab_title {
	text-align: center;
	color: #0088D8;
}

#foot2 {
	width: 150px;
	display: inline;
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
  	<div>
		<button class="btn btn-info"
				style="float:right; margin-right:70px; margin-top:-50px;"
				type="button" onClick="addNotice()">新增</button>
	</div>
	<div id="content" pageNum=<%=pageNum %>>
		<div id="notices">
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
