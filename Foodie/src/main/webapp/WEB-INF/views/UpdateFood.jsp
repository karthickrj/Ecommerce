<%@ page language="java" contentType="text/html" import="com.model.Food"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
<title>Food</title>
</head>
<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>

<form:form action="${pageContext.request.contextPath}//UpdateFood" modelAttribute="food" method="post">

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
				<td><input type="text" name="catName" required="required"></td>
			</tr>
			<tr>
				<td>Food Price:</td>
				<td><input type="text" name="price" required="required"></td>
			</tr>
			<tr>
				
				<td>Food SupplierId:</td>
				<td><input type="text" name="supplierId" required="required"></td>
			</tr>
			<tr>
			<td>Image:</td>
				<td><input type="file" name="pimage" required="required"></td>
			</tr>
			<tr>
				<td><input type="submit" value="UpdateFood" class="btn btn-primary"></td>
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
				<th width="150">Action</th>
			</tr>
			<c:forEach items="${foodList}" var="food">
				<tr>
					<td>${food.foodId}</td>
					<td>${food.foodName}</td>
					<td>${food.catName}</td>
					<td>${food.price}</td>
					<td>${food.supplierId}</td>
					
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