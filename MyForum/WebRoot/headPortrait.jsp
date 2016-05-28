<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	String userID = request.getParameter("userID");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'personData.jsp' starting page</title>

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
				actionType : "set",
				userID : $("#setting-avator").attr("userID"),
			},
			success : function(value) {
				var user = value.user;
				$("#myPhoto").attr("src",
						"http://localhost:8080" + user[0].photo);
			},
			error : function() {
				alert("error");
			},
		});
	};
</script>
<style type="text/css">
#setting-avator {
	float: left;
	margin: 100px auto auto 300px;
}

#change {
	margin: 20px auto auto 80px;
}

#avator-btns {
	float: right;
}
</style>
</head>
<body onload="setContent()">
	<div id="setting-avator" userID=<%=userID%>>
		<div>
			<div>
				<img class='img-circle' id="myPhoto" src="images/icon.jpg" height="200px" width="200px" />
			</div>
		</div>
		<div>
			<div id="avator-btns">
				<div>
					<form action="HeadImage" enctype="multipart/form-data"
						method="post">
						<br /> <input type="file" name="image" />
						<br /> <input type="hidden" name="operatorID" value=<%=userID%>>
						<input type="submit" value=" 提 交 " />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
							type="reset" value="重 置 " />
					</form>
				</div>
			</div>
			<div style="display:none;">
				<span hidefocus="true" id="avator-btn-save" aria-role="button">保存</span>
			</div>
		</div>
	</div>
</body>
</html>
