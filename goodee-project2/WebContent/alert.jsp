<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/model2/alert.jsp --%>    
<script>
	if(${msg != null}){
	   alert("${msg}");
	}
   location.href="${url}";
</script>