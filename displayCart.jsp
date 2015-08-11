<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="Cart.ShoppingCart"%>
    <%@ page import="Cart.CartProduct,Cart.transaction,dbAccess.UserDetails"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="SP IT!">
    <meta name="author" content="">

    <title>SP IT!</title>
    
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
    border: 1px solid #31bc86;
}
td, th {
    padding: 0.75em 1.5em;
    text-align: left;
	border: 1px solid #31bc86;
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
    border: 1px solid #31bc86;
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

<body id="home"  style="background-image:url('img/intro/intro5.jpg'); margin:0;">

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
	</div>
</div>
<div id="desc"  style="background-color:#F8F8F8; margin-bottom: -1em; text-align:center;">
<%
ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");

if(cart == null || cart.cartSize() ==0){
	out.print("Nothing Here~");
}else{
out.print("<table>");
out.print("<tr><th>Product ID</th><th>Category</th><th>Product Name</th><th>Model</th><th>Brand</th><th>Price</th><th>Quantity</th><th> </th><th> </th></tr>");
for(int i = 0; i < cart.cartSize(); i++){
	out.print("<tr>");
	if(cart.getCartItems(i).getQty() > 0){
		out.print("<td>" + cart.getCartItems(i).getProductID()+"</td>");
		out.print("<td>" +cart.getCartItems(i).getCategory()+"</td>");
		out.print("<td>" +cart.getCartItems(i).getProductName()+"</td>");
		out.print("<td>" +cart.getCartItems(i).getModel()+"</td>" );
		out.print("<td>" +cart.getCartItems(i).getBrand()+"</td>");
		out.print("<td>" +cart.getCartItems(i).getPrice()+"</td>");
		out.print("<td>" +cart.getCartItems(i).getQty()+"</td>");
		out.print("<td><form action='UpdateCart' method='POST'><input type='text' value='"+ i +"' name='cartNo' hidden><input type='text' name='changeQty' placeholder='Quantity'><input type='submit' value='Update'></form></td>");
		out.print("<td><form action='DeleteCart' method='POST'><input type='text' value='"+ i +"' name='cartNo' hidden><input type='submit' value='Delete'></form></td>");
	}else{
		cart.removeFromCart(i);
	}
	out.print("</tr>");
}
out.print("</table>");

	if(session.getAttribute("userdetails")!=null){
		if(((UserDetails)session.getAttribute("userdetails")).getUsertype().equals("User")){
			out.print("<button onclick=\"window.location.href='checkOut.jsp';\">Click here to check out.</button>");
		}
	}else{
		out.print("<button onclick=\"window.location.href='login.jsp';\">Click here to login.</button>");
	}
}
%>
</div>
</body>
</html>