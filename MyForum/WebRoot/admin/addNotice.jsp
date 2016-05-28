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

<title>My JSP 'addNotice.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	// 发布公告
	function submitNotice() {
		$.ajax({
			url : "NoticesAdmin",
			type : "POST",
			dataType : "json",
			data : {
				dealType : "add",
				noticeTitle : $("#noticeTitle").val(),
				noticeContent : $("#noticeText").val()
			},
			success : function(value) {
				if(value.state == "success") {
					alert("发表成功！");
					window.location.href = "admin/noticesManage.jsp?pageNum=1";
				}else {
					alert("发表失败！");
				}
			}, 
			error : function(value) {
			},
		});
	};
</script>
<style type="text/css">
body {
	background-color: #FFFFFF;
	margin-top: 30px;
}

#back {
	margin: auto auto;
	padding: 20px;
}

#postPanel {
	width: 800px;
	height: 400px;
	float: left;
	margin-left: 5px;
}

#mess {
	margin-top: 24px;
	margin-left: 12px;
	color: #0088D8;
}

#topBar {
	margin: auto auto;
	width: 800px;
	text-align: center;
	font-size: 20px;
}

#connent {
	margin-top: 30px;
}

#sendBtn {
	float: right;
	margin-top: 5px;
}

#title {
	width: 60%;
	height: 60px;
}

#sel {
	margin-top: -50px;
	margin-right: 40px;
	width: 200px;
	height: 40px;
	float: right;
}
</style>
</head>
<body>
	<div id="back">
		<div class='panel panel-primary' id="topBar">
			<div class='panel-heading'>发表公告</div>
		</div>
		<div id="connent">
			<div id="postPanel">
				<div class="form-group">
					<b style="color:#0088D8; font-size:24px">标题</b> <input id="noticeTitle"
						type="text" class="form-control" name="query"
						placeholder="帖子标题:建议少于30字">
				</div>
				<div class="form-group" id="discuss">
					<b style="color:#0088D8; font-size:24px">内容</b><br />
					<textarea class="form-control" rows="11" id="noticeText"></textarea>
					<div>
						<button class="btn btn-primary" type="button" id="sendBtn"
							onClick="submitNotice()">发布</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
