<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.wt.notification.*"%>
<%@page import="com.wt.notification.OperNotification"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="JS/jquery.min.js"></script>
<link rel="icon" href="img/logo.png" type="image/x-icon" />
<title>通知</title>
<link rel="stylesheet" href="CSS/paperStyle.css" />
</head>
<body class="body">
<script type="text/javascript">

	function getInfo() {
		$.get("getNotifi.jsp?nocache="+new Date().getTime(),function(data){$("#info").html(data)});
	}

	$(function () {
	getInfo();
	window.setInterval("getInfo()", 60000);
	});
</script>
<%
	List<Notification> list = (List<Notification>) OperNotification.selectNotifi();
	Notification notifi = (Notification) request.getAttribute("noti");
	String time = (String) request.getAttribute("showtime");
%>
<div class="main">
     <div class="left">
     <ul id="info"></ul>
	 </div>
	 
	 
 	 <div class="right">
		<center>
		<% if(notifi!=null)
		{
		%>
 			<h3>${ noti.title}</h3><br>
			 <%=notifi.getContent().replaceAll("\n", "<br>").replaceAll(" ", "&nbsp;") %><br><br>
			<span style="color:#999999;">发布时间 <%= time%></span>
			<%} %>
		</center>
	</div> 
</div>
</body>
</html>