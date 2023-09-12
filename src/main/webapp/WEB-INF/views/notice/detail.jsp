<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세조회</title>
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
	<body>
		<h1>공지 상세조회</h1>
			<ul>
				<li>
					<label>제목</label>
					<span>${notice.noticeSubject }</span>
<%-- 					<input type="text" name="noticeSubject" value="${notice.noticeSubject }" readonly> --%>
				</li>
				<li>
					<label>작성자</label>
					<span>${notice.noticeWriter }</span>
<%-- 					<input type="text" name="noticeWriter" value="${notice.noticeWriter }" readonly> --%>
				</li>
				<li>
					<label>내용</label>
					<p>${notice.noticeContent }</p>
				</li>
				<li>
					<label>첨부파일</label>
					<!-- String으로 받을 수 없고 변환작업 필요 -->
					<img alt="첨부파일" src="../resources/nuploadFiles/${notice.noticeFileRename }"><br>
					<a href="../resources/nuploadFiles/${notice.noticeFileRename }" download>${notice.noticeFileName }</a> 
				</li>
			</ul>
			<br><br>
			<div>
				<button type="button" onclick="showModifyPage();">수정하기</button>
				<button>삭제하기</button>
				<button type="button" onclick="showNoticeList();">목록</button>
				
			</div>
			<script type="text/javascript">
				function showModifyPage(){
					const noticeNo = "${notice.noticeNo}";
					location.href="/notice/modify.kh?noticeNo="+noticeNo;
				}
				function showNoticeList(){
					location.href="/notice/list.kh";
				}
			</script>
	</body>
</html>