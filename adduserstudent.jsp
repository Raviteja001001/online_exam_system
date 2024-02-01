<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="student.s_UserDao"%>  
<jsp:useBean id="u" class="student.s_user"></jsp:useBean>  
<jsp:setProperty property="*" name="u"/>  
  
<%  
int i=s_UserDao.save(u);  
if(i>0){  
response.sendRedirect("adduserstu-success.jsp");  
}else{  
response.sendRedirect("adduserstu-error.jsp");  
}  
%>  
</body>
</html>