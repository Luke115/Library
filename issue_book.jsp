<%@include file="common/header.jsp" %>
<%@page import="java.sql.*,java.util.*"%>
<script type = "text/javascript" >
function disableBackButton()
{
window.history.forward();
}
setTimeout("disableBackButton()", 0);
</script>
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
                        <label> <%= rs.getString("designation")%> ID: <%= rs.getString("username").toUpperCase() %>
                            
                            <%
                            String user = rs.getString("username");
                            Connection conn1 = DriverManager.getConnection("jdbc:mysql://127.0.0.1/login", "root", "");
                            Statement st1 = conn1.createStatement();
                            String flag1 = "1";
                            ResultSet rs1 = st1.executeQuery("select * from transaction where userid='" +user+ "' and flag='"+flag1+"' ");
                            if (rs1.next()) {
                                //out.println("Hello");
                                String name1[] = new String[4];
                                name1[0] = rs1.getString("id0");
                                name1[1] = rs1.getString("id1");
                                name1[2] = rs1.getString("id2");
                                name1[3] = rs1.getString("id3");
                                
                                int i=0;
                                for(int j=0;j<4;j++)
                                {
                                    if(name1[j] == null || name1[j].equals(""))
                                    {
//                                        out.println("Hi");
                                    }
                                    else if(name1[j] != "" || name1[j]!= null)
                                    {
//                                        out.println(name1[j]);
//                                        out.println("Hello");
                                        i++;
                                    }
                                }
                                out.println("\n");%><br>
                                <% out.println("The Book Already Issued : "+i);  %>   
                                <br><br><label class="w3-label">Issue Book From Here.....</label>
                        <form class="w3-form" method="post" action="issue.jsp"><br><br>
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
                                <% }
                            else
                            { %>
                               <br><br><label class="w3-label">Issue Book From Here.....</label>
                        <form class="w3-form" method="post" action="issue.jsp"><br><br>
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
                            <% }
                            %>
                            
                            
                            
                                
                    
       <%
                        }
                else
                {
                    request.setAttribute("errorMessage", "Invalid User ID"); 
                    RequestDispatcher dispatcher = request.getRequestDispatcher("issuebook.jsp");
                    dispatcher.forward( request, response);
                }
                    %>