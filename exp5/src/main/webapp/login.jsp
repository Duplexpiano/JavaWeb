<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/5/7
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
</head>
<body>
<div align="center" style="margin: 15% 0px 0px">
    <h2>登录界面</h2>
    <form action="login" method="post">
        账号: <input type="text" name="id"><br/>
        密码: <input type="password" name="password"><br/><br/>
        <input type="submit" value="登录">
        <input type="reset" value="重置">
    </form>
    <%
        if(request.getAttribute("err") != null){
    %>
        <h2><%=request.getAttribute("err")%></h2>
    <%
        }
    %>
</div>
</body>
</html>
