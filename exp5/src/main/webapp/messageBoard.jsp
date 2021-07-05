<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/5/18
  Time: 10:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言板</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>
<div align="center" style="color: blueviolet">
    <h2>留言板</h2>
</div>
<div align="right" style="margin: 20px 20px 0px 0px; color: dimgray">
    <a href="logout.jsp">注销</a>
</div>
<hr>
<div align="center">
    <form action="message" method="post">
        <table width="80%" border="1">
            <caption align="center" style="color: salmon;">帖子管理页</caption>
            <tr><td>帖子ID</td><td>标题</td><td>内容</td><td>作者</td><td>时间</td><td><a href="addMessage.jsp">发新帖</a></td></tr>
            <tr>
            <c:forEach items="${all}" var="message">
            <tr>
                <td>${message.messageId}</td>
                <td><a href="service?id=${message.messageId}&status=selectById">${message.title}</a></td>
                <td>${message.content}</td>
                <td>
                    ${message.writer}
                    <c:set var="writer" value="${message.writer}" scope="session"></c:set>
                    <c:set var="name" value="${sessionScope.name}" scope="session"></c:set>
<%--                    <input type="hidden" name="writer" value="${message.writer}">--%>
<%--                    <input type="hidden" name="name" value="${sessionScope.name}">--%>
                </td>
                <td>${message.writeDate}</td>
            <%
                String writer = (String) session.getAttribute("writer");
                String name = (String) session.getAttribute("name");
//                System.out.println(writer + "\n" + name);
                if(writer.equals(name)){
            %>
                <td><a href="service?id=${message.messageId}&status=delete">删除</a></td>
            <%
                }else{
            %>
                <td></td>
            <%
                }
            %>
            </tr>
            </c:forEach>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
