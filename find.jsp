<%@ page import="java.sql.*" %>  
<br>
<%  
String bookname=request.getParameter("val");  
if(bookname==null||bookname.trim().equals("")){  
out.print("<h4 style='font-family:Pridi'>Please Enter Book name !!</h4>");  
}else{  
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://127.0.0.1/login","root","");  
PreparedStatement ps=con.prepareStatement("select * from books where bookname like '"+bookname+"%' or authorname like '"+bookname+"%'");  
ResultSet rs=ps.executeQuery();  
  
if(!rs.isBeforeFirst()) {      
 out.println("<h3 style='font-family:Pridi>No Book Found!</h3>");   
}else{  
out.print("<div class='w3-container'>");
out.print("<h3 style='font-family:Pridi'>Available Books : </h3>");
while(rs.next()){  out.print("<div class='w3-card w3-panel w3-hover-shadow w3-pale-blue w3-leftbar w3-rightbar w3-border-blue w3-'>");  
    out.print("<h5 style='margin:20px;font-family:Pridi'>  Book Name : "+rs.getString(2)+"<br>  Author Name : "+rs.getString(3)+"<br>    Available Copies : "+rs.getString(4)+"<br>   Category : "+rs.getString(5)+"<br>   Publication Name : "+rs.getString(7)+"</h5>");  
    out.print("</div>");  
}  
out.print("</div>");  
}//end of else for rs.isBeforeFirst  
con.close();  
}catch(Exception e){out.print(e);}  
}//end of else  
%>  