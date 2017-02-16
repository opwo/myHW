<%@page import="com.wt.tool.StringSplit"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
<title>Insert title here</title>
</head>
<body>
<%-- <%= out.print(new SimpleDateFormat("MM-dd HH:mm").format(noti.getDate())); %> --%>

<%
List<Notification> list = (List<Notification>) OperNotification.selectNotifi();
for(Notification noti:list){
	out.print("<li><a title='"+noti.getTitle()+"' href='LookNotifiServlet?Time="+noti.getDate().getTime()+"'>"+StringSplit.splitStr(noti.getTitle(), 6)+"</a><span>"+new SimpleDateFormat("yy/MM/dd").format(noti.getDate())+"</span></li><br>");
}
%>

</body>
</html>