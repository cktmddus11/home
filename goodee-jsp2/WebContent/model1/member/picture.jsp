<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
String path = application.getRealPath("") + "/model1/member/picture";
String fname = null;
try{
	File f = new File(path);
	if(!f.exists()){ // ��ο� ������ �������� ������
		f.mkdirs(); // picture���� ����
	}
	MultipartRequest multi = new MultipartRequest(request, path, 10 *1024 * 1024, "euc-kr");
	fname = multi.getFilesystemName("picture"); // pictureForm name�Ӽ�picture�Ķ����
}catch(Exception e){
	e.printStackTrace();
}
%>
<%--
		1. ���� ���ε� - java ����
		------------�ڹٽ�ũ��Ʈ�� �Ʒ� �ΰ� ����-----
		2. opener ȭ�鿡 ��� ���� - client
		3. ���� ȭ�� close()  - client 
		
 --%>
<script type="text/javascript">
	img = opener.document.getElementById("pic");
	img.src = "picture/<%=fname%>"; <%-- img src ��� ���� --%>
	opener.document.f.picture.value = "<%=fname%>"; <%-- hidden �� ����--%>
	self.close();
</script>