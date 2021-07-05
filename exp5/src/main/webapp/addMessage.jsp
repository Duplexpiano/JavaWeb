<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/5/18
  Time: 10:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>编辑页</title>
</head>
<body>
<h3>编辑留言</h3>
<form action="message" method="post">
    <table width="50%" border="1px">
        <tr><td colspan="2">添加新留言</td></tr>
        <tr><td>标题</td><td><input type="text" name="title"/></td></tr>
        <tr>
            <td>作者</td>
            <td>
                <%=session.getAttribute("name")%>
                <input type="hidden" name="writer" value="<%=session.getAttribute("name")%>">
            </td>
        </tr>
        <tr><td>内容</td><td><textarea name="content" cols="30" rows="6"></textarea></td></tr>
        <tr>
            <td colspan="2">
                <input type="hidden" name="status" value="insert">
                <input type="submit" value="发布">
                <input type="reset" value="重置">
            </td>
        </tr>
    </table>
    <h3><a href="message?status=selectAll">返回留言板</a></h3>
</form>
</body>
</html>
