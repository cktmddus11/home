<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<%--
1. num 파라미터 정보를 변수에 저장. 
2. num을 이용하여 db에서 게시물 정보를 조회
	Board b = new BoardDao.selectOne(num)
3. 조회수 증가시키키
	void BoardDao.readcntadd(num)
4. 2번에서 조회된 게시물 화면에 출력
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 상세 보기</title>
<script>
	function check(){
		var con_test = confirm("정말로 삭제하시겠습니까?");
		if(con_test == true){
		  location.href="delete.do1?num=${b.num}"
		  return true;
		}
		else if(con_test == false){
		  return false;
		}
	}
	function check2(){
		if(commentform.comment.value == ""){
			alert("댓글내용을 작성해주세요");
			return false;
		}
	}
	function formsubmit(){
		upform.submit();
	}
	function commentdelete(){
		$.ajax({
			url : "${path}/board/commentdelete.do1",
			type : "POST",
			data : {
				comment_num : $('input[name=comment_num]').val(),
			},success : function(data){
				alert(data)
				location.reload();
			}
		})
	}
</script>
</head>
<body>
	<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 자유게시판
		</div>
		<div class="card-body">
			<table class="w3-table-all">
				<tr>
					<th width="20%">닉네임</th>
					<td width="80%" style="text-align: left">${b.nickname}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td style="text-align: left">${b.title}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><table style="width: 100%; height: 250px;">
							<td style="border-width: 0px; vertical-align: top; text-align: left">
								<%--  <c:out value="${b.content}"/> --%> ${b.content}
							</td>
						</table></td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><c:if test="${empty b.file}">
			&nbsp;
			</c:if> <c:if test="${!empty b.file}">
							<a href="file/${b.file}" download>${b.file}</a>
						</c:if></td>
				</tr>
				<tr>
				<td colspan="2" style="text-align : right">
				<c:if test="${sessionScope.login == b.mem_id}">
					<button onclick="location.href='updateForm.do1?num=${b.num}'">수정</button>
					<button onclick="return check()">삭제</button>
				</c:if>	
				
					<button onclick="location.href='${path}/board/list.do1'">목록</button>
					</td>
				</tr>
				<tr>
					<td colspan="2">
					<form method="post" action="up.do1" name="upform">
						<input type='hidden' name="num" value="${b.num}">
						<p style="margin-bottom: 0px; text-align : center;"><a href="#" onclick="formsubmit()"><i class="far fa-thumbs-up"
						style="font-size : 19px;">추천</i>&nbsp;${upcnt}</a>
					</form>
					</td>
				</tr>
			</table>
			<br><br>
			<form name="commentform" action="commentinsert.do1" method="post">
			<table class="w3-table-all">
				<input type="hidden" name="comment_id" value="${mem.mem_id}">
				<input type="hidden" name="num" value="${param.num}">
				<tr>
					<td style="background-color : #f1f1f1;  text-align : center;   vertical-align: middle;">댓글</td>
					<td><textarea name="comment" rows="5" style="width:100%"></textarea>
					<td><button style='width: 100%;height: 120px; '
					onclick = "check2()">댓글작성</button></td>
				</tr>
			</table>
			</form>
			
			<table class="w3-table-all">
			<c:if test="${!empty list}">
				<c:forEach var = "list" items="${list}">
				<tr>
					<td>${list.nickname}</td>
					<td>${list.content}</td>
					<td style="text-align : right">${list.comment_date}</td>
					<td>
					<input type="hidden" name="comment_num" value="${list.comment_num}">
					<c:if test="${mem.mem_id eq list.comment_id}">
					<a href="#" onclick = "commentdelete()">삭제</a>
					</c:if>
					</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list}">
				<tr>
					<td>작성된 댓글 없습니다</td>
				</tr>
			</c:if>
			</table>
			
			
		</div>
		<div class="card-footer small text-muted">자유로운 글쓰기</div>
	</div>

</body>
</html>