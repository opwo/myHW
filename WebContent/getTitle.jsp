<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.wt.notification.*"%>
<%@page import="com.wt.notification.OperNotification"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="JS/jquery.min.js"></script>
<script type="text/javascript">
function getInfo() {
	$.get("getNotifi.jsp?nocache="+new Date().getTime(),function(data){$("#info").html(data)});
}

$(function () {
getInfo();
window.setInterval("getInfo()", 60000);
});
</script>
</head>
<body>
<marquee direction="up" scrollamount="3" onmouseover="this.stop()" onmouseout="this.start()" bgcolor="yellow">
<ul id="info">

</ul>
</marquee>


</body>
</html>