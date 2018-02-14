<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="resources/css/login.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>





</head>
<body>

<div class="bg">
<jsp:include page="header.jsp"></jsp:include>
<br>
<div class = "container">
	<div class="wrapper">
		<form action="perform_login" method="post" name="Login_Form" class="form-signin">    
		    <h3 class="form-signin-heading">Welcome Back! Please Sign In</h3>
			  <hr class="colorgraph"><br>
			  
			  <input type="text" class="form-control" placeholder="Enter UserName" name="username"   placeholder="Username" required="" autofocus="" />
			  <input type="password" class="form-control" placeholder="Enter Password" name="password" required=""/>     		  
			   	
			 <button class="btn btn-lg btn-primary btn-block"  name="Submit"  type="submit">Submit</button>  			
		</form>			
	</div>
</div>
  
  </div>
  

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>