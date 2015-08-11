<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="connection.CreateConnection" %>
<%@ page import="dbAccess.Product" %>
<%@ page import="dbAccess.ProductDB" %>
<%@ page import="dbAccess.UserDetails" %>
<%@ page import="etc.SpecificationInformation" %>
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
<!-- ============================End Nav Bar===================================== -->


<%
	try{
		//get the session
		UserDetails ud = (UserDetails)session.getAttribute("userdetails");
		
		//check is session exist, if not go back to admin
		if(ud==null){
			response.sendRedirect("adminLogin.jsp?msg=Please Login");
		}else if(!ud.getUsertype().equals("Administrator")){
			response.sendRedirect("adminLogin.jsp?msg=Please Login with a Staff account");
		}else{
			
		
		//get conection from java class
		CreateConnection connection = new CreateConnection();
		Connection conn = connection.getConnDB();
		
		//create a resultset for catergory drop down list
		String CatList = "Select * from productcat";
		Statement CatStmt = conn.prepareStatement(CatList);
		ResultSet CatListRS; //declare here, call when i need
		
%>

<!-- ===============================Add Product================================== -->
	<div class="intro-header2" id="addProduct">
		<h2>Add Product</h2>
	</div>
	<div style="background-color:white; padding-bottom:3%">
		<div class="form-style-2">
			<form action="InsertProductServlet" method="post">
				<label><span>Category: <span class="required">*</span></span></label>
				<label><select class="select-field" name="category">
				<%
				CatListRS = CatStmt.executeQuery(CatList);
				while(CatListRS.next()){
					out.println("<label><option value='"+CatListRS.getString("categoryName")+"'>"+CatListRS.getString("categoryName")+"</option></label>");
				}
				%>
				</select>
				</label>
				
				<label><span>Product Name: <span class="required">*</span></span><input type="text" class="input-field" name="productName" required/></label>
				<label><span>Model: <span class="required">*</span></span><input type="text" class="input-field" name="model" required/></label>
				<label><span>Brand: <span class="required">*</span></span><input type="text" class="input-field" name="brand" required/></label>
				<!-- the category is on top -->
				<label><span>Product Description: <span class="required">*</span></span><textarea class="textarea-field" name="productDesc" required></textarea></label>
				<label><span>Specification Field 1: <span class="required">*</span></span><textarea class="textarea-field" name="spec0" required></textarea></label>
				<label><span>Specification Field 2: <span class="required">*</span></span><textarea class="textarea-field" name="spec1" required></textarea></label>
				<label><span>Specification Field 3: </span><textarea class="textarea-field" name="spec2"></textarea></label>
				<label><span>Specification Field 4: </span><textarea class="textarea-field" name="spec3"></textarea></label>
				<label><span>Specification Field 5: </span><textarea class="textarea-field" name="spec4"></textarea></label>
				<label><span>Specification Field 6: </span><textarea class="textarea-field" name="spec5"></textarea></label>
				<label><span>Specification Field 7: </span><textarea class="textarea-field" name="spec6"></textarea></label>
				<label><span>Specification Field 8: </span><textarea class="textarea-field" name="spec7"></textarea></label>
				<label><span>Specification Field 9: </span><textarea class="textarea-field" name="spec8"></textarea></label>
				<label><span>Specification Field 10: </span><textarea class="textarea-field" name="spec9"></textarea></label>
				<label><span>Price: <span class="required">*</span></span><input type="text" class="input-field" name="price" required/></label>
				<label><span>Stock: <span class="required">*</span></span><input type="text" class="input-field" name="qty" required/></label>
				<label><span>Product Image Path: </span><input type="text" class="input-field" name="img"/></label>
				<!-- Submit button -->
				<label><span>&nbsp;</span><input type="submit" value="Submit" /></label>
				
			</form>
		</div>
	</div>
<!-- ===============================End Add Product================================== -->




<!-- ===============================Edit Product================================== -->
	<div class="intro-header2" id="editProduct">
		<h2>Edit Product</h2>
	</div>
	<div style="background-color:white; padding-bottom:3%;">
		<div class="form-style-2">
		
		
		
		<!-- =======================Drop Down Category Selection=========================== -->
			
			<form action="productConfig.jsp#editProduct" method="post">
				<label style="float:left;"><span style="margin-right:4em;">Category: </span></label>
				<label style="float:left;"><select class="select-field" name="whatProduct">
				<%
 				//generate CatListRs again is it as reach the end
				CatListRS = CatStmt.executeQuery(CatList);
				while(CatListRS.next()){
					if(CatListRS.getString("categoryName").equals(request.getParameter("whatProduct"))){
						out.println("<label><option selected='selected' value='"+CatListRS.getString("categoryName")+"'>"+CatListRS.getString("categoryName")+"</option></label>");
					}else{
						out.println("<label><option value='"+CatListRS.getString("categoryName")+"'>"+CatListRS.getString("categoryName")+"</option></label>");
					}
				}
				%>
				</select>
				</label>
				
				
				<!-- Submit button -->
				<label style="float:right;" ><input type="submit" value="Submit" /></label>
				
			</form>
			<div style="clear:both;"></div>
			
			
		<!-- =======================End Drop Down Category Selection=========================== -->
			
			
			
		<!-- ===================================Start Table=========================== -->
			<table style="width:90%; margin:auto;">
				<thead>
			<!-- ==================Start Table Header================== -->
					<tr>
				    	<th style="padding:1%; font-size: 150%;">Product Name</th>
				    	<th style="padding:1%; font-size: 150%;">Model</th>
				    	<th style="padding:1%; font-size: 150%;">Brand</th>
				    	<th style="padding:1%; font-size: 150%;">Description</th>
				    	<th style="padding:1%; font-size: 150%;">Specification</th>
				    	<th style="padding:1%; font-size: 150%;">Price</th>
				    	<th style="padding:1%; font-size: 150%;">Quantity</th>
				    	<th style="padding:1%; font-size: 150%;">Image Path</th>
				    	<th style="padding:1%; font-size: 150%;">Edit</th>
				    	<th style="padding:1%; font-size: 150%;">Delete</th>
					</tr>
				</thead>
			<!-- ==================Start Table Body================== -->
				<tbody>
					<tr>
					<%
					String categoryName = request.getParameter("whatProduct");
					//create a result set for product table
					String ProdList = "Select * from product where category = ?";
					PreparedStatement ProdPstmt = conn.prepareStatement(ProdList);
					ProdPstmt.setString(1, categoryName);
					ResultSet ProdListRS = ProdPstmt.executeQuery();
					
					while(ProdListRS.next()){
						String productID = ProdListRS.getString("productID");
						out.println("<td style='padding:1%'>"+ProdListRS.getString("productName")+"</td>");
						out.println("<td style='padding:1%'>"+ProdListRS.getString("model")+"</td>");
						out.println("<td style='padding:1%'>"+ProdListRS.getString("brand")+"</td>");
						out.println("<td style='padding:1%'>"+ProdListRS.getString("productDesc")+"</td>");						
						out.println("<td style='padding:1%'>"+ProdListRS.getString("spec")+"</td>");
						out.println("<td style='padding:1%'>"+ProdListRS.getDouble("price")+"</td>");
						out.println("<td style='padding:1%'>"+ProdListRS.getString("qty")+"</td>");
						out.println("<td style='padding:1%'>"+ProdListRS.getString("imgPath")+"</td>");
					%>
			<!-- ==================Edit button================== -->
						<td style="padding:0% 1% 0% 1%;">
							<form action="productConfig.jsp#updateForm" method="post">
								<input type="hidden" name="updateThisProd" value="<%= productID %>" />
								<input type="hidden" name="categoryName" value="<%= categoryName %>" />
								<input type="submit" value="Edit" />
							</form>
						</td>
			<!-- ==================Delete button================== -->
						<td style="padding:0% 1% 0% 1%;">
							<form action="DeleteProductServlet" method="post">
								<input type="hidden" name="deleteThisProd" value="<%= productID %>" />
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
			String updateThisProd = request.getParameter("updateThisProd");
			categoryName = request.getParameter("categoryName");
			if(updateThisProd!=null){
				//get info from database
				String sql = "select * from product where productID = ?";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, updateThisProd);
				ResultSet rs = pstmt.executeQuery();
				rs.next();//there should be only 1 row returned. hence can just run rs.next()
				
				String productName = rs.getString("productName");
				String model = rs.getString("model");
				String brand = rs.getString("brand");
				String productDesc = rs.getString("productDesc");	
				//create SpecificationInformation object pass string into it
				SpecificationInformation si =  new SpecificationInformation(rs.getString("spec"));
				Double price = rs.getDouble("price");
				String qty = rs.getString("qty");
				String imgPath = rs.getString("imgPath");
				
				%>
				<h2 id="updateForm" style="text-align:center;">Update product: <span style="color:#1abc9c"><%=productName %></span></h2>
				<form action="UpdateProductServlet" method="post">
					<label><span>Product Name: <span class="required">*</span></span><input type="text" class="input-field" name="productName" value="<%=productName %>" required/></label>
					<label><span>Model: <span class="required">*</span></span><input type="text" class="input-field" name="model" value="<%=model %>" required/></label>
					<label><span>Brand: <span class="required">*</span></span><input type="text" class="input-field" name="brand" value="<%=brand %>" required/></label>
					<label><span>Category: <span class="required">*</span></span></label>
					<label><select class="select-field" name="category">
					<%
	 				//generate CatListRs again is it as reach the end
					CatListRS = CatStmt.executeQuery(CatList);
					while(CatListRS.next()){
						if(CatListRS.getString("categoryName").equals(categoryName)){
							out.println("<label><option selected='selected' value='"+CatListRS.getString("categoryName")+"'>"+CatListRS.getString("categoryName")+"</option></label>");
						}else{
							out.println("<label><option value='"+CatListRS.getString("categoryName")+"'>"+CatListRS.getString("categoryName")+"</option></label>");
						}
					}
					%>
					</select>
					</label>
					<label><span>Product Description: <span class="required">*</span></span><textarea class="textarea-field" name="productDesc" required><%=productDesc %></textarea></label>
					<label><span>Specification Field 1: <span class="required">*</span></span><textarea class="textarea-field" name="spec0" required><%out.print(si.getSpec(si.getCount()));%></textarea></label>
					<label><span>Specification Field 2: <span class="required">*</span></span><textarea class="textarea-field" name="spec1" required><%out.print(si.getSpec(si.getCount()));%></textarea></label>
					<label><span>Specification Field 3: </span><textarea class="textarea-field" name="spec2"><%out.print(si.getSpec(si.getCount()));%></textarea></label>
					<label><span>Specification Field 4: </span><textarea class="textarea-field" name="spec3"><%out.print(si.getSpec(si.getCount()));%></textarea></label>
					<label><span>Specification Field 5: </span><textarea class="textarea-field" name="spec4"><%out.print(si.getSpec(si.getCount()));%></textarea></label>
					<label><span>Specification Field 6: </span><textarea class="textarea-field" name="spec5"><%out.print(si.getSpec(si.getCount()));%></textarea></label>
					<label><span>Specification Field 7: </span><textarea class="textarea-field" name="spec6"><%out.print(si.getSpec(si.getCount()));%></textarea></label>
					<label><span>Specification Field 8: </span><textarea class="textarea-field" name="spec7"><%out.print(si.getSpec(si.getCount()));%></textarea></label>
					<label><span>Specification Field 9: </span><textarea class="textarea-field" name="spec8"><%out.print(si.getSpec(si.getCount()));%></textarea></label>
					<label><span>Specification Field 10: </span><textarea class="textarea-field" name="spec9"><%out.print(si.getSpec(si.getCount()));%></textarea></label>
					<label><span>Price: <span class="required">*</span></span><input type="text" class="input-field" name="price" value="<%=price %>" required/></label>
					<label><span>Stock: <span class="required">*</span></span><input type="text" class="input-field" name="qty" value="<%=qty %>" required/></label>
					<label><span>Product Image Path: </span><input type="text" class="input-field" name="img" value="<%=imgPath %>"/></label>
					<input type="hidden" name="productID" value="<%=updateThisProd %>" />
					<!-- Submit button -->
					<label><span>&nbsp;</span><input type="submit" value="Submit" /></label>
				</form>
				<%
			}
			
			%>
	<!-- =========================++===End Form for update============================= -->
			
			
		</div>
	</div>
<!-- ===============================End Edit Product================================== -->

<%
	
		conn.close();
		}//end else
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