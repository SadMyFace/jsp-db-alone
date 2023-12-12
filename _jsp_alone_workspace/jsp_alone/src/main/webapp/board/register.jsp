<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 페이지</title>
</head>
<body>
	<h1 class="d-flex justify-content-center">Board Register Page</h1>
	<div class="container .container-sm col-md-2">
		<form action="/brd/insert" method="post" enctype="multipart/form-data"> <br> 
			<label for="exampleFormControlInput1" class="form-label">제목</label>
  			<input type="text" name="title" class="form-control" id="exampleFormControlInput1" placeholder="title">
			<label for="exampleFormControlInput1" class="form-label">작성자</label>
  			<input type="text" name="writer" class="form-control" id="exampleFormControlInput1" value=${ses.id } readonly="readonly">
			<label for="exampleFormControlTextarea1" class="form-label">내용</label>
 			<textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="3"></textarea>
			<input type="file" name="image_file" accept="image/png, image/jpg, image/gif, image/jpeg" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
  			<button class="btn btn-outline-secondary" type="submit" id="inputGroupFileAddon04">전송</button>
		</form>
	</div>
		<a href="/index.jsp" class="d-flex justify-content-center"><button class="btn btn-primary">index</button></a>	
</body>
</html>