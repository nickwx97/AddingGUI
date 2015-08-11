<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="dbAccess.UserDetails" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Main</title>
	
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
<body id="home"  style="background-image:url('img/intro/intro5.jpg'); margin:0;">


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
<body>

<%
//get the session
// 	try{
		UserDetails ud = (UserDetails)session.getAttribute("userdetails");
		
		//check is session exist, if not go back to admin
		if(ud==null || !ud.getUsertype().equals("User")){
			response.sendRedirect("login.jsp?msg=Please Login");
			return;
		}
		String userid = ud.getUserid();
		%>
<h1 Style="text-align:center; color:white;">Welcome <%=userid %>!</h1>
<h3 Style="text-align:center; color:white;">What would you like to do today?</h3>

	<div id="adminNav" style="margin:auto; width:100%; text-align:center;">
		<a href="memberProfile.jsp"><button class="btn  btn-lg mybutton_cyano wow fadeIn" data-wow-delay="0.8s" style="margin-top:10%; margin-right:2%;">Update Profile</button></a>
	</div>
	
	<a href="memberProfile.jsp" style="color:white">Link to update profile page</a><br />
	<p style="color:white">this page will have promo of the month<br />
	also have birthday message<br />
	also if birthday got a link to redeem coupon code</p>


<!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>
	<script src="js/owl.carousel.js"></script>
	<script src="js/script.js"></script>
	<!-- StikyMenu -->
	<script src="js/stickUp.min.js"></script>
	<script type="text/javascript">
	  jQuery(function($) {
		$(document).ready( function() {
		  $('.navbar-default').stickUp();
		  
		});
	  });
	
	</script>
	<!-- Smoothscroll -->
	<script type="text/javascript" src="js/jquery.corner.js"></script> 
	<script src="js/wow.min.js"></script>
	<script>
	 new WOW().init();
	</script>
	<script src="js/classie.js"></script>
	<script src="js/uiMorphingButton_inflow.js"></script>
	<!-- Magnific Popup core JS file -->
	<script src="js/jquery.magnific-popup.js"></script>

</body>
</html>