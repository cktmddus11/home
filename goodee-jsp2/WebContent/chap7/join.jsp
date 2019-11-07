<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="./css/main.css">
<title></title>
</head>
<body>
<!-- 입력된 내용을 join.jsp 에 출력하기 
단 1. useBean, setProperty 를 이용하기
2. Bean클래스의 이름은 chap7.Member -->
	<% request.setCharacterEncoding("euc-kr"); %>
	<jsp:useBean id="member" class="chap7.Member" scope="page"/>
	<!--  id : jsp 페이지 에서 자바빈 객체에 접근할 때 사용하는 이름이다. 
	class : 패키지 이름을 포함한 자바빈 클래스의 완전한 이름 입력
	scope : 자바빈 객체가 저장될 영역을 지정. 
	page pageContext 기본객체
	, request request 기본객체 
	, session session 기본객체, 
	application application 기본객체 중 하나의 
	값으로 갖는다. 기본값은 page  -->
	
	<!-- 
	Member member = (Member)request.getAttribute("member");
	if(member == null){
		member = new Member();
		request.setAttribute("member", member);
	}
	태그에서 id속성에서 지정한 이름의 속성값이 있을 경우  
	그 객체를 그대로사용하고 없으면 새로운 객체를 생성한다. 
	 -->
	<jsp:setProperty name="member" property="*" />
	<%--   name : 프로퍼티에 값을 변경할 자바빈 객체의 이름
	<jsp:useBean> 액션태그의 id 속성에서 지정한 값을 사용
	property : 값을 지정할 프로퍼티의 이름 
	value : 프로퍼티의 값 표현식 가능  
	property 속성의 값을 * 로 지정할 수 있음. 이럴 경우 각각의 
	프로퍼티의 값을 같은 이름을 같는 파라미터의 값으로 설정한다. 
	
	tel 파라미터의 값을  tel프로퍼티의 값으로 지정
	private String id;
	private String password;
	private int gender;
	private int age;
	private String email; --> --%>
	
	<jsp:setProperty name="member" property="password" param="pass"/>
	<table border="1" style="border-collapse:collapse;">
		<tr>
			<th>아이디 </th>
			<td><jsp:getProperty name="member" property="id"/></td>
		</tr>
		<tr>
			<th>비밀번호 </th>
			<td><jsp:getProperty name="member" property="password"/></td>
		</tr>
		<tr>
			<th>성별 </th>
			<td><jsp:getProperty name="member" property="gender2"/></td>
		</tr>
		<tr>
			<th>나이 </th>
			<td><jsp:getProperty name="member" property="age"/></td>
		</tr>
		<tr>
			<th>이메일 </th>
			<td><jsp:getProperty name="member" property="email"/></td>
		</tr>
		
	</table>

	
</body>
</html>