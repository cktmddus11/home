<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

   <link rel ="stylesheet" type="text/css" href="../resources/css/part2.css">
    <link rel ="stylesheet" type="text/css" href="../resources/css/table.css">
</head>


 <%
   String contentPage2=request.getParameter("contentPage2");
   if( contentPage2 ==null)
         contentPage2="m_menubar.jsp";
%> 
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script language = "javascript">
   $(document).ready(function(){
      $("#update").click(function(){
         var id = $("#id").val();
         
         location.href="m_Update.jsp?num="+id;
      });
   });    
   
   /* 스크립트부분에 수정버튼을 눌렀을때 board_no라고 선언해주는 변수에 hidden타입의 board_no의 값을 담음 
   페이지를 이동할때 글 번호를 함게 전달해줌*/
   /*
   $(document).ready(function(){
         $("#delete").click(function(){
            var id = $("#id").val();
            location.href="m_delete.jsp?num="+id;
         });
      });   
  */
  $(document).ready(function(){
      $("#delete").click(function(){
        if(confirm("삭제 하시겠습니까?"))
        {
         var id = $("#id").val();
         location.href="m_delete.jsp?num="+id;
        }else
        {
           return;
        }
   }); 
   });
</script>

<body>
    <jsp:include page="<%=contentPage2 %>" />
<div id="funclog">
<% 
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
  
 try{
    int id;
    String confirm,layer, building, dept,lecturenum, lecturename, professor, start, end, yoil;

    int num= Integer.parseInt(request.getParameter("num")); 
    confirm= request.getParameter("use");
  
     
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection
    ("jdbc:mysql://localhost:3306/slip?useUnicode=true&characterEncoding=utf8","root","1234"); 
   if(conn==null){
   throw new Exception("데이터베이스 연결 실패");  }
   
   
  
      
        pstmt = conn.prepareStatement("select id, building, dept, layer, lecturenum, yoil, lecturename, professor, str_to_date(start, '%H%i%s'), str_to_date(end, '%H%i%s'), start, end from test where id="+num);
        rs = pstmt.executeQuery();
      
       
       while(rs.next()){
           id = rs.getInt("id"); 
           building = rs.getString("building"); 
           dept = rs.getString("dept");
           layer=rs.getString("layer");
           lecturenum = rs.getString("lecturenum");
           yoil = rs.getString("yoil"); 
           lecturename = rs.getString("lecturename");
           professor=rs.getString("professor");
           String start1 = rs.getString("str_to_date(start, '%H%i%s')");
           String end1 = rs.getString("str_to_date(end, '%H%i%s')");
           start = rs.getString("start");
           end = rs.getString("end");
            
        /* out.println("건물:"+building+"학과:"+dept+"강의실:"+lecturenum+"강의명"+lecturename+"시작시간:"+start+"종료시간"+end); */
         
        String color = "#65a965";
        if(confirm == "n")color="#ed6363;";
         
 %>
 
     <div class="container">
      <div class="boardcss_list_table">
        <div class="boardcss_list_table">
     	<table class="list_table">
         <tr>
                <th>번호</th>
                <td> <%=id %></td>
         </tr>
         <tr>       
            <th>건물명</th>
            <td> <%=building  %></td>
      </tr>      
      <tr>
            <th>학과</th>
            <td> <%=dept %></td>
      </tr>
      <tr>
            <th>층 수</th>
            <td> <%=layer %></td>
      </tr>
      <tr>
            <th>호 수</th>
             <td> <%=lecturenum %></td> 
            
      </tr>
      <tr>
            <th>요일</th>
            <td> <%=yoil  %></td>
      </tr>      
      <tr>
            <th>강의명</th>
             <td> <%=lecturename %></td>
      </tr>
      <tr>
            <th>교 수</th>
            <td> <%=professor %></td>
      </tr>
      <tr>
            <th>시작시간</th>
             <td> <%=start1 %></td>
      </tr>      
      <tr>
            <th>종료시간</th>
            <td> <%=end1 %></td>
      </tr>
      <tr>      
            <th>사용여부</th>
            <td style="background-color:<%=color%>"> <%=confirm %></td>
         </tr> 
            
      <% 
       }
      
        rs.close();
        conn.close();
        pstmt.close();
     
    
     %>
    </table>
    <input type="hidden" id="id" value="<%=num%>"> 
    <br>
    
    
    <%

    } catch(Exception e){
        out.println(e);
    } 

     %>
    
          
      <tr>
       <div class="btnDiv">
          <input type="button" id="update" value="수정">
          <input type="button" id="delete" value="삭제" OnClick='javascript:showConfirm();'> 
        <input type="submit" value="이전 목록" onclick='history.go(-1); return false;'>
        <input type="submit" value="처음으로" onclick="javascript:location.href='m_list.jsp'">
        
          </div>
       </tr>  
    
   
   
   
   
</div>   
</div>
</body>
</html>