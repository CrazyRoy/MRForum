<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%
	String postID = request.getParameter("postID");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminPostDetail.jsp' starting page</title>
    
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
		//	判断是否登录
		$.ajax({
			url : "PostDetail",
			type : "POST",
			dataType : "json",
			data : {
				actionType : "back",
				postID : $("#content").attr("postID")
			},
			success : function(value) {
				if(value.state == "success"){
					setData(value.post);
				}
			},
			error : function() {
			},
		});
	};
	
	function setData(post) {
		var html = "<div><font size='3px' color='#0088D8'><b>当前位置 &nbsp;&nbsp;》》》&nbsp;&nbsp;</b></font>帖子详情<br/><br/></div>"
					+"<div class='panel panel-primary'>"
					+ "<div class='panel-heading'>" + "<div id='title'>"
					+ post[0].title.substring(0,30)
					+ "</div>"
					+ "</div>"
					+ "<div class='panel-body'>"
					+ "<div id='message'>"
					+ post[0].content
					+ "</div>"
					+ "<div style='float:right; margin-bottom:50px'>"
					+ "<img class='img-circle' style='width:50px; height:50px;' alt='140x140' src='images/icon.jpg' />"
					+ "</div>"
					+ "</div>"
					+ "<div class='panel-footer'>"
					+ "<div id='foot1' style='margin-right:190px'>作者："
					+ post[0].account
					+ "</div>"
					+ "<div id='foot1' style='margin-right:150px'>发帖时间："
					+ post[0].publishTime
					+ "</div>"
					+ "<div id='foot2'>访问量："
					+ post[0].pageview + "</div>"
					+ "</div>" + "</div>";
		$("#content").html(html);
	};
	
</script>

<style type="text/css">
#content {
	margin-top:30px;
	margin-right:40px;
}

#foot1 {
	width: 100px;
	margin-right: 150px;
	display: inline;
}

#foot2 {
	width: 100px;
	display: inline;
}

</style>
  </head>
  <body onload="setContent()">
    <div postID=<%=postID %> id="content">
    </div>
  </body>
</html>
