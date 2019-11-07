<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%--
	3. ȭ�鿡 ���. 
		- �Խù� ��� �κ�
		- ������ ���� ��� �κ�
	
 --%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ� ��� ����</title>
<link rel = "stylesheet" href="../../css/main.css">
<script>
	function listdo(page){
		document.sf.pageNum.value = page;
		document.sf.submit(); //������ ������ �˻�â �Ķ���� ����
	}
</script>
</head>
<body>
<form action="list.do" method="post" name="sf">
	<input type="hidden" name="pageNum" value="1">
	<table>
		<tr>
			<td style="border-width : 0px;">
			<select name="column">
				<option value="">�����ϼ���</option>
				<option value="subject">����</option>
				<option value="name">�ۼ���</option>
				<option value="content">����</option>
				<option value="subject,content">���� + ����</option>
				<option value="name,content">�ۼ��� + ����</option>				
			</select> 
			<script type="text/javascript">document.sf.column.value = "${param.column}";</script>
			<input type="text" name="find" value="${param.find}" style="width:50%;">
			<input type="submit" value="�˻�"></td>
		</tr>
	</table>
</form>


	<table>
		<caption>�Խ��� ���</caption>
		<c:if test="${boardcnt == 0 }">
			<tr>
				<td colspan="5">��ϵ� �Խñ��� �����ϴ�.</td>
			</tr>
		</c:if>
		<c:if test="${boardcnt > 0 }">
			<tr>
				<td colspan="5" style="text-align : right"> �� ���� : ${boardcnt} </td>
			</tr>
			<tr>
				<th width="8%">��ȣ</th>
				<th width="50%">����</th>
				<th width="14%">�ۼ���</th>
				<th width="17%">�����</th>
				<th width="11%">��ȸ��</th>			
			</tr>
			<c:forEach var="b" items="${list}">
				<tr>
				<%-- 	<td><%=b.getNum() %></td> --%>
					<td>${boardnum}</td>
					<c:set var="boardnum" value="${boardnum - 1}" />
					<td style="text-align : left">
					<!--  ÷������ ǥ�� -->
					<c:if test="${!empty b.file1}">
						<a href="file/${b.file1}" style="text-decoration: none;">@</a>
					</c:if>
					<c:if test="${empty b.file1}">
						&nbsp;&nbsp;&nbsp;
					</c:if>
					<!--  ��� ǥ���ϱ� -->
					<c:if test="${b.grplevel > 0}">
						<c:forEach begin="1" end="${b.grplevel}">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</c:forEach>��
					</c:if>                            <!--  EL�� ���°� property������ (get �Ⱦ��ٴ°�) -->
					<a href="info.do?num=${b.num}">${b.subject}</a></td>
					<td>${b.name}</td>
					
					<c:set var="today" value="<%=new java.util.Date() %>"></c:set>
					<fmt:formatDate value = "${today}" pattern="yy-MM-dd"  var="today2"/>
					<fmt:formatDate value ="${b.regdate}" pattern="yy-MM-dd"  var="regdate"/>
					<td>
					<c:if test="${today2 == regdate}">
					  <fmt:formatDate value = "${b.regdate}" pattern="HH:mm:ss"  var="r"/>	
						 	${r}
					</c:if>			<!--  ���Ʒ� ������ �޶���� �Ʒ� IF�� �� ����ȵǳ� -->
					<c:if test="${today2 != regdate}">
						<fmt:formatDate value = "${b.regdate}" pattern="yy-MM-dd HH:mm"  var="regdate"/>
						${regdate}
					</c:if>
					</td>
					
					
					
					<td>${b.readcnt}</td>
				</tr>
			</c:forEach>
				<tr>
					<td colspan="5">
								<!-- ���� -->
						<c:if test="${pageNum <= 1}">
							[����]
						</c:if>
						<c:if test="${pageNum > 1}">
							<a href="javascript:listdo(${pageNum-1})">[����]</a>
						</c:if>
						<!-- ��ȣ-->
						<c:forEach begin="${startpage}" end="${endpage}" var="a">
								<c:if test="${a == pageNum }">
									[${a}] 
								</c:if>
								<c:if test="${a != pageNum }">
									<a href="javascript:listdo(${a})">[${a}]</a>
								</c:if>
						</c:forEach>
						<!-- ���� -->
						<c:if test="${pageNum >= maxpage}">
							[����]
						</c:if>
						<c:if test="${pageNum < maxpage}">
							<a href="javascript:listdo(${pageNum + 1})">[����]</a>
						</c:if>
					</td>
				</tr> 
		</c:if>
		<tr><td colspan="5" style="text-align : right">
			<a href="writeForm.do">[�۾���]</a></td>
		</tr>
	</table>


</body>
</html>