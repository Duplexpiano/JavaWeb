<%@ page import="exp4.DAO.Impl.StudentDAOImpl" %>
<%@ page import="exp4.factory.DAOFactory" %><%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/4/8
  Time: 11:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>delete</title>
</head>
<body>
    <%
        String studentId = request.getParameter("studentId");
        //System.out.println("**" + studentId);
        int i = DAOFactory.getIStudentDAOInstance().deleteStudents(studentId);
        if(i > 0){
    %>
        <h3>成功删除了学号为<%=studentId%>的学生!</h3>
    <%
        }else{
    %>
        <h3>删除失败</h3>
    <%
        }
    %>
    <a href="showStudents.jsp">返回学生信息</a>
</body>
</html>
