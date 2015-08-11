<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<script>

function checkLogin() {
	//message for printing
	var errorMsg ="";
	
	//set boolean for a check if proceed with next page or not
	var stayOnPage = false;
	
	//retrieve values
	var emailBox = document.getElementById("email");
	var emailValue = emailBox.value;
	var emailRegex = /[a-z0-9!#$%&'*+/=?^_`{|}~.-]+@[a-z0-9-]+\.([a-z0-9-]+)+(\.[a-z0-9-]+)*/i;
	
	
	var passwordBox = document.getElementById("password");
	var passwordValue = passwordBox.value;
	var alphanumericNoSymbol = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,20}$/i;
	
	
	//if it's proper email
	if(!emailValue.match(emailRegex)){
		errorMsg+="Please enter a valid email address<br />";
		stayOnPage = true;
	}
	
	
	//check if password is 6charcters long, 20characters max, alphanumric
	if(!passwordValue.match(alphanumericNoSymbol)){
		errorMsg+="Please enter your password<br />Password needs to be Alphanumeric with no special characters and at least 6 characters long.<br />";
		stayOnPage = true;
	}
	
	//push error message to div msgBox
	//first get the div
	var msgDiv = document.getElementById("msgBox");
	//push it in
	msgDiv.innerHTML=errorMsg;
	
	//check if i should proceed to next page 
	if(stayOnPage){
		return false;
	}else{
		return true;
	}
	
}

</script>

<script>
//used to clean the page when fail servlet check.
function cleanPage(){
	document.getElementById("wrong").innerHTML = "";
	document.getElementById("msgBox").innerHTML = "";
}
</script>

<body>

<%
//print error msg here
String msg = request.getParameter("msg");
if(msg!=null){
	%>
	<div id="wrong"><%=msg %></div>
	<%
}

//check for logout
if(request.getParameter("logout")!=null){
	if(request.getParameter("logout").equals("yes")){
		session.invalidate();
	}
}

//get email if login fail
String email = "";
if(request.getParameter("email")!=null || request.getParameter("email")!=""){
	email = request.getParameter("email");
}

%>
<div id="msgBox">
<!-- this section is called the inner html and i am going to inject content into here using javascript -->
</div>

<form action="MemberLoginServlet" method="post">
Email: <input type="text" name="email" value="
<%
if(request.getParameter("email")==null || request.getParameter("email")==""){
	out.print("");
}else{
	out.print(request.getParameter("email"));
}
%>" id="email" />
<br/>
Password: <input type="text" name="password" id="password"/>
<br/>
<input type="submit" value="Login" onclick=" return checkLogin()"/>
<input type="reset" name="Reset" onclick="cleanPage()"/>
</form>


</body>
</html>