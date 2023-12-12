<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 class="d-flex justify-content-center">Register Page</h1>

	<div class="container .container-sm col-md-2">
		<form action="/memb/register" method="post">
			<label for="exampleFormControlInput1" class="form-label">Id</label>
  			<input type="text" name="id" class="form-control" id="exampleFormControlInput1" placeholder="ID">
			<label for="exampleFormControlInput1" class="form-label">Password</label>
  			<input type="text" name="pwd" class="form-control" id="exampleFormControlInput1" placeholder="PW">
			<label for="exampleFormControlInput1" class="form-label">Email</label>
  			<input type="text" name="email" class="form-control" id="exampleFormControlInput1" placeholder="Email">
			<label for="exampleFormControlInput1" class="form-label">Age</label>
  			<input type="text" name="age" class="form-control" id="exampleFormControlInput1" placeholder="Age">
			<button type="submit" class="btn btn-primary">생성</button>
		</form>
		<a href="/index.jsp" class="d-flex justify-content-center"><button class="btn btn-primary">index</button></a>	
	</div>
</body>
</html>