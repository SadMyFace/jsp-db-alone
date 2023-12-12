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
	<div class="container .container-sm col-md-2">
		<form action="/memb/modify" method="post">
			<label for="exampleFormControlInput1" class="form-label">Id</label>
	  			<input type="text" name="id" class="form-control" id="exampleFormControlInput1" value="${ses.id }" readonly="readonly">
				<label for="exampleFormControlInput1" class="form-label">Password</label>
	  			<input type="text" name="pwd" class="form-control" id="exampleFormControlInput1" value="${ses.pwd }">
				<label for="exampleFormControlInput1" class="form-label">Email</label>
	  			<input type="text" name="email" class="form-control" id="exampleFormControlInput1" value="${ses.email }">
				<label for="exampleFormControlInput1" class="form-label">Age</label>
	  			<input type="text" name="age" class="form-control" id="exampleFormControlInput1" value="${ses.age }">
			<button type="submit" class="btn btn-primary">수정</button>
		</form>
	</div>
	<a href="/memb/remove" class="d-flex justify-content-center"><button class="btn btn-primary">삭제</button></a>
	<br>
	<a href="/index.jsp" class="d-flex justify-content-center"><button class="btn btn-primary">index</button></a>	
	
</body>
</html>