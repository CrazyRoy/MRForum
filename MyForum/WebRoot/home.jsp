<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	response.setContentType("text/html;charset=UTF-8");
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'b.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script src="js/jquery-1.11.1.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
	function enter() {
		window.location.href = "ThemeServlet";
	};
</script>

<style type="text/css">
/* 轮播广告 */
.carousel {
	height: 455px;
	margin-bottom: 23px;
}

.carousel .item {
	height: 455px;
	background-color: #000;
}

.carousel .item img {
	width: 100%;
}

.carousel-caption {
	z-index: 10;
}

.carousel-caption p {
	margin-bottom: 5px;
	font-size: 20px;
	line-height: 1.8;
}

/* 简介 */
.summary {
	padding-right: 15px;
	padding-left: 15px;
}

.summary .col-md-4 {
	margin-bottom: 20px;
	text-align: center;
}

/* 特性 */
.feature-divider {
	margin: 40px 0;
}

.feature {
	padding: 30px 0;
}

.feature-heading {
	font-size: 50px;
	color: #2a6496;
}

.feature-heading .text-muted {
	font-size: 28px;
}

/* 响应式布局 */
@media ( max-width : 768px) {
	.summary {
		padding-right: 3px;
		padding-left: 3px;
	}
	.carousel {
		height: 300px;
		margin-bottom: 30px;
	}
	.carousel .item {
		height: 300px;
	}
	.carousel img {
		min-height: 300px;
	}
	.carousel-caption p {
		font-size: 16px;
		line-height: 1.4;
	}
	.feature-heading {
		font-size: 34px;
	}
	.feature-heading .text-muted {
		font-size: 22px;
	}
}

@media ( min-width : 992px) {
	.feature-heading {
		margin-top: 120px;
	}
}
</style>
</head>

<body>
	<!-- 广告轮播 -->
	<div id="ad-carousel" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#ad-carousel" data-slide-to="0" class="active"></li>
			<li data-target="#ad-carousel" data-slide-to="1"></li>
			<li data-target="#ad-carousel" data-slide-to="2"></li>
			<li data-target="#ad-carousel" data-slide-to="3"></li>
			<li data-target="#ad-carousel" data-slide-to="4"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active">
				<img src="images/chrome-big.jpg" alt="1 slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>Chrome</h1>
						<p>Google Chrome，又称Google浏览器，是一个由Google（谷歌）公司开发的网页浏览器。</p>
						<p><button class="btn btn-primary" type="button" onClick="enter()">进入论坛</button></p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="images/firefox-big.jpg" alt="2 slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>Firefox</h1>
						<p>Mozilla Firefox，中文名通常称为“火狐”或“火狐浏览器”，是一个开源网页浏览器。</p>
						<p><button class="btn btn-primary" type="button" onClick="enter()">进入论坛</button></p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="images/safari-big.jpg" alt="3 slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>Safari</h1>
						<p>Safari，是苹果计算机的最新操作系统Mac OS X中的浏览器。</p>
						<p><button class="btn btn-primary" type="button" onClick="enter()">进入论坛</button></p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="images/opera-big.jpg" alt="4 slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>Opera</h1>
						<p>Opera浏览器，是一款挪威Opera Software ASA公司制作的支持多页面标签式浏览的网络浏览器。</p>
						<p><button class="btn btn-primary" type="button" onClick="enter()">进入论坛</button></p>
					</div>
				</div>
			</div>
			<div class="item">
				<img src="images/ie-big.jpg" alt="5 slide">

				<div class="container">
					<div class="carousel-caption">
						<h1>IE</h1>
						<p>Internet Explorer，简称 IE，是微软公司推出的一款网页浏览器。</p>
						<p><button class="btn btn-primary" type="button" onClick="enter()">进入论坛</button></p>
					</div>
				</div>
			</div>
		</div>
		<a class="left carousel-control" href="#ad-carousel" data-slide="prev"><span
			class="glyphicon glyphicon-chevron-left"></span>
		</a> <a class="right carousel-control" href="#ad-carousel"
			data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span>
		</a>
	</div>


	<!-- 主要内容 -->
	<div class="container summary">

		<!-- 简介 -->
		<div class="row" id="summary-container">
			<div class="col-md-4">
				<img class="img-circle" src="images/chrome-logo-small.jpg"
					alt="chrome">
				<h2>Chrome</h2>
				<p>Google Chrome，又称Google浏览器，是一个由Google（谷歌）公司开发的网页浏览器。</p>
			</div>
			<div class="col-md-4">
				<img class="img-circle" src="images/firefox-logo-small.jpg"
					alt="firefox">

				<h2>Firefox</h2>

				<p>Mozilla Firefox，中文名通常称为“火狐”或“火狐浏览器”，是一个开源网页浏览器。</p>
			</div>
			<div class="col-md-4">
				<img class="img-circle" src="images/safari-logo-small.jpg"
					alt="safari">

				<h2>Safari</h2>

				<p>Safari，是苹果计算机的最新操作系统Mac OS X中的浏览器。</p>
			</div>
		</div>

		<!-- 特性 -->

		<hr class="feature-divider">

		<ul class="nav nav-tabs" role="tablist" id="feature-tab">
			<li class="active"><a href="#tab-chrome" role="tab"
				data-toggle="tab">Chrome</a>
			</li>
			<li><a href="#tab-firefox" role="tab" data-toggle="tab">Firefox</a>
			</li>
			<li><a href="#tab-safari" role="tab" data-toggle="tab">Safari</a>
			</li>
			<li><a href="#tab-opera" role="tab" data-toggle="tab">Opera</a>
			</li>
			<li><a href="#tab-ie" role="tab" data-toggle="tab">IE</a>
			</li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane active" id="tab-chrome">
				<div class="row feature">
					<div class="col-md-7">

						<h2 class="feature-heading">
							Google Chrome <span class="text-muted">使用最广的浏览器</span>
						</h2>

						<p class="lead">Google
							Chrome，又称Google浏览器，是一个由Google（谷歌）公司开发的网页浏览器。
							该浏览器是基于其他开源软件所撰写，包括WebKit，目标是提升稳定性、速度和安全性，并创造出简单且有效率的使用者界面。</p>
					</div>
					<div class="col-md-5">
						<img class="feature-image img-responsive"
							src="images/chrome-logo.jpg" alt="Chrome">
					</div>
				</div>
			</div>
			<div class="tab-pane" id="tab-firefox">
				<div class="row feature">
					<div class="col-md-5">
						<img class="feature-image img-responsive"
							src="images/firefox-logo.jpg" alt="Firefox">
					</div>
					<div class="col-md-7">

						<h2 class="feature-heading">
							Mozilla Firefox <span class="text-muted">美丽的狐狸</span>
						</h2>

						<p class="lead">Mozilla
							Firefox，中文名通常称为“火狐”或“火狐浏览器”，是一个开源网页浏览器，
							使用Gecko引擎（非ie内核），支持多种操作系统如Windows、Mac和linux。</p>
					</div>
				</div>
			</div>
			<div class="tab-pane" id="tab-safari">
				<div class="row feature">
					<div class="col-md-7">

						<h2 class="feature-heading">
							Safari <span class="text-muted">Mac用户首选</span>
						</h2>

						<p class="lead">Safari，是苹果计算机的最新操作系统Mac OS
							X中的浏览器，使用了KDE的KHTML作为浏览器的运算核心。 Safari在2003年1月7日首度发行测试版，并成为Mac OS
							X v10.3与之后的默认浏览器，也是iPhone与IPAD和iPod touch的指定浏览器。</p>
					</div>
					<div class="col-md-5">
						<img class="feature-image img-responsive"
							src="images/safari-logo.jpg" alt="Safari">
					</div>
				</div>
			</div>
			<div class="tab-pane" id="tab-opera">
				<div class="row feature">
					<div class="col-md-5">
						<img class="feature-image img-responsive"
							src="images/opera-logo.jpg" alt="Opera">
					</div>
					<div class="col-md-7">

						<h2 class="feature-heading">
							Opera <span class="text-muted">小众但易用</span>
						</h2>

						<p class="lead">Opera浏览器，是一款挪威Opera Software
							ASA公司制作的支持多页面标签式浏览的网络浏览器。
							是跨平台浏览器可以在Windows、Mac和Linux三个操作系统平台上运行。.</p>
					</div>
				</div>
			</div>
			<div class="tab-pane" id="tab-ie">
				<div class="row feature">
					<div class="col-md-7">

						<h2 class="feature-heading">
							IE <span class="text-muted">你懂的</span>
						</h2>

						<p class="lead">Internet Explorer，原称Microsoft Internet
							Explorer(6版本以前)和Windows Internet Explorer(7，8，9，10版本)，
							简称IE，是美国微软公司推出的一款网页浏览器。它采用的排版引擎(俗称内核)为Trident。</p>
					</div>
					<div class="col-md-5">
						<img class="feature-image img-responsive" src="images/ie-logo.jpg"
							alt="IE">
					</div>
				</div>
			</div>
		</div>

		<!--  <!-- 关于 -->
		<div class="modal fade" id="about-modal" tabindex="-1" role="dialog"
			aria-labelledby="modal-label" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
						</button>
						<h4 class="modal-title" id="modal-label">关于</h4>
					</div>
					<div class="modal-body">
						<p>fsddfsfsdf</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">了解了</button>
					</div>
				</div>
			</div>
		</div>
		-->

		<footer>
		<p class="pull-right">
			<a href="#top">回到顶部</a>
		</p>
		</footer>

	</div>
</body>
</html>
