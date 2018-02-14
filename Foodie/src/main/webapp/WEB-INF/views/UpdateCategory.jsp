<%@ page language="java" contentType="text/html" import="com.model.Category"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
<title>Category</title>
</head>
<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>

<form:form action="${pageContext.request.contextPath}//UpdateCategory" modelAttribute="category" method="post">

<h1>Food List</h1>
	
		<table class="table">
		<tr>
		<td>Category ID</td>
		
		<td><form:input path="catId"/></td>
	</tr>
	<tr>
		<td>Category Name</td>
		
		<td><form:input path="catName"/></td>
	</tr>
	<tr>
		
		<td><input type="submit" value="UpdateCategory" class="btn btn-primary"></td>
			</tr>
		</table>
</form:form>
<c:if test="${!categoryList}">
		<table class="table table-bordered">
		<tr>
			<td>Category ID</td>
	       <td>Category Name</td>
	       
	        <td>Operation</td>
</tr>
<c:forEach items="${categoryList}" var="category">
	<tr bgcolor="cyan">
		<td>${category.catId}</td>
		<td>${category.catName}</td>
		
		<td>
			<a href="<c:url value="deleteCategory/${category.catId}"/>"><span class="glyphicon glyphicon-trash"></span></a>/
			<a href="<c:url value="updateCategory/${category.catId}"/>"><span class="glyphicon glyphicon-pencil"></span></a>
		</td>
	</tr>
</c:forEach>

</table>
</c:if>

</body>
</html>