<%@ page language="java" contentType="text/html" import="com.model.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Foodie</title>


</head>
<link rel="stylesheet" href="resources\css\table.css">
<body bgcolor="gray" class="container">
<jsp:include page="AdminHeader.jsp"></jsp:include>
<form:form action="InsertFood" modelAttribute="food"  enctype="multipart/form-data" name="myform"> 
	<div class="logo">E-Commerce</div>
	<h1>Food List</h1>
	
		<table class="table">
		<tr>
				<td>Food ID:</td>
				<td><input type="text" name="foodId" required="required"></td>
			</tr>
			<tr>
				<td>Food Name:</td>
				<td><input type="text" name="foodName" required="required"></td>
			</tr>
			<tr>
				
				<td>Food Category:</td>
				<td><select type="text" name="catName" required="required">
				<option value="">----category choices----</option>
				<c:forEach items="${categoryList}" var="category">
				<option value="${category.catName}">${category.catName}</option></c:forEach>
					
				</select></td>
			</tr>
			<tr>
				<td>Food Price:</td>
				<td><input type="text" name="price" required="required"></td>
			</tr>
			<tr>
				
				<td>Food SupplierId:</td>
				<td><select type="text" name="supplierId" required="required">
				<option value=""> ----supplier choices----</option>
				<c:forEach items="${supplierList}" var="supplier">
				<option value="${supplier.supplierId}">${supplier.supplierId}</option></c:forEach>
				</select></td>
			</tr>
			<tr>
			<td>Image:</td>
				<td><input type="file" name="pimage" required="required"></td>
			</tr>
			<tr>
				<td><input type="submit" value="Insert" class="btn btn-primary"></td>
			</tr>
		</table>
</form:form>
	<c:if test="${!empty foodList}">
		<table class="table table-bordered">
			<tr>
				<th width="80">Food ID</th>
				<th width="120">Food Name</th>
				<th width="80">Food Category</th>
				<th width="80">Food Price</th>
				<th width="80">Food SupplierId</th>
				<th width="80">Image</th>
				<th width="150">Action</th>
			</tr>
			<c:forEach items="${foodList}" var="food">
				<tr>
					<td>${food.foodId}</td>
					<td>${food.foodName}</td>
					<td>${food.catName}</td>
					<td>${food.price}</td>
					<td>${food.supplierId}</td>
					<td><img src="<c:url value="resources/images/${food.foodId}.jpg"/>" width="100px" height="100px"></td>
					<td>
			<a href="<c:url value="deleteFood/${food.foodId}"/>"><span class="glyphicon glyphicon-trash"></span></a>
			<a href="<c:url value="updateFood/${food.foodId}"/>"><span class="glyphicon glyphicon-pencil"></span></a>
		</td>
				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>