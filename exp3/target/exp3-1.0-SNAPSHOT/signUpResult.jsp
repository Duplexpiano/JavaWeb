<%@ page import="com.Factory.DAOFactory" %><%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/4/22
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册结果</title>
</head>
<body>
<jsp:useBean id="user" class="com.vo.User"/>
<%
    request.setCharacterEncoding("utf-8");
    user.setUserId(request.getParameter("userId"));
    user.setUserName(request.getParameter("userName"));
    user.setUserPassword(request.getParameter("userPassword"));
//    System.out.println(user.toString());
    if(DAOFactory.getIUserDAOInstance().doCreate(user) == true){
%>
<h2>注册成功</h2>
<%
}else{
%>
<h2>注册失败</h2>
<%
    }
%>
<a href="login.html">返回登录页面</a>
</body>
</html>
