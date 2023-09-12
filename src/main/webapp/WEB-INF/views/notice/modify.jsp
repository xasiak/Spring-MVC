<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 수정</title>
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
	<body>
		<h1>공지 수정</h1>
<!-- 		enctype="multipart/form-data" -> 파일 보낼 수 있음 -->
		<form action="/notice/modify.kh" method="post" enctype="multipart/form-data">
			<!-- 수정할 때, 리다이렉트 될 때 사용 -->
			<input type="hidden" name="noticeNo" value="${notice.noticeNo }">
			<!-- 기존 업로그 파일 체크할 때 사용 -->
			<input type="hidden" name="noticeFileName" value="${notice.noticeFileName }">
			<input type="hidden" name="noticeFileRename" value="${notice.noticeFileRename }">
			<input type="hidden" name="noticeFilePath" value="${notice.noticeFilePath }">
			<input type="hidden" name="noticeFileLength" value="${notice.noticeFileLength }">
			<ul>
				<li>
					<label>제목</label>
					<input type="text" name="noticeSubject" value="${notice.noticeSubject }">
				</li>
				<li>
					<label>작성자</label>
					<input type="text" name="noticeWriter" value='${notice.noticeWriter }' readonly>
				</li>
				<li>
					<label>내용</label>
					<textarea rows="4" cols="50" name="noticeContent">${notice.noticeContent } </textarea>
				</li>
				<li>
					<label>첨부파일</label>
					<!-- String으로 받을 수 없고 변환작업 필요 -->
					<a href="../resources/nuploadFiles/${notice.noticeFileName }" download>${notice.noticeFileName }</a> 
					<input type="file" name="uploadFile">
				</li>
			</ul>
			<input type="submit" value="수정">
			<input type="reset" value="취소">
			</form>
	</body>
</html>