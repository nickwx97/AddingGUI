<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*"%>
        <%@page import="java.text.SimpleDateFormat,connection.CreateConnection"%>
    <%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	int ID = Integer.parseInt(request.getParameter("ID"));
	String name = request.getParameter("name");
	String comment = request.getParameter("comment");
	float rating = Integer.parseInt(request.getParameter("rating"));
	
	java.util.Date now = new java.util.Date();
	SimpleDateFormat format = new SimpleDateFormat("yyyy.M.dd");
	String date=format.format(now);
	
	String product= request.getParameter("product");

	CreateConnection connection = new CreateConnection();
	Connection conn = connection.getConnDB();
	
	CallableStatement cs = conn.prepareCall("call insertComment(?,?,?,?,?)");
	cs.setInt(1, ID);
	cs.setString(2, name);
	cs.setFloat(3, rating);
	cs.setString(4,comment);
	cs.setString(5, date);
	
	int x = cs.executeUpdate();
	
	response.sendRedirect("productDetails.jsp?ID="+ID+"#comment");


	%>
</body>
</html>