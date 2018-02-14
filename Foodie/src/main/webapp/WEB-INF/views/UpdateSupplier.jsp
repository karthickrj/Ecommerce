<%@ page language="java" contentType="text/html" import="com.model.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
<title>Supplier</title>
</head>
<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>

<form:form action="${pageContext.request.contextPath}//UpdateSupplier" modelAttribute="supplier" method="post">

<h1>Food List</h1>
	
		<table class="table">
		<tr>
		<td>Supplier ID</td>
		
		<td><form:input path="supplierId"/></td>
	</tr>
	<tr>
		<td>Supplier Name</td>
		
		<td><form:input path="supplierName"/></td>
	</tr>
	<tr>
		<td>Supplier Address</td>
		
		<td><form:input path="supplierAddress"/></td>
	</tr>
	<tr>
		<td><input type="submit" value="UpdateSupplier" class="btn btn-primary"></td>
			</tr>
		</table>
</form:form>
<c:if test="${!empty supplierList}">
		<table class="table table-bordered">
		<tr>
			<td>Supplier ID</td>
	       <td>Supplier Name</td>
	       <td>Supplier Address</td>
	        <td>Operation</td>
</tr>
<c:forEach items="${supplierList}" var="supplier">
	<tr bgcolor="cyan">
		<td>${supplier.supplierId}</td>
		<td>${supplier.supplierName}</td>
		<td>${supplier.supplierAddress}</td>
		<td>
			<a href="<c:url value="deleteSupplier/${supplier.supplierId}"/>"><span class="glyphicon glyphicon-trash"></span></a>/
			<a href="<c:url value="updateSupplier/${supplier.supplierId}"/>"><span class="glyphicon glyphicon-pencil"></span></a>
		</td>
	</tr>
</c:forEach>

</table>
</c:if>

</body>
</html>