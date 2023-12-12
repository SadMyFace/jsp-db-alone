<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri ="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	.cmtModBtn{
		margin-left: 5px;	
	}
	.cmtDelBtn{
		margin-left: 5px;	
	}
</style>
</head>
<body>
	<h1 class="d-flex justify-content-center">Detail Page</h1>
	<!-- 		this.bno = bno;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.regdate = regdate;
		this.moddate = moddate;
		this.readCount = readCount; -->
	<div class="container .container-sm col-md-3">
		<div>
			<img alt="" src="/_fileUpload/${bvo.imageFile }">
		</div>
	<table border="1" class="table table-hover">
		<tr>
			<th>번호</th>
			<td>${bvo.bno }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td>${bvo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${bvo.content }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${bvo.regdate }</td>
		</tr>
		<tr>
			<th>수정일</th>
			<td>${bvo.moddate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${bvo.readCount }</td>
		</tr>
	</table>
	</div>
	
		<c:if test="${ses.id eq bvo.writer}">
			<a href="/brd/modify?bno=${bvo.bno }" class="d-flex justify-content-center"><button class="btn btn-primary">modify</button></a>
			<br>
			<a href="/brd/remove?bno=${bvo.bno }" class="d-flex justify-content-center"><button class="btn btn-primary">remove</button></a>
			<br>
		</c:if>
		<a href="/brd/list" class="d-flex justify-content-center"><button class="btn btn-primary">list</button></a>
		
		<!-- comment line -->
		<hr>
		<div class="container .container-sm col-md-3">
			comment line <br>
			<input type="text" id="cmtWriter" value="${ses.id }" readonly="readonly"> <br> 
			<input type="text" id="cmtText" placeholder="Add Comment...">
			<button type="button" id="cmtAddBtn" class="btn btn-primary">댓글 등록</button>
		</div>
		
		<!-- 댓글 표시 라인 -->
		<div id="commentLine" class="container .container-sm col-md-3">
			<div>cno, bno, writer, regdate</div>
			<div>
				<button class="btn btn-primary">수정</button>  <button class="btn btn-primary">삭제</button> <br>
				<input value="content">
			</div>
		</div>
		
		<script type="text/javascript">
			const bnoVal = `<c:out value = "${bvo.bno}" />`;
			console.log(bnoVal);
		</script>
		<script src="/resources/board_detail.js"></script>
		<script type="text/javascript">
			printCommentList(bnoVal);
		</script>
</body>
</html>