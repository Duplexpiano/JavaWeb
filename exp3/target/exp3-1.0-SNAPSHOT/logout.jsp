<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/4/16
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销页面</title>
</head>
<body>
<%
    session.invalidate();
%>
<h2><a href="welcome.jsp">welcome.jsp</a></h2>
</body>
</html>
