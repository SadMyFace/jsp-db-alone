<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>list Page</title>
<style type="text/css">
	#search_div{
		text-align: center;
	}

</style>
</head>
<body>
	<h1 class="d-flex justify-content-center">List Page</h1>
	<div class="container .container-sm">
		<table border="1" class="table table-hover">
			<tr>
				<th>bno</th>
				<th>title</th>
				<th>writer</th>
				<th>regdate</th>
				<th>readCount</th>
			</tr>
			<!-- DB에서 가져온 리스트를 c:foreach를 통해 반복 -->
			<c:forEach items="${list }" var="bvo">
			<tr>
				<td><a href="/brd/detail?bno=${bvo.bno}">${bvo.bno }</a></td>
				<td>
				<c:if test="${bvo.imageFile ne null }">
					<img alt="" src="/_fileUpload/_th_${bvo.imageFile }">
				</c:if><a href="/brd/detail?bno=${bvo.bno}">${bvo.title }
				</a></td>
				<td>${bvo.writer }</td>
				<td>${bvo.regdate }</td>
				<td>${bvo.readCount }</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>
	<nav aria-label="Page navigation example">
	  <ul class="pagination justify-content-center">
	    <li class="page-item">
	      <c:if test="${ph.prev }">
			<a class="page-link" href="/brd/list?pageNo=${ph.startPage - 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> ◁ </a>
		</c:if>
	    </li>
	    <c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
			<li class="page-item"><a class="page-link" href="/brd/list?pageNo=${i }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> ${i } </a></li>
		</c:forEach>
	    <li class="page-item">
	      <c:if test="${ph.next }">
			<a class="page-link" href="/brd/list?pageNo=${ph.endPage + 1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> ▷ </a>
		</c:if>
	    </li>
	  </ul>
	</nav>
	
	<a href="/brd/register" class="d-flex justify-content-center"><button class="btn btn-primary">register</button></a>
	<br>
	<a href="/index.jsp" class="d-flex justify-content-center"><button class="btn btn-primary">index</button></a>	
	
	
	<div id="search_div">
		<form action="/brd/list" method="get">
			<c:set value="${ph.pgvo.type }" var="typed"/>
				<select name="type" >
					<option ${typed == null ? 'selected' : '' }>Choose...</option>
					<option value="t" ${typed eq 't' ? 'selected' : '' }>title</option>
					<option value="w" ${typed eq 'w' ? 'selected' : '' }>writer</option>
					<option value="c" ${typed eq 'c' ? 'selected' : '' }>content</option>
					<option value="tc" ${typed eq 'tc' ? 'selected' : '' }>title&content</option>
					<option value="tw" ${typed eq 'tw' ? 'selected' : '' }>title&writer</option>
					<option value="wc" ${typed eq 'wc' ? 'selected' : '' }>writer&content</option>
					<option value="twc" ${typed eq 'twc' ? 'selected' : '' }>title&writer&content</option>
				</select>
				<input type="text" name="keyword" placeholder="Search" value="${ph.pgvo.keyword }">
				<input type="hidden" name="pageNo" value="1">
				<input type="hidden" name="qty" value="${ph.pgvo.qty }">
				<button type="submit" class="btn btn-primary">Search</button>
				<span>${ph.totalCount }</span>
		</form>
	</div>
	
	
</body>
</html>