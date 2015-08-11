<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbAccess.UserDetails" %>
<%@ page import="java.sql.*" %>
<%@ page import="connection.CreateConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>SP IT! - Product Configuration</title>
	
	
	
<!-- ====================================Style for reactive=================================== -->
	<style>
		@media screen and (max-width: 900px) {
		  	.form-style-2{
			    min-width: 450px;
			}
		}
    </style>
	
	
	
<!-- ====================================Style for Form=================================== -->
	<style type="text/css">
	.form-style-2{
	    max-width: 90%;
	    margin:auto;
	    padding: 20px 12px 10px 20px;
	    font: 13px Arial, Helvetica, sans-serif;
	}
	.form-style-2-heading{
	    font-weight: bold;
	    font-style: italic;
	    border-bottom: 2px solid #ddd;
	    margin-bottom: 20px;
	    font-size: 15px;
	    padding-bottom: 3px;
	}
	.form-style-2 label{
	    display: block;
	    margin: 0px 0px 15px 0px;
	}
	.form-style-2 label > span{
	    width: 30%;
	    font-weight: bold;
	    float: left;
	    padding-top: 8px;
	    padding-right: 5px;
	}
	.form-style-2 span.required{
	    color:red;
	}
	
	.form-style-2 input.input-field{
	    width: 70%;
	    
	}
	
	.form-style-2 input.input-field, 
	.form-style-2 .tel-number-field, 
	.form-style-2 .textarea-field, 
	 .form-style-2 .select-field{
	    box-sizing: border-box;
	    -webkit-box-sizing: border-box;
	    -moz-box-sizing: border-box;
	    border: 1px solid #C2C2C2;
	    box-shadow: 1px 1px 4px #EBEBEB;
	    -moz-box-shadow: 1px 1px 4px #EBEBEB;
	    -webkit-box-shadow: 1px 1px 4px #EBEBEB;
	    border-radius: 3px;
	    -webkit-border-radius: 3px;
	    -moz-border-radius: 3px;
	    padding: 7px;
	    outline: none;
	}
	.form-style-2 .input-field:focus, 
	.form-style-2 .tel-number-field:focus, 
	.form-style-2 .textarea-field:focus,  
	.form-style-2 .select-field:focus{
	    border: 1px solid #0C0;
	}
	.form-style-2 .textarea-field{
	    height:100px;
	    width: 70%;
	}
	.form-style-2 input[type=submit],
	.form-style-2 input[type=button]{
	    border: none;
	    padding: 8px 15px 8px 15px;
	    background: #FF8500;
	    color: #fff;
	    box-shadow: 1px 1px 4px #DADADA;
	    -moz-box-shadow: 1px 1px 4px #DADADA;
	    -webkit-box-shadow: 1px 1px 4px #DADADA;
	    border-radius: 3px;
	    -webkit-border-radius: 3px;
	    -moz-border-radius: 3px;
	}
	.form-style-2 input[type=submit]:hover,
	.form-style-2 input[type=button]:hover{
	    background: #EA7B00;
	    color: #fff;
	}
	</style>



<!-- ============================================Style for table======================================= -->
	<style type="text/css">
		/* Component styles */
	/* @font-face { */
	/* 	font-family: 'Blokk'; */
	/* 	src: url('../fonts/blokk/BLOKKRegular.eot'); */
	/* 	src: url('../fonts/blokk/BLOKKRegular.eot?#iefix') format('embedded-opentype'), */
	/* 		 url('../fonts/blokk/BLOKKRegular.woff') format('woff'), */
	/* 		 url('../fonts/blokk/BLOKKRegular.svg#BLOKKRegular') format('svg'); */
	/* 	font-weight: normal; */
	/* 	font-style: normal; */
	/* } */
	.component {
		line-height: 1.5em;
		margin: 0 auto;
		padding: 2em 0 3em;
		width: 90%;
		max-width: 1000px;
		overflow: hidden;
	}
	.component .filler {
		font-family: "Blokk", Arial, sans-serif;
		color: #d3d3d3;
	}
	table {
	    border-collapse: collapse;
	    margin-bottom: 3em;
	    width: 100%;
	    background: #fff;
	}
	td, th {
	    padding: 0.75em 1.5em;
	    text-align: left;
	}
		td.err {
			background-color: #e992b9;
			color: #fff;
			font-size: 0.75em;
			text-align: center;
			line-height: 1;
		}
	th {
	    background-color: #31bc86;
	    font-weight: bold;
	    color: #fff;
	    white-space: nowrap;
	}
	tbody th {
		background-color: #2ea879;
	}
	tbody tr:nth-child(2n-1) {
	    background-color: #f5f5f5;
	    transition: all .125s ease-in-out;
	}
	tbody tr:hover {
	    background-color: rgba(129,208,177,.3);
	}
	
	/* For appearance */
	.sticky-wrap {
		overflow-x: auto;
		overflow-y: hidden;
		position: relative;
		margin: 3em 0;
		width: 100%;
	}
	.sticky-wrap .sticky-thead,
	.sticky-wrap .sticky-col,
	.sticky-wrap .sticky-intersect {
		opacity: 0;
		position: absolute;
		top: 0;
		left: 0;
		transition: all .125s ease-in-out;
		z-index: 50;
		width: auto; /* Prevent table from stretching to full size */
	}
		.sticky-wrap .sticky-thead {
			box-shadow: 0 0.25em 0.1em -0.1em rgba(0,0,0,.125);
			z-index: 100;
			width: 100%; /* Force stretch */
		}
		.sticky-wrap .sticky-intersect {
			opacity: 1;
			z-index: 150;
	
		}
			.sticky-wrap .sticky-intersect th {
				background-color: #666;
				color: #eee;
			}
	.sticky-wrap td,
	.sticky-wrap th {
		box-sizing: border-box;
	}
	
	/* Not needed for sticky header/column functionality */
	td.user-name {
		text-transform: capitalize;
	}
	.sticky-wrap.overflow-y {
		overflow-y: auto;
		max-height: 50vh;
	}
	</style>


<!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
 
    <!-- Custom Google Web Font -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Arvo:400,700' rel='stylesheet' type='text/css'>
	
    <!-- Custom CSS-->
    <link href="css/general.css" rel="stylesheet">
	
	 <!-- Owl-Carousel -->
    <link href="css/custom.css" rel="stylesheet">
	<link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	<link href="css/animate.css" rel="stylesheet">
	
	<!-- Magnific Popup core CSS file -->
	<link rel="stylesheet" href="css/magnific-popup.css"> 
	
	<script src="js/modernizr-2.6.2.min.js"></script>  <!-- Modernizr /-->


</head>

<script>
function checkLogin() {
	//message for printing
	var errorMsg ="";
	//set boolean for a check if proceed with next page or not
	var stayOnPage = false;
	
	//retrieve values
	var passwordBox = document.getElementById("oldPass");
	var passwordValue = passwordBox.value;
	var alphanumericNoSymbol = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,20}$/i;	
	
	//=============================check if password is 6charcters long, 20characters max, alphanumric===============================
	if(!passwordValue.match(alphanumericNoSymbol)){
		errorMsg+="Please enter your password<br />";
		stayOnPage = true;
	}
	
	//=============================check new password field as well=============================
	var newPassBox = document.getElementById("newPass");
	var newPassValue = newPassBox.value;
	var newPassCheckBox = document.getElementById("newPassCheck");
	var newPassCheckValue = newPassCheckBox.value;
	
	var newPassEmpty = true;
	if(newPassValue != ""){
		newPassEmpty = false;
		if(newPassCheckValue == ""){
			errorMsg+="Please don't leave new password field empty.<br />";
			stayOnPage = true;
		}else if(newPassValue != newPassCheckValue){
			errorMsg+="Passwords don't match.<br />";
			stayOnPage = true;
		}else if(!newPassValue.match(alphanumericNoSymbol)){
			errorMsg+="New password needs to be Alphanumeric with no special characters and at least 6 characters long.<br />";
			stayOnPage = true;
		}else if(newPassValue == passwordValue){ //old pass and new pass canot be the same.
			errorMsg+="New password cannot be the same as old password.<br />";
			stayOnPage = true;
		}
	}
	
	if(newPassCheckValue != "" && newPassEmpty){
			errorMsg+="Please don't leave field empty.<br />";
			stayOnPage = true;
	}
	
	
	//=============================check other fields=============================
	var usernameBox = document.getElementById("username");
	var firstNameBox = document.getElementById("firstname");
	var lastNameBox = document.getElementById("lastname");
	var dayBox = document.getElementById("day");
	var monthBox = document.getElementById("month");
	var yearBox = document.getElementById("year");
	var addressBox = document.getElementById("address");
	var numberBox = document.getElementById("number");
	var usernameValue = usernameBox.value;
	var firstNameValue = firstNameBox.value;
	var lastNameValue = lastNameBox.value;
	var dayValue = dayBox.value;
	var monthValue = monthBox.value;
	var yearValue = yearBox.value;
	var addressValue = addressBox.value;
	var numberValue = numberBox.value;
	
	//===========Regex==========
	//alphanumeric, cannot pure numeric, 6 to 45 characters
	var alphanumericRegex = /^[0-9a-zA-Z]{6,45}$/i;
	//day
	var dayRegex = /^([1-2][0-9]|[3][0-1]|[1-9])$/;
	//month
	var monthRegex = /^([1][0-2]|[1-9])$/;
	//year
	var yearRegex = /^[0-9]{4}$/;
	//number 
	var numberRegex = /^[0-9]{8}$/; 
	//white space
	var whiteRegex = /^\s+$/;
	
	if(usernameValue == "" || firstNameValue == "" || lastNameValue == "" || yearValue == "" || addressValue == "" || numberValue == "" || usernameValue.match(whiteRegex) || firstNameValue.match(whiteRegex) || lastNameValue.match(whiteRegex) || yearValue.match(whiteRegex) || addressValue.match(whiteRegex) || numberValue.match(whiteRegex)){
		errorMsg+="Please don't leave empty field(s).<br />";
		stayOnPage = true;
	}else if(!usernameValue.match(alphanumericRegex)){
		errorMsg+="Username needs to be 6 to 45 characters long without special charaters.<br />";
		stayOnPage = true;
	}else if(!dayValue.match(dayRegex) || !yearValue.match(yearRegex) || !monthValue.match(monthRegex)){
		errorMsg+="Please enter a proper date.<br />";
		stayOnPage = true;
	}else if(!numberValue.match(numberRegex)){
		errorMsg+="Please enter a proper Contact number.<br />";
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

<body>
<%
//get the session
UserDetails ud = (UserDetails)session.getAttribute("userdetails");

//check is session exist, if not go back to admin
if(ud==null || !ud.getUsertype().equals("User")){
	response.sendRedirect("login.jsp?msg=Please Login");
	return;
}


//get info from database
CreateConnection connection = new CreateConnection();
Connection conn = connection.getConnDB();

String sql = "select * from user where email = ?";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, ud.getEmail());
ResultSet rs = pstmt.executeQuery();
rs.next();//there should be only 1 row returned. hence can just run rs.next()

String username  = rs.getString("username");
String password = rs.getString("password");
String email = rs.getString("email");
String firstName = rs.getString("firstName");
String lastName = rs.getString("lastName");

//use substring to break
String dob = rs.getString("dob");
String year = dob.substring(0,4);
int month = Integer.parseInt(dob.substring(5,7));
int day = Integer.parseInt(dob.substring(8,10));

String address = rs.getString("address");
int number = rs.getInt("contactNum");


// String msg = request.getParameter("msg");
// if(msg!=null){
// 	out.println(msg);
// }

%>
<!-- ============================Nav Bar===================================== -->
	<nav class="navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html#home">Return to regular web site</a>
			</div>

			<div class="collapse navbar-collapse navbar-right navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					<li class="menuItem"><a href="login.jsp?logout=yes">Log Out</a></li>
				</ul>
			</div>
			
		</div>
	</nav> 
<!-- ============================End Nav Bar===================================== -->

<div class="intro-header2">
		<h2>Update member info page header (to be changed)</h2>
</div>
<div style="background-color:white; padding-bottom:3%">

<%

//print error msg here
String msg = request.getParameter("msg");
if(msg!=null){
	%>
	<div id="wrong"><h2><%=msg %><h2></h1></div>
	<%
}

%>
<div>
<!-- this section is called the inner html and i am going to inject content into here using javascript -->
	<h3 style="text-align:center" id="msgBox"></h3>
</div>

		<div class="form-style-2">
			<form action="UpdateUserServlet" method="post">
				<!-- email and password need to handle -->
				<label><span>Username: <span class="required">*</span></span><input type="text" class="input-field" name="username" value="<%= username%>" id="username"/></label>
				<label><span>Current password: <span class="required">*</span></span><input type="text" class="input-field" name="oldPass" id="oldPass"/></label>
				<label><span>New Password(leave blank if you don't wish to change): <span class="required">*</span></span><input type="text" class="input-field" name="newPass" id="newPass"/></label>
				<label><span>Enter New Password again: <span class="required">*</span></span><input type="text" class="input-field" name="newPassCheck" id="newPassCheck"/></label>
				<label><span>First Name: <span class="required">*</span></span><input type="text" class="input-field" name="firstname" value="<%= firstName%>" id="firstname"/></label>
				<label><span>Last Name: <span class="required">*</span></span><input type="text" class="input-field" name="lastname" value="<%= lastName%>" id="lastname"/></label>
				<label><span>Date of Birth: <span class="required">*</span></span></label>
				<label><select class="select-field" name="day" id="day">
				<%
				for(int days=1;days<32;days++){
					if(days==day){
						out.println("<label><option value='"+days+"' selected>"+days+"</option></label>");
					}else{
						out.println("<label><option value='"+days+"'>"+days+"</option></label>");
					}
				}
				%>
				</select>
				<label><select class="select-field" name="month" id="month">
				<%
				String[] months = {"January","February","March","April","May","June","July","August","September","October","November","December"};
				for(int i=0;i<12;i++){
					if(i==(month-1)){
						out.println("<label><option value='"+(i+1)+"' selected>"+months[i]+"</option></label>");
					}else{
						out.println("<label><option value='"+(i+1)+"'>"+months[i]+"</option></label>");
					}
				}
				%>
				</select>
				</label>
				<input type="text" class="input-field" name="year" value="<%=year %>" id="year"/></label>
				<label><span>Address: <span class="required">*</span></span><input type="text" class="input-field" name="address" value="<%= address%>" id="address"/></label>
				<label><span>Contact number: <span class="required">*</span></span><input type="text" class="input-field" name="number" value="<%= number%>" id="number"/></label>
				Please enter password for validation
				<input type="hidden" name="email" value="<%=email %>"/>
				<!-- Submit button -->
				<label><span>&nbsp;</span><input type="submit" value="Submit" onclick=" return checkLogin()"/></label>
				
			</form>
		</div>
	</div>

</body>
</html>