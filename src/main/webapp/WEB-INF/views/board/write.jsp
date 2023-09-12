<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시글 등록</title>
	</head>
	<body>
		<h1>공지 등록</h1>
<!-- 		enctype="multipart/form-data" -> 파일 보낼 수 있음 -->
		<form action="/board/write.kh" method="post" enctype="multipart/form-data">
		<input type="hidden" name="boardWriter" value="${sessionScope.memberId }">
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="boardTitle">
				</li>
				<li>
					<label>작성자</label>
					<span>${sessionScope.memberId }</span>
				</li>
				<li>
					<label>내용</label>
					<textarea rows="4" cols="50" name="boardContent"> </textarea>
				</li>
				<li>
					<label>첨부파일</label>
					<!-- String으로 받을 수 없고 변환작업 필요 -->
					<input type="file" name="uploadFile">
				</li>
			</ul>
			<input type="submit" value="등록">
			<input type="reset" value="취소">
			</form>
	</body>
</html>