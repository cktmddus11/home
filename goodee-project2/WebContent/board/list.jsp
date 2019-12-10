<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 목록 보기</title>
<script>
	function listdo(page){
		document.sf.pageNum.value = page;
		document.sf.submit(); //페이지 눌러도 검색창 파라미터 유지
	}
</script>
</head>
<body>
	
<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> 자유게시판
		</div>
		<div class="card-body">
		<form action="list.do1" method="post" name="sf">
		<input type="hidden" name="id" value="${param.id}">
		<input type="hidden" name="pageNum" value="1">
		<table>
			<tr>
				<td style="border-width: 0px;"><select name="column">
						<option value="">선택하세요</option>
						<option value="title">제목</option>
						<option value="content">내용</option>
						<option value="title,content">제목 + 내용</option>
				</select> <script type="text/javascript">document.sf.column.value = "${param.column}";</script>
					<input type="text" name="find" value="${param.find}"
					style="width: 50%;"> <input type="submit" value="검색"></td>
			</tr>
		</table>
	</form>
	<br>

	<table class="w3-table-all">
		<c:if test="${boardcnt == 0 }">
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${boardcnt > 0 }">
			<tr>
				<td colspan="5" style="text-align: right">글 개수 : ${boardcnt}</td>
			</tr>
			<tr>
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="14%">닉네임</th>
				<th width="17%">등록일</th>
				<th width="11%">조회수</th>
			</tr>
			<c:forEach var="b" items="${list}">
				<tr>
					<%-- 	<td><%=b.getNum() %></td> --%>
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum - 1}" />
					<td style="text-align: left">
						<!--  첨부파일 표시 --> <c:if test="${!empty b.file}">
							<a href="file/${b.file}" style="text-decoration: none;"><i class="fas fa-file"></i></a>
						</c:if> <c:if test="${empty b.file}">
						&nbsp;&nbsp;&nbsp;
					</c:if> 
					 <a href="${path}/board/info.do1?num=${b.num}">${b.title}</a>
					</td>
					<td>${b.nickname}</td>

					<c:set var="today" value="<%=new java.util.Date() %>"></c:set>
					<fmt:formatDate value="${today}" pattern="yy-MM-dd" var="today2" />
					<fmt:formatDate value="${b.regdate}" pattern="yy-MM-dd"
						var="regdate" />
					<td><c:if test="${today2 == regdate}">
							<fmt:formatDate value="${b.regdate}" pattern="HH:mm:ss" var="r" />	
						 	${r}
					</c:if> <!--  위아래 변수가 달라야지 아래 IF문 또 실행안되네 --> <c:if
							test="${today2 != regdate}">
							<fmt:formatDate value="${b.regdate}" pattern="yy-MM-dd HH:mm"
								var="regdate" />
						${regdate}
					</c:if></td>
					<td>${b.readcnt}</td>
				</tr>
			</c:forEach>

			<tr>
				<td colspan="5" style="text-align : center">
					<!-- 이전 --> 
					<c:if test="${pageNum <= 1}">
							[이전]
						</c:if> <c:if test="${pageNum > 1}">
						<a href="javascript:listdo(${pageNum-1})" >[이전]</a>
					</c:if> 
					<!-- 번호--> 
					<c:forEach begin="${startpage}" end="${endpage}" var="a">
						<c:if test="${a == pageNum }">
									[${a}]
								</c:if>
						<c:if test="${a != pageNum }">
							<a href="javascript:listdo(${a})">[${a}]</a>
						</c:if>
					</c:forEach> <!-- 다음 --> 
						<c:if test="${pageNum >= maxpage}">
							[다음]
						</c:if> 
						<c:if test="${pageNum < maxpage}">
						<a href="javascript:listdo(${pageNum + 1})">[다음]</a>
					</c:if>
				</td>
				
			</tr>
		</c:if>
		<tr>
			<td colspan="5" style="text-align: right"><button onclick="location.href='${path}/board/writeForm.do1'">글쓰기</button></td>
		</tr>
	</table>
		</div>
		<div class="card-footer small text-muted">자유로운 글쓰기</div>
	</div>

</body>
</html>