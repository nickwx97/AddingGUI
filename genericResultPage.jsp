<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	boolean success = (boolean)request.getAttribute("result");
	String type = (String)request.getAttribute("type");
	
	if(success){
		//success switch
		switch(type){
		case "insertCat" :
			out.println("Category inserted!");
			break;
		case "updateCat" :
			out.println("Category updated!");
			break;
		case "deleteCat" :
			out.println("Category deleted!");
			break;
		case "insertProd" :
			out.println("Product inserted!");
			break;
		case "updateProd" :
			out.println("Product updated!");
			break;
		case "deleteProd" :
			out.println("Product deleted!");
			break;
		case "createUser" :
			out.println("User Created!");
			break;
		case "updateUser" :
			out.println("User updated!");
			break;
		default :
			out.println("Error");
		}
		
	}else{
		//failure switch
		switch(type){
		case "insertCat" :
			out.println("Category insertion failed!");
			break;
		case "updateCat" :
			out.println("Update category failed!");
			break;
		case "deleteCat" :
			out.println("Category deletion failed!");
			break;
		case "insertProd" :
			out.println("Product insertion failed!");
			break;
		case "updateProd" :
			out.println("Update product failed!");
			break;
		case "deleteProd" :
			out.println("Product deletion failed!");
			break;
		case "createUser" :
			out.println("User Creation failed!");
			break;
		case "updateUser" :
			out.println("Update user failed!");
			break;
		default :
			out.println("Error");
		}
	}
%>

</body>
</html>