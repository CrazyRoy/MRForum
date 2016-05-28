<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

<title>My JSP 'search.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.js">
</script>
<script src="js/bootstrap.min.js">
</script>
<style type="text/css">
#div1 {
	margin: 110px 460px;
}

#div2 {
	width: 580px;
	height: 60px;
}

#div3 {
	width: 420px;
	float: left;
	height: 35px;
	margin-left: 0px;
}

#submit_btn {
	margin-top: -20px;
	margin-left: 440px;
	width: 33px;
	height: 33px;
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
		<form role="form" action="PostList" method="post">
			<img src="images/logo.png" width="448" height="201"> <br>
			<br>
			<div id="div2" class="form-group">
				<input id="div3" type="text" class="form-control" name="querytitle"
					placeholder="搜贴、找人、搜板块"> &nbsp;&nbsp;<input type="hidden"
					name="actionType" value="indexQuery" /> &nbsp;&nbsp; <input
					type="submit" id="submit_btn" />
			</div>
		</form>
	</div>
</body>
</html>
