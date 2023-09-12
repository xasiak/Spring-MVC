<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>공지사항 상세조회</title>
		
<!-- 		<link rel="stylesheet" href="../resources/css/board/board.css"> -->
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
	<body>
		<h1>공지 상세조회</h1> 
			<ul>
				<li>
					<label>제목</label>
					<span>${board.boardTitle }</span>
<%-- 					<input type="text" name="boardTitle" value="${board.boardTitle }" readonly> --%>
				</li>
				<li>
					<label>작성자</label>
					<span>${board.boardWriter }</span>
<%-- 					<input type="text" name="boardWriter" value="${board.boardWriter }" readonly> --%>
				</li>
				<li>
					<label>내용</label>
					<p>${board.boardContent }</p>
				</li>
				<li>
					<label>첨부파일</label>
					<!-- String으로 받을 수 없고 변환작업 필요 -->
					<img alt="첨부파일" src="../resources/buploadFiles/${board.boardFileRename }"><br>
					<a href="${board.boardFilePath }" download>${board.boardFileName }</a> 
					<c:if test="${not empty board.boardFileName  }">
					<a href="#">삭제하기</a>
					</c:if>
				</li>
			</ul>
			<br><br>
			<c:url var="delBoardUrl" value="/board/delete.kh">
				<c:param name="boardNo" value="${board.boardNo }"></c:param>
				<c:param name="boardWriter" value="${board.boardWriter }"></c:param>
			</c:url>
			<c:url var="modifyBoardUrl" value="/board/modify.kh">
				<c:param name="boardNo" value="${board.boardNo }"></c:param>
			</c:url>
			<c:url var="boardlistUrl" value="/board/list.kh">
				<c:param name="boardNo" value="${board.boardNo }"></c:param>
			</c:url>
			<div>
				<button type="button" onclick="modifyBoard('${modifyBoardUrl }');">수정하기</button>
				<button type="button" onclick="deleteBoard('${delBoardUrl}');">삭제하기</button>
				<button type="button" onclick="showBoardList('${boardlistUrl}');">목록</button>
			</div>
			<!-- 댓글 등록 -->
			<form action="/reply/add.kh" method="post">
				<input type="hidden" name="refBoardNo" value="${board.boardNo }">
				<table width="500" border="1">
					<tr>
						<td>
							<textarea rows="3" cols="55" name="replyContent"></textarea>
						</td>
						<td>
							<input type="submit" value="완료">
						</td>
					</tr>
				</table>
			</form>
			
			<!-- 댓글 목록 -->
			<table width="550" border="1">
					<c:forEach var="reply" items="${rList }" varStatus="i"> 
						<tr>
							<td>${reply.replyWriter }</td>
							<td>${reply.replyContent }</td>
							<td>${reply.rCreateDate }</td>
							<td>
								<a href="javascript:void(0);" onclick="showReplyModifyForm(this);">수정하기</a>
								<c:url var="delUrl" value="/reply/delete.kh">
									<c:param name="replyNo" value="${reply.replyNo }"></c:param>
									<c:param name="replyWriter" value="${reply.replyWriter }"></c:param>
									<!-- 자신의 댓글만 지우도록 하기 위해서 추가 -->
									<c:param name="refBoardNo" value="${reply.refBoardNo }"></c:param>
									<!-- 성공하면 디테일로 가기 위해 필요한 BoarNo 셋팅 -->
								</c:url>
<%-- 								<a href="javascript:void(0);" onclick="showModifyForm(this,'${reply.replyContent }');">수정하기</a> --%>
								<a href="javascript:void(0);" onclick="deleteReply('${delUrl }');">삭제하기</a>
							</td>
						</tr>
						<tr id="replyModifyForm" style="display:none;">
<!-- 							<form action="/reply/update.kh" method="post"> -->
<%-- 								<input type="hidden" name="replyNo" value="${reply.replyNo }"> --%>
<%-- 								<input type="hidden" name="refBoardNo" value="${reply.refBoardNo }"> --%>
<%-- 								<td colspan="3"><input type="text" size="50" name="replyContent" value="${reply.replyContent }"></td> --%>
<!-- <!-- 								<td><textarea rows="3" cols="55" name="replyContent"></textarea></td> --> 
<!-- <!-- 								<td><input type="submit" value="완료"></td> --> 
								<td colspan="3"><input id="replyContent" type="text" size="50" name="replyContent" value="${reply.replyContent }"></td>
								<td><input type="button" onclick="modifyReply(this, '${reply.replyNo}', '${reply.refBoardNo }');" value="완료"></td>
							</form>
						</tr>
					</c:forEach>
			</table>	
			<script type="text/javascript">
			// 게시글 ------------------------
			const showBoardList = (url) => {
				location.href = url;
			}
			const modifyBoard = (url) => {
				location.href = url;
			}
			
			const deleteBoard = (url) => {
				location.href = url;
			}
			
			// 댓글 ----------------------------------
			function deleteReply(url){
				location.href = url;
				
			}
				function modifyReply(obj, replyNo, refBoardNo){
					// #2. DOM 프로그래밍을 이용하는 방법
					const form = document.createElement("form");
					form.action = "/reply/update.kh";
					form.method = "post";
					const input2 = document.createElement("input");
					input2.type = "hidden";
					input2.value =replyNo;
					input2.name = "replyNo";
					const input3 = document.createElement("input");
					input3.type = "hidden";
					input3.value = refBoardNo;
					input3.name = "refBoardNo";
					const input = document.createElement("input");
					input.type = "text";
					input.size="50"
					// 여기를 this를 이용하여 수정해주세요
// 					input.value = document.querySelector("#replyContent").value;
					// this를 이용해서 내가 원하는 노드 찾기
					input.value = obj.parentElement.previousElementSibling.childNodes[0].value;
// 					= input.value = obj.parentElement.previousElementSibling.childeren[0].value;
					input.name = "replyContent";
					form.appendChild(input2);
					form.appendChild(input3);
					form.appendChild(input);
					
					document.body.appendChild(form);
					form.submit();
				}
				function showReplyModifyForm(obj){
					// #1. HTML 태그, display:none 사용하는 방법
// 					document.querySelector(".replyModifyForm").style.display=""; 한 개만 출력
					obj.parentElement.parentElement.nextElementSibling.style.display=""; // html 이용



					// #2. DOM 프로그래밍을 이용하는 방법(Form 태그 넣기 전)
// // 					<tr style="display:none;">
// // 						<td colspan="3"><input type="text" size="50" value="${reply.replyContent }"></td>
// // 						<td><input type="button" value="완료"></td>
// // 					</tr>
// 					const trTag = document.createElement("tr");
// 					const tdTag1 = document.createElement("td");
// 					tdTag1.colSpan = 3;
// 					const inputTag1 = document.createElement("input");
// 					inputTag1.type = "text";
// 					inputTag1.size = 50;
// 					inputTag1.value = replyContent;
// 					tdTag1.appendChild(inputTag1);
// 					const tdTag2 = document.createElement("td");
// 					const inputTag2 = document.createElement("input");
// 					inputTag2.type = "button";
// 					inputTag2.value = "완료";
// 					tdTag2.appendChild(inputTag2);
// 					trTag.appendChild(tdTag1);
// 					trTag.appendChild(tdTag2);
// 					console.log(trTag);
// 					// 클릭한 a를 포함하고 있는 tr다음에 수정폼이 있는 tr추가하지
// 					const prevTrTag = obj.parentElement.parentElement;
// 					if(prevTrTag.nextElementSibling == null || !prevTrTag.nextElementSibling.querySelector("input"))
// 						prevTrTag.parentNode.insertBefore(trTag, prevTrTag.nextSibling );
				}
			</script>
	</body>
</html>