<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="student.s_user,student.s_UserDao,java.util.*" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h1>Student Details</h1>
<%
List<s_user> list=s_UserDao.getAllRecords();
request.setAttribute("list",list);
%>
<table border="1" width="90%">
<tr><th>Name</th><th>Password</th><th>Conform Password</th><th>Email</th><th>Edit</th><th>Delete</th></tr>
<c:forEach items="${list}" var="u">
<tr>
<td>${u.getSname() }</td>
<td>${u.getSpassword() }</td>
<td>${u.getScpassword() }</td>
<td>${u.getSmail() }</td>

</tr>
</c:forEach>
</table>
<a href="addstudent.jsp">Add users</a>
</body>
</html>