<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/5/19
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>帖子详情</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
%>
<div align="center" style="margin: 20px 0px 0px 0px">
    <h2 style="color: salmon">详情</h2>
</div>
<div align="left" style="margin: 20px 0px 0px 20px">
    <h3><a href="message?status=selectAll">回到帖子列表页</a></h3>
</div>
<hr>
<div align="left" style="margin: 20px 0px 0px 20px">
    <form action="service" method="post">
        <table width="auto" border="1px" style="font-size: 20px">
            <tr><td colspan="2" align="center">留言详情</td></tr>
            <tr><td>帖子ID: </td>
                <td>
                    ${message.messageId}
                    <input type="hidden" name="messageId" value="${message.messageId}">
                </td>
            </tr>
                <td>标题: </td><td>
                ${message.title}
                <input type="hidden" name="title" value="${message.title}"></td>
            </tr>
            <tr>
                <td>作者: </td>
                <td>
                    ${message.writer}
                    <!-- 通过'c:set'标签设置帖子发布者、已回复者的姓名-->
                    <c:set var="writer" value="${message.writer}" scope="session"></c:set>
                    <c:set var="name" value="${sessionScope.name}" scope="session"></c:set>
                </td>
            </tr>
            <tr>
                <td>内容: </td>
                <td>
                    <textarea name="content" cols="30" rows="6" readonly style="font-size: 18px; color: black">${message.content}</textarea>
                </td>
            </tr>
            <tr>
                <td>时间: </td>
                <td>${message.writeDate}</td>
            </tr>
        </table>
    </form>
    <hr/>
    <h3>回帖</h3>
    <form action="service" method="post">
        <table width="auto" border="1">
            <tr><td>回帖ID</td><td>帖子ID</td><td>回复内容</td><td>回复者</td><td>回复时间</td><td></td></tr>
           <c:forEach items="${allRevert}" var="revert">
               <tr>
                   <td>${revert.revertId}</td>
                   <td>${revert.messageId}</td>
                   <td>${revert.content}</td>
                   <td>
                       ${revert.writer}
                           <!-- 通过'c:set'标签设置当前用户的姓名-->
                       <c:set var="replier" value="${revert.writer}" scope="session"></c:set>
                   </td>
                   <td>${revert.writeDate}</td>
                   <%
                       String writer = (String) session.getAttribute("writer");
                       String name = (String) session.getAttribute("name");
                       String replier = (String) session.getAttribute("replier");
//                       System.out.println(writer+"\n"+name+"\n"+replier);//测试
                       //TODO:当前用户是帖子发布者，则有权利可以删除所有人的回复
                       if(writer.equals(name)){
                   %>
                   <td><a href="revert?id=${revert.revertId}&mID=${message.messageId}&status=delete">删除</a></td>
                   <%
                       //TODO:当前用户可以删除自己的回复，但不能删除别人的
                       }else if(replier.equals(name)){
                   %>
                   <td><a href="revert?id=${revert.revertId}&mID=${message.messageId}&status=delete">删除</a></td>
                   <%
                       }else{
                   %>
                   <td></td>
                   <%
                       }
                   %>
               </tr>
           </c:forEach>
        </table>
    </form>
    <form action="revert" method="post">
        <input type="hidden" name="messageID" value="${message.messageId}">
        <input type="hidden" name="writer" value="${sessionScope.name}">
        <table width="auto" border="1">
            <tr>
                <td>回复</td>
                <td>
                    <textarea name="content" rows="6" cols="30"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="hidden" name="status" value="insert">
                    <input type="submit" value="回复">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
