<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
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
	
</body>
</html>