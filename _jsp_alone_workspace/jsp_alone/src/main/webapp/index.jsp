<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1 class="d-flex justify-content-center">Hello my First JSP World~!!</h1>
	
	<!-- 
	get: 이동 => 주소표시줄에 데이터를 ? 쿼리스트링으로 달고 이동 
	post: 등록(많은 데이터를 이동) 별도의 저장공간에 담아서 이동 
	-->
	<div class="container .container-sm col-md-2">
		<form action="/memb/login" method="post">
			ID : <input type="text" name="id" class="form-control" id="exampleFormControlInput1" placeholder="ID">
			Pwd : <input type="password" name="pwd" class="form-control" id="exampleFormControlInput1" placeholder="PW">
			<button type="submit" class="btn btn-primary">login</button>
		</form>
	</div>
	
	<div class="container .container-sm col-md-2">
		<c:if test="${ses.id ne null }">
			${ses.id }님이 login 하셨습니다. <br>
			계정생성일 : ${ses.regdate } <br>
			마지막접속 : ${ses.lastlogin } <br>
			<a href="/memb/detail"><button class="btn btn-primary">회원정보수정</button></a>
			<a href="/memb/list"><button class="btn btn-primary">회원리스트</button></a>
			<br><br>
			<a href="/memb/logout"><button class="btn btn-primary">로그아웃</button></a> 
			<a href="/brd/register"><button type="button" class="btn btn-primary">글쓰기 페이지로 이동</button></a>
		</c:if>
		
		<%-- <c:if test="${modifySuccess > 0 }">
			<p>회원 정보 수정에 성공하였습니다.</p>
		</c:if> --%>
		
		
		
	</div>
	
	<br>
	<hr>
	<br>
	
	<a href="/memb/join" class="d-flex justify-content-center"><button class="btn btn-primary">회원가입</button></a>
	<br>
	<a href="/brd/register" class="d-flex justify-content-center"><button class="btn btn-primary">글쓰기 페이지로 이동</button></a>
	<br>
	<a href="/brd/list" class="d-flex justify-content-center"><button class="btn btn-primary">게시판 리스트로 이동</button></a>
	<script type="text/javascript">
		const msg_login = `<c:out value="${msg_login}" />`;
		console.log(msg_login);
		
		if(msg_login == '-1'){
			alert('로그인 정보가 일치하지 않습니다.');
		}
		
		const msg_modify = `<c:out value="${modifySuccess}" />`;
		console.log(msg_modify);
		
		if(msg_modify == '1'){
			alert('회원 정보 수정 완료');
		}
		
		const msg_remove = `<c:out value="${removeSuccess}" />`;
		console.log(msg_remove);
		
		if(msg_remove == '1'){
			alert('회원 정보 삭제 완료');
		}
	</script>
</body>
</html>