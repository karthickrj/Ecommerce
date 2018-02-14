<%@ page language="java" contentType="text/html" import="com.model.Food"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>
<title>Food</title>
<link rel="stylesheet" href="resources\css\table.css">
</head>
<body>

<jsp:include page="UserHeader.jsp"></jsp:include>
<form:form action="${pageContext.request.contextPath}//UserList" modelAttribute="food" method="post">
<c:if test="${!empty foodList}">
		<table class="table table-bordered">
			<tr>
				
				<th width="120">Food Name</th>
				<th width="80">Food Category</th>
				<th width="80">Food Price</th>
				<th width="80">Image</th>
				<th width="40">Order</th>
				
				
			</tr>
			<c:forEach items="${foodList}" var="food">
				<tr>
					
					<td>${food.foodName}</td>
					<td>${food.catName}</td>
					<td>${food.price}</td>
					<td><img src="<c:url value="resources/images/${food.foodId}.jpg"/>" width="100px" height="100px"></td>
					
					<td><a href"<c:url value="order/${food.foodId}"/> class="btn btn-info btn-lg">
          <span class="glyphicon glyphicon-shopping-cart"></span>Order
        </a></td>
					
					
				</tr>
			</c:forEach>
		</table>
		
	</c:if>
	</form:form>
	
</body>
</html>