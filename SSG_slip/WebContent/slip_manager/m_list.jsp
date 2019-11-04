<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link rel ="stylesheet" type="text/css" href="../resources/css/table.css">
 <link rel ="stylesheet" type="text/css" href="../resources/css/part2.css">
   <%
   String contentPage=request.getParameter("contentPage");
   if( contentPage ==null)
         contentPage="m_search_form.jsp";
%> 

 <%
   String contentPage2=request.getParameter("contentPage2");
   if( contentPage2 ==null)
         contentPage2="m_menubar.jsp";
%> 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
   	   <script>
   	      $(function(){
   	      	var pull=$('#pull');
   	      	    menu=$('nav ul');
   	      	    menuHeight=menu.height();   	      
   	      $(pull).on('click', function(e){
   	      	e.preventDefault();
   	      	menu.slideToggle();   	      	
   	      });
   	      $(window).resize(function(){
   	      	var w=$(window).width();
   	      	if(w>600 && menu.is(':hidden'))
   	      		{menu.removeAttr('part');}   });
   	   	  });
   	   
 </script>
</head>
<body>
<jsp:include page="<%=contentPage2 %>" />	
<div id="funclog">
	  <div class="boardcss_list_table">
	  	<table class="list_table">
	  	<caption></caption>
      	<colgroup>
      		<col width="5%" />
			<col width="10%" />
			<col width="10%" />
			<col width="5%" />
			<col width="5%" />
      	</colgroup>
      	<thead>
         <tr>
            	<th>번호</th>
				<th>건물명</th>
				<th>학과</th>
				<th>층 수</th>
				<th>호 수</th>
		</tr>
		</thead>	
<% 
Connection conn = null;
PreparedStatement stmt = null;
PreparedStatement pstmt = null;
ResultSet rs0 = null;
ResultSet rs = null;
  
 try{
    int id;
    String layer, building, dept,lecturenum;
    int datacount=0; 
    int pagecount;

    
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/slip?useUnicode=true&characterEncoding=utf8","root","1234"); 
   if(conn==null){
   throw new Exception("데이터베이스 연결 실패");  }
   
   stmt = conn.prepareStatement("select count(distinct lecturenum) from test");
   rs0 = stmt.executeQuery();


     if(rs0.next()){
       datacount=rs0.getInt(1);
       rs0.close(); 
     }
     
    int pagesize=10; 
    pagecount = datacount/(pagesize+1)+1; 
    int mypage=1; 
    int abpage=1; 
   
    if(request.getParameter("mypage") !=null){
       mypage = Integer.parseInt(request.getParameter("mypage")); 
       abpage = (mypage-1)*pagesize;
       if(abpage<=0) abpage=1; 
        }
      
        pstmt = conn.prepareStatement("select id, building, dept, layer, lecturenum from test group by lecturenum  order by id desc");
        rs = pstmt.executeQuery();
        
        if(!rs.next()){
            pagesize=0; 
         } else{
            rs.absolute(abpage); 
         } 
       
        for(int k=1; k<=pagesize; k++) {
           id = rs.getInt("id"); 
            building = rs.getString("building"); 
            dept = rs.getString("dept");
            layer=rs.getString("layer");
            lecturenum = rs.getString("lecturenum");
            
        /* out.println("건물:"+building+"학과:"+dept+"강의실:"+lecturenum+"강의명"+lecturename+"시작시간:"+start+"종료시간"+end); */
         
        
         
 %>
        <tbody>
         <tr>
            <td> <%=id %></td>
				<td> <%=building  %></td>
				<td> <%=dept %></td>
				<td> <%=layer %></td>
				<td> <a href="m_Detail.jsp?num=<%=lecturenum%>"><%=lecturenum %></a></td>
				
         </tr>
      </tbody>
      <% 
      if(rs.getRow()==datacount){
          break; 
        }else{
         rs.next(); 
        }
            }
      
        rs.close();
        conn.close();
        stmt.close();
        pstmt.close();
     
    
     %>
    </table><br>
   
    <%

       if(pagecount != 1) {
              for(int l=1; l<=pagecount; l++){
       out.println("<a href=m_list.jsp?mypage=" + l+ ">"+ l + "|</a>");
         }
      }
      else{
         out.println("1"); 
      }
    } catch(Exception e){
        out.println(e);
    } 

     %>
      <jsp:include page="<%=contentPage%>" />
       <input type="button" id="insert" value="추가" onclick="javascript:location.href='m_insert_form.jsp'">
       
</div>
</div>
</body>
</html>