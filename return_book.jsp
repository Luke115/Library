<%@include file="common/header.jsp" %>
<%@page import="java.sql.*,java.util.*"%>
<div class="w3-container">
    <div class="w3-col" style="width: 10%">&nbsp;</div>
    <div class="w3-col" style="width: 80%">
        <%  String userid=request.getParameter("userid"); %>
<!--        <label class="w3-label"><% out.println("Welcome : "+userid);%></label>-->
        <% Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/login", "root", "");
                        Statement st = conn.createStatement();
                        ResultSet rs = st.executeQuery("select * from new_table where username='" + userid + "'");
                        if (rs.next()) {
                    %>
                    <h3 class="w3-text"><center><u>Welcome To Charusat Library Website</u></center></h3>
                    <br><br><label> Name :  <%= rs.getString("first_name")%> 
                        <%= rs.getString("last_name") %></label><br>
                        <label> Registration No: <%= rs.getString("username").toUpperCase() %>
                            
                                
                            
                            
               
                    <br><br><label class="w3-label">Issue Book From Here.....</label>
                    <form class="w3-form" method="post" action="return.jsp"><br><br>
                        <input type="hidden" name="userid" value="<%= rs.getString("username") %>">
                        <input type="hidden" name="email" value="<%= rs.getString("email") %>">
                        <input class="w3-input" name="bookname1" placeholder="Enter ID of Book1" required><br>
                        <input class="w3-input" name="bookname2" placeholder="Enter ID of Book2" ><br>
                        <input class="w3-input" name="bookname3" placeholder="Enter ID of Book3" ><br>
                        <input class="w3-input" name="bookname4" placeholder="Enter ID of Book4" ><br>
                        <input type="hidden" name="flag" value="1">
                        <button class="w3-btn w3-blue" type="submit">Issue Book</button>
                    </form>    
    </div>
    <div class="w3-col" style="width: 10%">&nbsp;</div>
</div>
<%
      }
    else
    {
        request.setAttribute("errorMessage", "Invalid User ID"); 
        RequestDispatcher dispatcher = request.getRequestDispatcher("returnbook.jsp");
        dispatcher.forward( request, response);
    }
%>