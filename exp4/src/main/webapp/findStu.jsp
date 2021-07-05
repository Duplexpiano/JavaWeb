<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="exp4.vo.Students" %>
<%@ page import="exp4.factory.DAOFactory" %><%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/4/22
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>索引学生</title>
</head>
<body>
<table border="2" align="center" align="70">
    <caption>查询结果</caption>
    <tr><th>学号</th><th>姓名</th><th>密码</th><th>性别</th><th>班级号</th><th>班级名</th></tr>
    <%
        request.setCharacterEncoding("utf-8");
        List<Students> allResult = new ArrayList<>();
        allResult = DAOFactory.getIStudentDAOInstance().findAll(request.getParameter("keyWord"));
        if(allResult.size() != 0){
            for (Students s: allResult) {
    %>
    <tr>
        <td><%=s.getStudentId()%></td>
        <td><%=s.getStudentName()%></td>
        <td><%=s.getStudentPwd()%></td>
        <td><%=s.getSex()%></td>
        <td><%=s.getClassId()%></td>
        <td><%=s.getClassName()%></td>
    </tr>
    <%
            }
        }else{
    %>
    <h2>找不到与<%=request.getParameter("keyWord")%>相关的内容</h2>
    <%
        }
    %>
    <a href="showStudents.jsp">返回学生信息列表</a>
</table>
</body>
</html>
