<%@ page import="exp4.factory.DAOFactory" %>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>修改成功</title>
</head>
<body>
<jsp:useBean id="stu" class="exp4.vo.Students"/>
<%
    request.setCharacterEncoding("UTF-8");
    stu.setStudentId(request.getParameter("stuId"));
    stu.setStudentName(request.getParameter("stuName"));
    stu.setStudentPwd(request.getParameter("stuPwd"));
    stu.setSex(request.getParameter("sex"));
    stu.setClassId(Integer.parseInt(request.getParameter("class")));
//    System.out.println(stu.toString());
    int i = DAOFactory.getIStudentDAOInstance().updateStudents(stu);
    if(i > 0){
%>
    <h2>修改成功!</h2>
<%
    }else{
%>
    <h2>修改失败！</h2>
<%
    }
%>
    <a href="showStudents.jsp">返回学生列表</a>
</body>
</html>