<%@ page import="exp4.factory.DAOFactory" %><%--
  Created by IntelliJ IDEA.
  User: 14220
  Date: 2021/4/22
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册结果</title>
</head>
<body>
<jsp:useBean id="stu" class="exp4.vo.Students"></jsp:useBean>
<%
    request.setCharacterEncoding("utf-8");
    stu.setStudentId(request.getParameter("stuId"));
    stu.setStudentName(request.getParameter("stuName"));
    stu.setStudentPwd(request.getParameter("stuPwd"));
    stu.setSex(request.getParameter("sex"));
    stu.setClassId(Integer.parseInt(request.getParameter("class")));
    boolean flag = false;
    flag = DAOFactory.getIStudentDAOInstance().doCreate(stu);
    if(flag){
%>
        <h2>添加成功！</h2>
<%
    }else{
%>
        <h2>添加失败！(提示:信息填写不完整)</h2>
<%
    }
%>
<a href="showStudents.jsp">返回学生信息列表</a>
</body>
</html>
