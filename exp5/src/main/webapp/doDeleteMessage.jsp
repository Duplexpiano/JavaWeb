<%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/5/19
  Time: 15:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删帖中</title>
</head>
<body>
<hr/><br/>
<%
    request.setCharacterEncoding("utf-8") ;
    response.setHeader("refresh","2;URL=message?status=selectAll") ;
    boolean b = ((Boolean)request.getAttribute("flag")).booleanValue() ;
    if(b){
%>
删除帖子成功，两秒后<a href="message?status=selectAll">返回</a>
<%
}else {
%>
删除帖子失败，两秒后<a href="message?status=selectAll">返回</a>
<%
    }
%>
</body>
</html>
