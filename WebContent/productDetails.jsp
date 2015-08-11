
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="java.sql.*"%>
	<%@page import="connection.CreateConnection,etc.SpecificationInformation"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="SP IT!">
    <meta name="author" content="">
    <title>SP IT!</title>
    
    <style>
    	@media screen and (max-width: 700px) {
		  	#loginform form{
		  		display:block;
		  		width: 5%;
		  		margin:0;
		  		margin-left:35%;
		  	}
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
	
	
	<nav class="navbar-default" role="navigation">
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
					<li class="menuItem"><a href="index.html#contact">Contact</a></li>
					<li class="menuItem"><a href="login.jsp">Login</a></li>
				</ul>
			</div>
		   
		</div>
	</nav> 

	<%
	CreateConnection connection = new CreateConnection();
	Connection conn = connection.getConnDB();
	
	
	String product= request.getParameter("product");
	int prodID = 0;

	PreparedStatement pstmt;
	ResultSet rs;
	
	if(request.getParameter("ID")!= null){
		prodID = Integer.parseInt(request.getParameter("ID"));
		pstmt= conn.prepareStatement("select * from product where ProductID = ?");
		pstmt.setInt(1, prodID);
		rs = pstmt.executeQuery();
		rs.next();
		product = rs.getString("productName");
	}
	

	
	pstmt= conn.prepareStatement("select * from product where productName = ?");
	pstmt.setString(1, product);
	rs = pstmt.executeQuery();
	
	if(request.getParameter("product")==null || request.getParameter("product").equals("")){
		response.sendRedirect("products.jsp");
		return;
	}

	
	if(rs.next()){
		//declare variable that will be used within the while
		String imgPath = rs.getString("imgPath");
		String prodName = rs.getString("productName");
		prodID = rs.getInt("productID");
		String productDesc = rs.getString("productDesc"); 
		String model = rs.getString("model");
		String specs = rs.getString("spec"); 
		SpecificationInformation si = new SpecificationInformation(specs);
		String[] spec = new String[10];
		for(int i = 0; i<10 ; i++){
			spec[i] = si.getSpec(si.getCount());
		}
		int qty = rs.getInt("qty");
		
		out.println("<div class='col-sm-6 pull-right wow fadeInRightBig animated animated' style='visibility: visible;'>");
		out.println("<img src='"+ imgPath +"' alt='"+ model +"' height='auto' width='90%' style='margin-top:20%;'>"+
				"<form action='purchase' method='POST' style='float:right; margin: 1em 15em 0 0;'>"+
		"<input type='text' name='productID' value=" + rs.getString("productID") + " hidden>"+
		"<input type='text' name='qty' placeholder='Quantity'>"+
		"<input type='submit' value='Purchase'> <p> Quantity Left: "+qty+"</p></form></div>");	
			
			
		out.print("<div class='content-section-a' style='padding-top:0;'><div class='container'><div class='row'><div class='col-sm-6 pull-right wow fadeInRightBig'></div><div class='col-sm-6 wow fadeInLeftBig'  data-animation-delay='200'>");
		out.println("<h2>"+prodName+"</h2><h4>"+productDesc+"</h4><hr />");
		
		//starting an ul
		out.println("<ul>");
		
		//forloop for printing the spec in list
		for(int i=0;i<spec.length;i++){
			//check if the field is null or not. if null don't print
			if(spec[i]!=null && !spec[i].equals("")){
				out.println("<li><i class='glyphicon glyphicon-hdd'></i>"+ spec[i] +"</li>");
			}
		}
		
		out.println("</ul></div></div></div></div>");
		
	}
	
	%>
	
	
		<div id="comment" class="content-section-a" style="background-color:white;">
		<div class="container">
			<div class="row">
			
			<div class="col-md-6  text-center wrap_title">
				<h2 style="float:left; margin: 0;">Comments</h2>
				
				<%
				String all="call showComments(?)";
				CallableStatement cs;
			 	cs = conn.prepareCall(all);
			 	cs.setInt(1, prodID);
			 	rs = cs.executeQuery();
			 	
			 	out.print("<div style='clear:both; height:20em; overflow:auto; border: 5px double black;'><ul style='border-bottom:1px solid black; padding:0;'>");
			 	if(rs.next()){
				 	do{
				 		out.print("<li style='border:1px solid black; border-bottom:0; word-break:break-all;'><div style='width:100%; padding: 10px;'><span style='float:left; padding-left:10px; font-weight:bold;'>"+rs.getString("Name")+"</span><div style='float:right;'><span style='padding-right:10px;'>"+rs.getString("Date")+"</span><span style='padding-right:10px'><br />"+rs.getInt("Rating")+"/5</span></div><br />"+rs.getString("Comment")+"</div></li>");
				 	}while(rs.next());
			 	}else{
			 		out.print("<li>No comments found.</li>");
			 	}
			 	out.print("</ul></div>");
				%>
			</div>
			
			<form role="form" action="processComment.jsp" method="post" >
				<div class="col-md-6">
				<input hidden type="text" name="ID" value="<%=prodID%>">
					<div class="form-group">
						<label for="name">Your Name</label>
						<div class="input-group">
							<input type="text" class="form-control" name="name" id="name" placeholder="Enter Name" required>
							<span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
						</div>
					</div>
					
					<div class="form-group">
						<label for="rating">Your Rating</label>
							<select name="rating" style="margin-left:10px;">
								<option value=5>5</option>
								<option value=4>4</option>
								<option value=3>3</option>
								<option value=2>2</option>
								<option value=1>1</option>
							</select>
					</div>
					
					<div class="form-group">
						<label for="comment">Comment</label>
						<div class="input-group">
							<textarea name="comment" id="comment" class="form-control" rows="5" style="resize:none;" required></textarea>
							<span class="input-group-addon"><i class="glyphicon glyphicon-ok form-control-feedback"></i></span>
						</div>
					</div>

					<input type="submit" name="submit" id="submit" value="Submit" class="btn wow tada btn-embossed btn-primary pull-right">
				</div>
			</form>
			
			<h4><%
			String msg = request.getParameter("msg");
			if(msg!=null){out.print(msg);}%></h4>
				
			</div>
		</div>
	</div>
	

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
