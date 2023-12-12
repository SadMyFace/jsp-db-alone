<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container .container-sm">
		<table border="1" class="table table-hover">
			<tr>
				<th>ID</th>
				<th>PW</th>
				<th>Email</th>
				<th>Age</th>
				<th>regdate</th>
				<th>lastlogin</th>
			</tr>
			<c:forEach items="${list }" var="bvo">
				<tr>
					<td>${bvo.id }</td>
					<td>${bvo.pwd }</td>
					<td>${bvo.email }</td>
					<td>${bvo.age }</td>
					<td>${bvo.regdate }</td>
					<td>${bvo.lastlogin }</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<a href="/index.jsp" class="d-flex justify-content-center"><button class="btn btn-primary">index</button></a>	
</body>
</html>