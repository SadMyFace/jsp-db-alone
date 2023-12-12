<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	img{
		display: block;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<h1 class="d-flex justify-content-center">Modify Page</h1>
	<!-- 		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
		this.moddate = moddate;
		this.readCount = readCount; -->
	<div class="container .container-sm col-md-3">
		<img alt="" src="/_fileUpload/${bvo.imageFile }">
	<form action="/brd/edit" method="post" enctype="multipart/form-data">
		<input type="hidden" name="bno" value="${bvo.bno }">
	<table border="1" class="table table-hover">
		<tr>
			<th>번호</th>
			<!--<td><input type="text" name="title" value="${bvo.bno }" readonly="readonly"></td>-->
			<td>${bvo.bno }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" class="form-control" id="exampleFormControlInput1" value="${bvo.title }"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="writer" class="form-control" id="exampleFormControlInput1" value="${bvo.writer }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea class="form-control" name="content" id="exampleFormControlTextarea1" rows="3" value="">${bvo.content }</textarea></td>
		</tr>
		<tr>
			<th>작성일</th>
			<td><input type="text" name="regdate" class="form-control" id="exampleFormControlInput1" value="${bvo.regdate }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>수정일</th>
			<td><input type="text" name="moddate" class="form-control" id="exampleFormControlInput1" value="${bvo.moddate }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><input type="text" name="readCount" class="form-control" id="exampleFormControlInput1" value="${bvo.readCount }" readonly="readonly"></td>
		</tr>
		<tr>
			<th>Image_File</th>
			<td>
				<input type="hidden" name="image_file" value="${bvo.imageFile }">
				<input type="file" name="new_file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
			</td>
		</tr>
		
	</table>
		<button type="submit" class="btn btn-primary">modify</button>
	</form>
	</div>
	
	<a href="/brd/delete?bno=${bvo.bno }" class="d-flex justify-content-center"><button class="btn btn-primary">remove</button></a>
	<br>
	<a href="/brd/list" class="d-flex justify-content-center"><button class="btn btn-primary">list</button></a>
	
</body>
</html>