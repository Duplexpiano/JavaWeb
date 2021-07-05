<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/5/18
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新帖处理页</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    response.setHeader("refresh", "2;URL:message?status=selectAll");
    boolean b = ((Boolean) request.getAttribute("flag")).booleanValue();
    if(b){
%>
<h3>发帖成功，两秒后返回</h3>
<h3>若没有跳转，请点击<a href="message?status=selectAll">这里</a></h3>
<%
    }else{
%>
<h3>发帖失败，两秒后返回</h3>
<h3>若没有跳转，请点击<a href="message?status=selectAll">这里</a></h3>
<%
    }
%>
</body>
</html>
