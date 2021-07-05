<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/5/7
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销</title>
</head>
<body>
<%
    session.invalidate();
    response.setHeader("refresh","2;URL=login.jsp") ;
%>
<h2>2秒后跳转到登陆页面...</h2>
</body>
</html>
