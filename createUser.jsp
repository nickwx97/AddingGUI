<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form action="CreateUserServlet" method="post">
Username: <input type="text" name="username"/><br />
Password: <input type="text" name="password"/><br />
Email Address: <input type="text" name="email"/><br />
First Name: <input type="text" name="firstname"/><br />
Last Name: <input type="text" name="lastname"/><br />

Date of Birth: <select name="day">
<%
for(int day=1;day<32;day++){
	out.println("<option value='"+day+"'>"+day+"</option>");
}
%>
</select>
<select name="month">
<%
String[] months = {"January","February","March","April","May","June","July","August","September","October","November","December"};
for(int i=0;i<12;i++){
	out.println("<option value='"+(i+1)+"'>"+months[i]+"</option>");
}

%>
</select>
<input type="text" name="year" placeholder="Year"/><br/>
Address: <input type="text" name="address"/><br />
Contact number: <input type="text" name="number"/><br />
<!-- need to change to select(drop down box) -->
Security Question: <select>
<%
for(int qNum=1;qNum<6;qNum++){
	out.println("<option value='"+qNum+"'>"+qNum+"</option>");
}
%>
</select><br />
<!-- <input type="text" name="secQ"/><br /> -->
Answer: <input type="text" name="secA"/><br />
<input type="submit" value="Submit"/>
</form>

</body>
</html>