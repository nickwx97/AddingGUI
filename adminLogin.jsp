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
	var useridBox = document.getElementById("userid");
	var useridValue = useridBox.value;
	var useridRegex = /^[0-9a-zA-Z]{4,45}$/i;;
	
	
	var passwordBox = document.getElementById("password");
	var passwordValue = passwordBox.value;
	var alphanumericNoSymbol = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,20}$/i;
	
	
	//if it's proper userid
	if(!useridValue.match(useridRegex)){
		errorMsg+="Please enter a valid username<br />";
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
	document.getElementById("msgBox").innerHTML = "";
	document.getElementById("wrong").innerHTML = "";
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

//get userid if login fail
String userid = "";
if(request.getParameter("userid")!=null || request.getParameter("userid")!=""){
	userid = request.getParameter("userid");
}

%>
<div id="msgBox">
<!-- this section is called the inner html and i am going to inject content into here using javascript -->
</div>

<form action="LoginServlet" method="post">
Login ID: <input type="text" name="userid" value="
<%
if(request.getParameter("userid")==null || request.getParameter("userid")==""){
	out.print("");
}else{
	out.print(request.getParameter("userid"));
}
%>" id="userid"/>
<br/>
Password: <input type="text" name="password" id="password"/>
<br/>
<input type="submit" value="Login" onclick=" return checkLogin()"/>
<input type="reset" name="Reset" onclick="cleanPage()"/>
</form>


</body>
</html>