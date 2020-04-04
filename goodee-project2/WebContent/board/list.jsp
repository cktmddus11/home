<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ��� ����</title>
<script>
	function listdo(page){
		document.sf.pageNum.value = page;
		document.sf.submit(); //������ ������ �˻�â �Ķ���� ����
	}
</script>
</head>
<body>
	
<div class="card mb-3" id="board">
		<div class="card-header">
			<i class="fas fa-chart-area"></i> �����Խ���
		</div>
		<div class="card-body">
		<form action="list.do1" method="post" name="sf">
		<input type="hidden" name="id" value="${param.id}">
		<input type="hidden" name="pageNum" value="1">
		<table>
			<tr>
				<td style="border-width: 0px;"><select name="column">
						<option value="">�����ϼ���</option>
						<option value="title">����</option>
						<option value="content">����</option>
						<option value="title,content">���� + ����</option>
				</select> <script type="text/javascript">document.sf.column.value = "${param.column}";</script>
					<input type="text" name="find" value="${param.find}"
					style="width: 50%;"> <input type="submit" value="�˻�"></td>
			</tr>
		</table>
	</form>
	<br>

	<table class="w3-table-all">
		<c:if test="${boardcnt == 0 }">
			<tr>
				<td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td>
			</tr>
		</c:if>
		<c:if test="${boardcnt > 0 }">
			<tr>
				<td colspan="5" style="text-align: right">�� ���� : ${boardcnt}</td>
			</tr>
			<tr>
				<th width="8%">��ȣ</th>
				<th width="50%">����</th>
				<th width="14%">�г���</th>
				<th width="17%">�����</th>
				<th width="11%">��ȸ��</th>
			</tr>
			<c:forEach var="b" items="${list}">
				<tr>
					<%-- 	<td><%=b.getNum() %></td> --%>
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum - 1}" />
					<td style="text-align: left">
						<!--  ÷������ ǥ�� --> <c:if test="${!empty b.file}">
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
					</c:if> <!--  ���Ʒ� ������ �޶���� �Ʒ� IF�� �� ����ȵǳ� --> <c:if
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
					<!-- ���� --> 
					<c:if test="${pageNum <= 1}">
							[����]
						</c:if> <c:if test="${pageNum > 1}">
						<a href="javascript:listdo(${pageNum-1})" >[����]</a>
					</c:if> 
					<!-- ��ȣ--> 
					<c:forEach begin="${startpage}" end="${endpage}" var="a">
						<c:if test="${a == pageNum }">
									[${a}]
								</c:if>
						<c:if test="${a != pageNum }">
							<a href="javascript:listdo(${a})">[${a}]</a>
						</c:if>
					</c:forEach> <!-- ���� --> 
						<c:if test="${pageNum >= maxpage}">
							[����]
						</c:if> 
						<c:if test="${pageNum < maxpage}">
						<a href="javascript:listdo(${pageNum + 1})">[����]</a>
					</c:if>
				</td>
				
			</tr>
		</c:if>
		<tr>
			<td colspan="5" style="text-align: right"><button onclick="location.href='${path}/board/writeForm.do1'">�۾���</button></td>
		</tr>
	</table>
		</div>
		<div class="card-footer small text-muted">�����ο� �۾���</div>
	</div>

</body>
</html>