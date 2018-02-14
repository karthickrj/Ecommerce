<%@ page language="java" contentType="text/html" import="com.model.Food"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
<head>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order</title>
</head>
<jsp:include page="ClientHeader.jsp"></jsp:include>
<body>



<div class="container">
<div class="row">
<form:form action="${pageContext.request.contextPath}//Order" modelAttribute="food" method="post" enctype="multipart/form-data" class="form-signing">
<c:forEach items="${foodList}" var="food" >


<div class="col-xs-4 item-photo">
<img src="<c:url value="/resources/images/${food.foodId}.jpg"/>"  width="300px" height="300px" />
</div>

<div class="col-xs-5" style="border:0px solid gray">

<h3>${food.foodName}</h3>

<h4>Rs. ${food.price }</h4>
<h5>${food.pimage}</h5> 
<div class="section" style="padding-bottom:20px;">
	<input type="hidden" value="${food.foodId }" name="foodId">
	<input type="hidden" value="${food.price }" name="price">
	<input type="hidden" value="${food.foodName }" name="foodName">
</div>



<input type="number" class="form-control" name="quantity" required>
	
<input class="btn btn-primary btn-lg" type="submit" >

</div>
</c:forEach>
</form:form>
</div>
</div>

</body>
</div>
</html>