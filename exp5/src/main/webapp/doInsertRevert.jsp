<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/5/19
  Time: 23:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>回帖中</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    boolean b = ((Boolean) request.getAttribute("flag")).booleanValue();
    if(b){
%>
<h3>回复成功,点击返回<a href="service?id=${messageID}&status=selectById">帖子详情页</a></h3>
<%
}else{
%>
<h3>回复失败,点击返回<a href="service?id=${messageID}&status=selectById">帖子详情页</a></h3>
<%
    }
%>
</body>
</html>
