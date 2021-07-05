<%@ page import="com.Factory.DAOFactory" %>
<%@ page import="com.vo.User" %><%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2021/4/15
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login check</title>
</head>
<body>
<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="user" class="com.vo.User"/>
<%
    String userId = request.getParameter("userId");
    String password = request.getParameter("userPassword");
    user = DAOFactory.getIUserDAOInstance().findByIdAndPassword(userId, password);//通过工厂类调用方法匹配信息
    if(user != null){
        session.setAttribute("username", user.getUserName());
        session.setAttribute("flag", "ok");//存在该用户信息,赋予flag一个值
%>
<jsp:forward page="welcome.jsp"/>
<%
    }else{
%>
    <jsp:forward page="login_fail.jsp"/>
<%
    }
%>
</body>
</html>