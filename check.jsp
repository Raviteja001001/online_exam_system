<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="student.s_UserDao" %>
<%@ page import="java.util.*" %>

<%
    //int sid = Integer.parseInt(request.getParameter("sid"));
    String sname = request.getParameter("sname");
    String spassword = request.getParameter("spassword");

    boolean exists = s_UserDao.authenticateUser(sname, spassword);

    if (exists) {
        out.println("<h2>User Exists! Welcome, " + sname + ".</h2>" );
        
    } else {
        out.println("<h2>User Does Not Exist. Please check your credentials.</h2>");
    }
%>
<jsp:include page="student_profile.jsp"></jsp:include>
</body>
</html>