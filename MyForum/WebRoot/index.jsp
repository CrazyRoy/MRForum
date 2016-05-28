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

<title>Bwly论坛</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	window.onload = function() {

		var name1 = document.getElementById("userName");
		//用户名
		var name2 = document.getElementById("regAccount");
		//昵称
		var password = document.getElementById("regPwd1");
		//密码
		var password2 = document.getElementById("regPwd2");
		//确认密码

		/*用户名验证*/
		name1.onfocus = function() {
			name1_msg.innerHTML = "1-4个汉字或字母";
		};

		name1.onkeyup = function() {

		};

		name1.onblur = function() {
			//含有非法字符
			var re = /[^\w\u4e00-\u9fa5]/g;
			if (re.test(this.value)) {
				name1_msg.innerHTML = "ps:含有非法字符！";
			}
			//不能为空
			else if (this.value == "") {
				name1_msg.innerHTML = "ps:用户名不能为空！";
			}
			//长度超过10个汉字或字母
			else if (this.value.length > 4) {
				name1_msg.innerHTML = "ps:长度超过10个汉字或字母！";
			}
			//验证通过
			else {
				name1_msg.innerHTML = '<img src="images/ok.png"/ width=20 height=20>';
			}
		};

		/*用户昵称验证*/
		name2.onfocus = function() {
			name2_msg.innerHTML = "ps:2-8个汉字或字母";
		};

		name2.onkeyup = function() {

		};

		name2.onblur = function() {
			//含有非法字符
			var re = /[^\w\u4e00-\u9fa5]/g;
			if (re.test(this.value)) {
				name2_msg.innerHTML = "ps:含有非法字符！";
			}
			//不能为空
			else if (this.value == "") {
				name2_msg.innerHTML = "ps:用户昵称不能为空！";
			}
			//长度超过10个汉字或字母
			else if (this.value.length > 8) {
				name2_msg.innerHTML = "ps:长度超过8个汉字或字母！";
			}
			//长度少于2个汉字或字母
			else if (this.value.length < 2) {
				name2_msg.innerHTML = "ps:长度少于2个汉字或字母！";
			}
			//用户名与用户昵称不能相同
			else if (this.value == name1.value) {
				name2_msg.innerHTML = "ps:用户名与用户昵称不能相同！";
			}
			//验证通过
			else {
				name2_msg.innerHTML = '<img src="images/ok.png"/ width=20 height=20>';
			}
		};

		/*密码验证*/
		password.onfocus = function() {
			password1_msg.innerHTML = "ps:6-10个数字或字母";
		};

		password.onkeyup = function() {

		};

		password.onblur = function() {
			//含有非法字符
			var re = /[^\w\u4e00-\u9fa5]/g;
			if (re.test(this.value)) {
				password1_msg.innerHTML = "ps:含有非法字符！";
			}
			//不能为空
			else if (this.value == "") {
				password1_msg.innerHTML = "ps:密码不能为空！";
			}
			//长度超过10个汉字或字母
			else if (this.value.length > 10) {
				password1_msg.innerHTML = "ps:长度超过10！";
			}
			//长度少于2个汉字或字母
			else if (this.value.length < 6) {
				password1_msg.innerHTML = "ps:长度少于6！";
			}
			//验证通过
			else {
				password1_msg.innerHTML = '<img src="images/ok.png"/ width=20 height=20>';
			}
		};

		/*密码再次验证*/
		password2.onfocus = function() {
			password2_msg.innerHTML = "请再次输入密码";
		};

		password2.onkeyup = function() {

		};

		password2.onblur = function() {
			//var re = /[^\w\u4e00-\u9fa5]/g;
			//不能为空
			if (this.value == "") {
				password2_msg.innerHTML = "确认密码不能为空！";
			}
			//验证通过
			else if (this.value != password.value) {
				password2_msg.innerHTML = "密码输入不一样！";
			}
			//验证通过
			else {
				password2_msg.innerHTML = '<img src="images/ok.png"/ width=20 height=20>';
			}
		};
	};
	
		$(document).ready(function($) {
		$('.theme-login').click(function() {
			$('.theme-popover-mask').show();
			$('.theme-popover-mask').height($(document).height());
			$('.theme-popover').slideDown(200);
		});

		$('.theme-reg').click(function() {
			$('.theme-popover-mask2').show();
			$('.theme-popover-mask2').height($(document).height());
			$('.theme-popover2').slideDown(200);
		});

		$('.theme-poptit .close').click(function() {
			$('.theme-popover-mask').hide();
			$('.theme-popover').slideUp(200);
		});

		$('.theme-poptit .close2').click(function() {
			$('.theme-popover-mask2').hide();
			$('.theme-popover2').slideUp(200);
		});
	});
	// 登陆
	function login() {
		$
				.ajax({
					url : "LoginServlet",
					type : "POST",
					dataType : "json",
					data : {
						account : $("#account").val(),
						password : $("#password").val()
					},
					success : function(value) {
						alert(value.result);
						$('.theme-popover-mask').hide();
						$('.theme-popover').slideUp(200);
						
						if (value.result == "登陆成功") {
							//var userName = value.userName;
							var userID = value.userID;
							var userAccount = value.userAccount;
							var userPhoto = value.userPhoto;
							$("#userBox")
									.html(
											"<div><img class='img-circle' class='img-cricle' style='width:40px; height:40px; margin-right:20px' alt='140x140' src='http://localhost:8080" + userPhoto +"'/>"
													+ "<font color='#FFFFFF'>欢迎您, &nbsp;&nbsp;</font><font color='#0088D8' size='3px'>"
													+ userAccount
													+ "</font>&nbsp;&nbsp;&nbsp;&nbsp;"
													+ "<div class='btn-group'>"
   													+ "<button type='button' class='btn btn-primary dropdown-toggle' data-toggle='dropdown'>"
      												+ "VIP <span class='caret'></span>"
   													+ "</button>"
   													+ "<ul class='dropdown-menu' role='menu'>"
   													+ "<li><a href='addPost.jsp?userID=" + userID + "&userAccount=" + userAccount +"' target='content'>发帖</a></li>"
   													+ "<li class='divider'></li>"
      												+ "<li><a href='userPosts.jsp?userID=" + userID + "&pageNum=1' target='content'>我的帖子</a></li>"
      												+ "<li><a href='userComments.jsp?userID=" + userID + "&pageNum=1' target='content'>我的评论</a></li>"
											 	    + "<li class='divider'></li>"
      												+ "<li><a href='information.jsp?userID=" + userID + "' target='content'>个人资料</a></li>"
   													+ "</ul>"
													+ "</div>;"
													+ "&nbsp;&nbsp;&nbsp;<a href='Logout' class='btn btn-primary theme-reg'>注销</a></div>");
						} else {
							//	登陆失败清空登陆框的信息
							$("#account").val("");
							$("#password").val("");
						}
					},
				});
	};
	//  注册		
	function register() {
		$.ajax({
			url : "RegisterServlet",
			type : "POST",
			dataType : "json",
			data : {
				regUserName : $("#userName").val(),
				regAccount : $("#regAccount").val(),
				regPassword : $("#regPwd2").val()
			},
			success : function(value) {
				alert(value.result);
				$('.theme-popover-mask2').hide();
				$('.theme-popover2').slideUp(200);
			},
		});
	};
	
	//  展示页面
	function showMessage() {
		$("#userInfo").slideDown(200);
	};
</script>
<style type="text/css">
.title {
	font-size: 30px;
	margin-left: 20px;
	margin-right: 20px;
}

* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

a,img {
	border: 0;
}

body {
	font: 12px/180% microsoft yahei;
}

a {
	color: #0088DB;
	text-decoration: none;
	cursor: pointer
}

a:hover {
	color: #2A5E8E
}

/* input */
input {
	font-size: 12px;
	font-size: 100%;
	font-family: microsoft yahei;
	outline: none;
	line-height: normal;
	color: #444;
}

.ipt {
	border: solid 1px #d2d2d2;
	border-left-color: #ccc;
	border-top-color: #ccc;
	border-radius: 2px;
	box-shadow: inset 0 1px 0 #f8f8f8;
	background-color: #fff;
	padding: 4px 6px;
	height: 21px;
	line-height: 21px;
	color: #555;
	width: 180px;
	vertical-align: baseline;
}

.ipt:focus {
	border-color: #95C8F1;
	box-shadow: 0 0 4px #95C8F1;
}

/* btn */
.btn {
	position: relative;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	font-size: 12px;
	font-weight: bold;
	height: 27px;
	line-height: 27px;
	min-width: 52px;
	padding: 0 12px;
	text-align: center;
	text-decoration: none;
	border-radius: 2px;
	border: 1px solid #ddd;
	color: #0088D8;
	background-color: #0088D8;
	background: -webkit-linear-gradient(top, #0088D8, #0088D8);
	background: -moz-linear-gradient(top, #0088D8, #0088D8);
	background: linear-gradient(top, #0088D8, #0088D8);
}

input.btn {
	height: 29px;
}

.btn:hover {
	border-color: #0088D8;
	color: #0088D8;
	background-color: #0088D8;
	background: -webkit-linear-gradient(top, #0088D8, #0088D8);
	background: -moz-linear-gradient(top, #0088D8, #0088D8);
	background: linear-gradient(top, #0088D8, #0088D8);
	box-shadow: #0088D8 0 1px 1px 0;
}

.btn:active,.btn.btn-active {
	box-shadow: #0088D8 0 1px 2px 0 inset;
	border-color: #0088D8;
}

.btn:focus {
	border-color: #0088D8;
	outline: none
}

.btn-primary {
	border-color: #0088D8;
	color: #FFFFFF;
	background-color: #0088D8;
	background: -webkit-linear-gradient(top, #0088D8, #0088D8);
	background: -moz-linear-gradient(top, #4D90FE, #4787ED);
	background: linear-gradient(top, #4D90FE, #4787ED);
}

.btn-primary:hover {
	border-color: #0088D8;
	color: #0088D8;
	background-color: #0088D8;
	background: -webkit-linear-gradient(top, #FFFFFF, #FFFFFF);
	background: -moz-linear-gradient(top, #4D90FE, #357AE8);
	background: linear-gradient(top, #4D90FE, #357AE8);
}

.btn-primary:active {
	box-shadow: #2176D3 0 1px 2px 0 inset;
	border-color: #3079ED;
}

.btn-primary:focus {
	border-color: #4d90fe;
	outline: none
}

.oo {
	margin-right: 5px;
}

.theme-signin {
	font-size: 15px;
}

.theme-popover-mask {
	z-index: 1;
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	display: none;
}

.theme-popover-mask2 {
	z-index: 1;
	position: absolute;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background: #000;
	opacity: 0.5;
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	display: none;
}

.theme-popover {
	z-index: 9;
	position: absolute;
	top: 50%;
	left: 52%;
	width: 350px;
	height: 350px;
	margin: -150px 0 0 -200px;
	border-radius: 5px;
	border: solid 2px #e4e4e4;
	background-color: #fff;
	display: none;
	box-shadow: 0 0 10px #666;
	background: #fff;
}

.userInfo {
	z-index: 10;
	position: absolute;
	top: 50px;
	right: 50px;
	width: 350px;
	height: 350px;
	border-radius: 5px;
	border: solid 2px #e4e4e4;
	background-color: #fff;
	display: none;
	box-shadow: 0 0 10px #666;
	background: blue;
}

.theme-popover2 {
	z-index: 9;
	position: absolute;
	top: 50%;
	left: 45%;
	width: 350px;
	height: 500px;
	margin: -250px 0 0 -100px;
	border-radius: 5px;
	border: solid 2px #e4e4e4;
	background-color: #fff;
	display: none;
	box-shadow: 0 0 10px #666;
	background: #fff;
}

.theme-poptit {
	border-bottom: 1px solid #ddd;
	padding: 8px;
	position: relative;
	height: 24px;
}

.theme-poptit .close {
	float: right;
	color: #999;
	padding: 5px;
	margin: -2px -5px -5px;
	font: bold 14px/14px simsun;
	text-shadow: 0 1px 0 #ddd
}

.theme-poptit .close:hover {
	color: #444;
}

.theme-poptit2 {
	border-bottom: 1px solid #ddd;
	padding: 5px;
	position: relative;
	height: 24px;
}

.theme-poptit2.close {
	float: right;
	color: #999;
	padding: 5px;
	margin: -2px -5px -5px;
	font: bold 14px/14px simsun;
	text-shadow: 0 1px 0 #ddd
}

.theme-poptit2.close:hover {
	color: #444;
}

.theme-popbod {
	padding: 60px 15px;
	color: #444;
	height: 148px;
}

.dform {
	height: 40px;
	padding: 80px 60px 40px;
	text-align: center;
}

.theme-signin {
	margin: -50px -20px -50px 0px;
	text-align: left;
	font-size: 14px;
}

.theme-signin h4 {
	color: #999;
	font-weight: 100;
	margin-bottom: 20px;
	font-size: 20px;
}

.theme-signin li {
	padding-left: 80px;
	margin-bottom: 15px;
}

.theme-signin li strong {
	float: left;
	margin-left: -80px;
	width: 80px;
	text-align: right;
	line-height: 40px;
	text-size: 20px;
}

.theme-signin .btn {
	margin-top: 30px;
	margin-right: 83px;
	margin-bottom: 10px;
}

.theme-signin p {
	margin-top: 20px;
	font-size: 12px;
	color: #999;
}

.theme-signin input {
	height: 30px;
}

#linkText {
	font-size:15px;
}
</style>

</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		style="padding-top:10px">
		<div class="navbar-header">
			<a href="##" class="navbar-brand title">BwLy</a>
		</div>
		<ul class="nav nav-pills pull-left">
			<li onClick="addClass_(e)"><a id="linkText" href="home.jsp" target="content"
				id="navBar1" onClick="bar()">首页</a></li>
			<li onClick="addClass_()"><a id="linkText" href="ThemeServlet"
				target="content" id="navBar2">贴帖中心</a>
			</li>
			<li onclick="addClass_()"><a id="linkText" href="search.jsp" target="content"
				id="navBar3">搜搜一下</a></li>
			<li onclick="addClass_()"><a id="linkText" href="aboutUs.jsp" target="content"
				id="navBar6">关于我们</a>
			</li>
		</ul>




		<div class="pull-right" id="userBox"
			style="margin-right:40px; margin-top:8px"
			style="positon:absolute; right:30px; top: 10px">
			&nbsp; &nbsp; &nbsp; &nbsp; <a class="btn btn-primary theme-login"
				id="login" href="javascript:;">登录</a> <a
				class="btn btn-primary theme-reg" id="reg" href="javascript:;">注册</a>
		</div>
	</div>
	<!-- 登陆页面    -->
	<div class="theme-popover-mask"></div>

	<div class="theme-popover">
		<div class="theme-poptit">
			<a href="javascript:;" title="关闭" class="close">×</a>
			<h3>登录</h3>
		</div>
		<form class="theme-popbod dform">
			<div class="theme-signin">
				<p>
					<strong>用户名:&nbsp;&nbsp;&nbsp;&nbsp;</strong><input class="ipt"
						type="text" id="account" placeholder="用户名" size="20" />
				</p>
				<p>
					<strong>密&nbsp;&nbsp;码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong><input
						class="ipt" type="password" id="password" placeholder="用户密码"
						size="20" />
				</p>
				<div style="margin-top:20px">
					<input class="btn btn-primary" type="button" onClick="login()"
						value=" 登 录 " style="margin-left: 0px;" /> <input
						class="btn btn-primary" type="reset" name="reset" value=" 重  置 "
						style="margin-right: -10px;" />
				</div>
			</div>
		</form>
	</div>

	<!-- 注册页面    -->
	<div class="theme-popover-mask2"></div>

	<div class="theme-popover2">
		<div class="theme-poptit">
			<a href="javascript:;" title="关闭" class="close2">×</a>
			<h3>注册</h3>
		</div>
		<form class="theme-popbod dform">
			<div class="theme-signin">
				<p>
					<strong>账&nbsp;&nbsp;号:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong><input
						class="ipt" type="text" id="regAccount" placeholder="用户名"
						size="20" /> <font color="#0088D8"><nobr id="name1_msg"></nobr>
					</font>
				</p>

				<p>
					<strong>昵&nbsp;&nbsp;称:&nbsp;&nbsp;&nbsp;&nbsp;</strong> <input
						class="ipt" type="text" id="userName" placeholder="取一个专属的昵称吧"
						size="20" /> <font color="#0088D8"><nobr id="name2_msg"></nobr>
					</font>
				</p>

				<p>
					<strong>密&nbsp;&nbsp;码:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong><input
						class="ipt" type="password" id="regPwd1" placeholder="请输入你的密码"
						size="20" /> <font color="#0088D8"><nobr
							id="password1_msg"></nobr> </font>
				</p>

				<p>
					<strong>确认密码:&nbsp;&nbsp;&nbsp;</strong><input class="ipt"
						type="password" id="regPwd2" placeholder="请再次输入你的密码" size="20" />
					<font color="#0088D8"><nobr id="password2_msg"></nobr> </font>
				</p>

				<div style="margin-top:20px">
					<input class="btn btn-primary" type="button" onClick="register()"
						value=" 注 册 " style="margin-left: -10px;" /> <input
						class="btn btn-primary" type="reset" name="reset" value=" 重  置 "
						style="margin-right: -10px;" />
				</div>
			</div>
		</form>
	</div>

	<div id="userInfo"></div>

	<div style="width:100%">
		<iframe style="width:100%; height:100%;" src="home.jsp" name="content"
			frameborder="no"></iframe>
	</div>
</body>
</html>
