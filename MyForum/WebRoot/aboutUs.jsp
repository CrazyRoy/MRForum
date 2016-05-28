<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'aboutUs.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script src="js/jquery-1.11.1.js"></script>
	<script src="js/bootstrap.min.js"></script>
		<style type="text/css">
#fieldset {
	margin: 100px 120px;
}
#left{
	width:50%;
	float:left;
}
#right{
	width:50%;
	float:right;
}
</style>
  </head>
  
  <body>
  <fieldset id="fieldset">
  <legend align = "left"><font face = "楷体" size = "5" color="grey"><b>关于我们</b></font></legend>
  <div>
  <div id="left">
  <h3>&nbsp;&nbsp;<font color="#224E73">重庆理工大学是Browser论坛的运行公司，具体地址：</font></h3>
  <p>&nbsp;&nbsp;&nbsp;<img src="images/map.png" width="534" height="310">
  <br>
  <br>
  <br>
  <h3 style="margin-left:40px"><font color="#224e73">客户服务:</font></h3>
  <p style="margin-left:40px"><font color="#224e73">客服热线：123 456 7890（免长途费），周一至周日8:00-22:00</font></p>
  <p style="margin-left:40px"><font color="#224e73">在线客服：点击在线客服按钮与客服进行即时在线沟通</font></p>
  <p style="margin-left:40px"><font color="#224e73">客服邮箱：kefu@Broswer.com</font></p>
  <br>
  <h3 style="margin-left:40px"><font color="#224e73">媒体采访:</font></h3>
  <p style="margin-left:40px"><font color="#224e73">媒体采访邮箱：PR@Browser.com</font></p>
  <br>
  <h3 style="margin-left:40px"><font color="#224e73">市场合作:</font></h3>
  <p style="margin-left:40px"><font color="#224e73">网络推广合作邮箱：MKT@Browser.com</font></p>
  <br>
  <h3 style="margin-left:40px"><font color="#224e73">战略发展:</font></h3>
  <p style="margin-left:40px"><font color="#224e73">金融产品合作邮箱：BD@Browser.com</font></p>
 
  </div>
  
  <div id="right">
  <h3 style="margin-left:70px"><font color="#224e73">公司总部:</font></h3>
  <p style="margin-left:70px"><font color="#224e73">地址：重庆市巴南区红光大道重庆理工大学69号</font></p>
  <p style="margin-left:70px"><font color="#224e73">电话：18875021824&nbsp;&nbsp;&nbsp;15683215147</font></p>
  <p style="margin-left:70px"><font color="#224e73">邮箱：123456789@163.com</font></p>
  <br>
  <h3 style="margin-left:70px"><font color="#224e73">其他联系方式:</font></h3>
  <p style="margin-left:70px"><font color="#224e73">登录Browser论坛官网（http://www.Browser.com),有Browser团队在线为您提供帮助；</font></p>
  <p style="margin-left:70px"><font color="#224e73">关注Browser论坛新浪微博（http://e.weibo.com/Broswer),与我们互动提出宝贵意见；</font></p>
  <p style="margin-left:70px"><font color="#224e73">关注Broswer论坛微信（微信号：Broswer),了解更多理财咨询。</font></p>
  <br><br><br><br>
  <div style="margin-left:70px;margin-right:100px;background-color:#F1F5F7">
  <br>
  <p style="margin-left:40px"><font color="#224e73">客服热线</font></p>
  <p style="margin-left:40px"><font color="#224e73" size="+3"><b>123 456 7890</b></font></p>
  <p style="margin-left:40px"><font color="#224e73">客服邮箱：<b>kefu@Broswer.com</b></font></p>
  <P style="margin-left:40px"><font color="#224e73">在线客服</font>&nbsp;<img src="images/kefu.png" width="22" height="20"></P>
  <br>
  </div>
  <br><br>
  <P style="margin-left:80px"><img src="images/erweima.png" width="285" height="152"></P>
  </div>
  </div>
  </fieldset>
    </body>
</html>
