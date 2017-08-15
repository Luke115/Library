<%@ page import="java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@ include file="common/header.jsp" %>
<br><br><br><br><br>
<div class="container" style="font-family:Pridi">
    <div style="width: 9%" class="w3-col w3-white">&nbsp;</div>
        <div class="w3-col w3-white w3-card w3-card w3-border-0" style="width: 80%">
            <center>
            <div class="w3-container w3-card w3-hover-shadow" style="width: 450px">
                <center><h3 style="font-family: Pridi">Log In</h3>
                    <br>
                    <form class="w3-container" method="post" action="checkuser.jsp">
                        <h4><label style="float: left;font-family:Pridi">&nbsp;Username</label></h4>
                        <input class="w3-input" name="uname" type="text" placeholder="Enter Username" required>
                        <br>
                        <h4><label style="float:left;font-family:Pridi">&nbsp;Password</label></h4>
                        <input class="w3-input" name="password" type="password" placeholder="Enter Username" required>
                        <br><br>
                        <button class="w3-btn w3-block w3-large" type="submit">Log In</button>
                        <br>
                        <br><br>
                    </form>
                </center>
            </div><br>
            
                        <%
                        if(null!=request.getAttribute("errorMessage"))
                        { %>
                        <div class="w3-card w3-white w3-border-0 w3-pale-red" style="height: 60px;width: 450px">
                        <h4 style="color:red;padding-top: 15px;">
                        <% 
                            out.println(request.getAttribute("errorMessage"));
                        %>
                        </h4></div>
                        <%    
                        }
                        else if(null!=request.getAttribute("errorMessage1"))
                        { %>
                        <div class="w3-card w3-white w3-border-0 w3-pale-green" style="height: 60px;width: 450px">
                        <h4 style="color:green;padding-top: 15px;">
                        <%
                            out.println(request.getAttribute("errorMessage1"));
                        %>
                        </h4></div>
                        <%    
                        }
                        %>
            </center>
        </div> 
    <div style="width: 11%" class="w3-col">&nbsp;</div>
</div>
<script

