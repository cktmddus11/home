  
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<script type="text/javascript">
	img = opener.document.getElementById("pic");
	img.src = "picture/${fname}"; <%-- img src ��� ���� --%>
	opener.document.f.picture.value = "${fname}"; <%-- hidden �� ����--%>
	self.close();
</script>