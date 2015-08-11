<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="connection.CreateConnection"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="SP IT!">
    <meta name="author" content="">
    <title>SP IT!</title>
    

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
	
	<style>
	.cats:hover{
		color:#1abc9c;
	}
	</style>
	
</head>

<body id="home"  style="background-image:url('img/intro/intro5.jpg'); margin:0;">
		<%		
	CreateConnection connection = new CreateConnection();
	Connection conn = connection.getConnDB(); 
	
	String query="call displayAllFrom(?)";
	CallableStatement cs = conn.prepareCall(query);
	cs.setString(1, "productcat");
	ResultSet rs = cs.executeQuery();
	%>
	<div class="navbar-default" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html#home">SP IT!</a>
			</div>

			<div class="collapse navbar-collapse navbar-right navbar-ex1-collapse">
				<ul class="nav navbar-nav">
					
					<li class="menuItem"><a href="index.html#main">Main</a></li>
					<li class="menuItem"><a href="products.jsp">Products</a></li>
					<li class="menuItem"><a href="index.html#credits">Credits</a></li>
					<li class="menuItem"><a href="login.jsp">Login</a></li>
				</ul>
			</div>
		   
		</div>
			<div id="desc"  style="background-color:#F8F8F8; margin-bottom: -1em; text-align:center;">
				<%if(request.getParameter("categoryName")==null || request.getParameter("categoryName").equals(""))
					out.println("<h3>All Products</h3><br /><p>Products of all kinds.</p>");
				else{
					while(rs.next()){
						if(request.getParameter("categoryName").equals(rs.getString("categoryName")))
							out.println("<h3>"+rs.getString("CategoryName")+"</h3><br /><p>"+rs.getString("CategoryDesc")+"</p>");
					}
				}
				
				
				%>
			</div>
	</div> 
	

	
	<%
	rs = cs.executeQuery();
	out.println("<ul class='nav navbar-nav' style='background-color:white; width:100%'><li class='menuItem'><a class='cats' href='?categoryName='>All Products</a></li>");
	while(rs.next()){
		out.println("<li class='menuItem'><a class='cats' href='?categoryName="+rs.getString("categoryName")+"'>"+rs.getString("CategoryName")+"</a></li>");
	}
	out.println("</ul>");
	

	if(request.getParameter("categoryName")==null || request.getParameter("categoryName").equals("")){
		String all="call displayAllFrom(?)";
	 	cs = conn.prepareCall(all);
	 	cs.setString(1, "product");
	 	rs = cs.executeQuery();
	}
	 
	 while(rs.next()){
			//declare variable that will be used within the while
			String imgPath = rs.getString("ImgPath");
			String prodName = rs.getString("ProductName");
			String model = rs.getString("Model");
			
			
			out.println("<div class='col-sm-6 pull-right wow fadeInRightBig animated animated' style='visibility: visible;'>");
			out.println("<a href='productDetails.jsp?product="+prodName+"'><img src='"+ imgPath +"' alt='"+ model +"' height='auto' width='90%' style='margin-top:20%;'></div></a>");	
			out.println("</div>");			
		}

	
	%>
	
	<%
	//using stored procedure
	String sql = "call returnProdFromThisCat(?)";
	cs = conn.prepareCall(sql);
	
	//setting the ?
	cs.setString(1, request.getParameter("categoryName"));
	
	//making a resultSet so that i can print out the things
	rs = cs.executeQuery();

	 while(rs.next()){
			//declare variable that will be used within the while
			String imgPath = rs.getString("ImgPath");
			String prodName = rs.getString("ProductName");
			String model = rs.getString("Model");
			
		
			out.println("<div class='col-sm-6 pull-left wow fadeInRightBig animated animated' style='visibility: visible; padding:0;'>");
			out.println("<a href='productDetails.jsp?product="+prodName+"'><img src='"+ imgPath +"' alt='"+ model +"' height='auto' width='90%' style='margin-top:20%;'></div></a>");	
			out.println("</div>");			
		}
	

	
	out.println("</div>");
	
	
	

	%>
	
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
