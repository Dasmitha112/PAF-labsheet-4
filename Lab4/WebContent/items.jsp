<%@ page import="com.item"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%

	//Insert item----------------------------------
	if (request.getParameter("itemCode") != null) {
		item itemObj = new item();
		String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
											request.getParameter("itemName"),
											request.getParameter("itemPrice"), 
											request.getParameter("itemDesc"));
		
		session.setAttribute("statusMsg", stsMsg);
	}
	
	//Delete item----------------------------------
	if (request.getParameter("itemID") != null) {
		item itemObj = new item();
		String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
		session.setAttribute("statusMsg", stsMsg);
	}
	
	//Update item----------------------------------
	if (request.getParameter("itemID") != null) {
		item itemObj = new item();
		String stsMsg = itemObj.updateItem(request.getParameter("itemID"), request.getParameter("itemName"));
		session.setAttribute("statusMsg", stsMsg);
	}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<title>Items Management</title>
<link rel="stylesheet" href="Views/bootstrap.css">

</head>


<body>

	<div class="container">
		<div class="row">
		<div class="col">


			<h1>Items Management</h1>
			
			<form method="post" action="items.jsp">
				Item code: <input name="itemCode" type="text" class="form-control"> <br> 
				Item name: <input name="itemName" type="text" class="form-control"> <br>
				Item price:	<input name="itemPrice" type="text" class="form-control"> <br>
				Item description: <input name="itemDesc" type="text" class="form-control"> <br><br>
				<input name="btnSubmit" type="submit" value="Save" class="btn btn-secondary">
			</form>
			
			<br>
			
			<div class="alert alert-success">
				<%
					out.print(session.getAttribute("statusMsg"));
				%>
			</div>
			
			<br><br>
			
			<%
				item itemObj = new item();
				out.print(itemObj.readItems());
			%>
	
		</div>
		</div>
	</div>
	
</body>
</html>