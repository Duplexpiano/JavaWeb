<%@ page import="com.Factory.DAOFactory" %><%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/4/22
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
<form action="signUpResult.jsp" method="post">
    <table border="2" align="center">
        <caption>注册</caption>
        <tr><td>学号:<input type="text" name="userId" required placeholder="10位阿拉伯数字"></td></tr>
        <tr><td>姓名:<input type="text" name="userName" required></td></tr>
        <tr><td>密码:<input type="password" name="userPassword" required></td></tr>
        <tr align="center">
            <td>
                <input type="submit" name="submit" value="注册">
                <input type="reset" name="reset" value="重置">
            </td>
        </tr>
    </table>
</form>
</body>
</html>
