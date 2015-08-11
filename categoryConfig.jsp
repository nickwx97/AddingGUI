<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="connection.CreateConnection" %>
<%@ page import="dbAccess.Category" %>
<%@ page import="dbAccess.CategoryDB" %>
<%@ page import="dbAccess.UserDetails" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SP IT! - Category Configuration</title>

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
<body>
<%
	//get the session
	UserDetails ud = (UserDetails)session.getAttribute("userdetails");
	
	//check is session exist, if not go back to admin
	if(ud==null){
		response.sendRedirect("adminLogin.jsp?msg=Please Login");
		return;
	}else if(!ud.getUsertype().equals("Administrator")){
		response.sendRedirect("adminLogin.jsp?msg=Please Login with a Staff account");
		return;
	}
%>

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
					<li class="menuItem"><a href="adminLogin.jsp?logout=yes">Log Out</a></li>
				</ul>
			</div>
			
			<div style="clear:both;"></div>		<!--to push down the adminNav -->
			
			<div id="adminNav" style="margin:auto; width:100%; text-align:center;">
				<a href="productConfig.jsp#addProduct"><button class="btn  btn-lg mybutton_greenish" style="margin:2% 2% 2% 0%;">Add Product</button></a>
				<a href="productConfig.jsp#editProduct"><button class="btn  btn-lg mybutton_greenish" style="margin:2% 2% 2% 0%;">Edit Product</button></a>
				<a href="categoryConfig.jsp#addCategory"><button class="btn  btn-lg mybutton_greenish" style="margin:2% 2% 2% 0%;">Add Category</button></a>
				<a href="categoryConfig.jsp#editCategory"><button class="btn  btn-lg mybutton_greenish" style="margin:2% 2% 2% 0%;">Edit Category</button></a>
			</div>
			
		</div>
	</nav>


<%
	try{
		//get conection from java class
		CreateConnection connection = new CreateConnection();
		Connection conn = connection.getConnDB();
		
		//create a statement to prepare to run the query
//**************SHOULD I USE STATEMET HERE???
//because if prepreded statement i need to set still to what?
		String returnCatList = "select * from productcat";
		Statement stmt = conn.createStatement();
%>

<!-- ===============================Add Category================================== -->
	<div class="intro-header2" id="addCategory">
		<h2>Add Category</h2>
	</div>
	<div style="background-color:white; padding-bottom:3%">
		<div class="form-style-2">
			<form action="InsertCategoryServlet" method="post">
				<label><span>Category Name: <span class="required">*</span></span><input type="text" class="input-field" name="catName" required/></label>
				<label><span>Category Description: <span class="required">*</span></span><textarea class="textarea-field" name="catDesc" required></textarea></label>
				<!-- Submit button -->
				<label><span>&nbsp;</span><input type="submit" value="Submit" /></label>
				
			</form>
		</div>
	</div>
<!-- ===============================End Add Category================================== -->
	
	
	
	
<!-- ===============================Edit Category================================== -->
	<div class="intro-header2" id="editCategory">
		<h2>Edit Category</h2>
	</div>
	<div style="background-color:white; padding-bottom:3%">
		<div class="form-style-2">
			
	<!-- ===================================Start Table=========================== -->
			<table style="width:90%; margin:auto;">
				<thead>
			<!-- ==================Start Table Header================== -->
					<tr>
				    	<th style="padding:2%; font-size: 150%;">Category</th>
				    	<th style="padding:2%; font-size: 150%;">Description</th>
				    	<th style="padding:2%; font-size: 150%;">Edit</th>
				    	<th style="padding:2%; font-size: 150%;">Delete</th>
					</tr>
				</thead>
			<!-- ==================Start Table Body================== -->
				<tbody>
					<tr>
					<%
					//create category list result set
					ResultSet CatListRS = stmt.executeQuery(returnCatList);
					while(CatListRS.next()){
						String EditCatID = CatListRS.getString("categoryID");
						out.println("<td style='padding:2%'>"+CatListRS.getString("categoryName")+"</td><td style='padding:2%'>"+CatListRS.getString("CategoryDesc")+"</td>");
					%>
			<!-- ==================Edit button================== -->
						<td style="padding:0% 2% 0% 2%;">
							<form action="categoryConfig.jsp#updateForm" method="post">
								<input type="hidden" name="updateThisCat" value="<%= EditCatID %>" />
								<input type="submit" value="Edit" />
							</form>
						</td>
			<!-- ==================Delete button================== -->
						<td style="padding:0% 2% 0% 2%;">
							<form action="DeleteCategoryServlet" method="post">
								<input type="hidden" name="deleteThisCat" value="<%= EditCatID %>" />
								<input type="submit" value="Delete" />
							</form>
						</td>
					</tr>	
					<%
					}//cose the while loop
					%>
				</tbody>
			</table>
	<!-- ===================================End Table=========================== -->
	
	
	<!-- ===============================Form for update============================= -->
			<%
			String updateThisCat = request.getParameter("updateThisCat");
			
			if(updateThisCat!=null){
				//get info from database
				String sql = "select * from productcat where categoryID = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, updateThisCat);
				ResultSet rs = pstmt.executeQuery();
				rs.next();//there should be only 1 row returned. hence can just run rs.next()
				
				String catName = rs.getString("categoryName");
				String catDesc = rs.getString("categoryDesc");
				%>
				<h2 style="text-align:center;">Update <span style="color:#1abc9c"><%=catName %></span> category</h2>
				<form id="updateForm" action="UpdateCategoryServlet" method="post">
					<label><span>Category Name: <span class="required">*</span></span><input type="text" class="input-field" name="catName" value="<%=catName %>" required/></label>
					<label><span>Category Description: <span class="required">*</span></span><textarea class="textarea-field" name="catDesc" required><%=catDesc %></textarea></label>
					<input type="hidden" name="catID" value="<%= updateThisCat %>"/>
					<!-- Submit button -->
					<label><span>&nbsp;</span><input type="submit" value="Update" /></label>
				</form>
				<%
			}
			
			%>
	<!-- =========================++===End Form for update============================= -->
		</div>
	</div>
	
<!-- ===============================End Edit Category========================================= -->
<%
	
		conn.close();
	}catch(Exception e){
		out.println(e);
	}
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