<%@ include file="common/header.jsp" %>
<%@ page import="java.sql.*" %>
<html>
    <div class="w3-container" style="overflow:auto;height:800px;font-family: Pridi;font-size: 20px" >
        <div class="w3-col" style="width: 10%">&nbsp;</div>
        <div class="w3-col" style="width: 80%">
            <form>
                <table>
                    <% String name1 = (String) session.getAttribute("uname");
                        String sname1 = new String();
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/login", "root", "");
                        Statement st = conn.createStatement();
                        ResultSet rs = st.executeQuery("select * from users where uname='" + name1 + "'");
                        if (rs.next()) {
                    %>
                    <tr><td>Welcome <%=rs.getString("fname")%> <%=rs.getString("lname")%></td></tr>
<!--                    <tr><td>Email : <%=rs.getString("email")%> </td></tr>
                    <tr><td>Username : <%=rs.getString("uname")%></td></tr>-->
                    <%
                        }
                    %>
                </table>
            </form>
            <br>
            <div class="w3-dropdown-click" style="width: 100%">
                <button class="w3-btn-block w3-green" onclick="myFunction22()" style="width: 100%;text-align: left;height: 50px">
                    Update Email ID&nbsp;<i class="fa fa-caret-down" style="align-content: right"></i>
                </button>
                <div id="demo22" class="w3-dropdown-content w3-bar-block w3-card-2" style="width: 78.3%">
                    <div class="w3-panel w3-green" style="height: 50px;width: 100%" onclick="myFunction11()" ><h4 class="w3-label" style="color: white;" >Update EmailID</h4></div>
                    <div class="w3-container" style="width: 100%">
                        <form class="w3-form" name="update_email" method="post" action="update_email.jsp" id="Demo11" class="w3-dropdown-content w3-card">
                            <input type="hidden" name="uname" value="<%=rs.getString("uname")%>">
                            <input class="w3-input" type="email" name="email" placeholder="Enter old Email ID" required>
                            <br><input class="w3-input" type="email" name="new_email" placeholder="Enter New Email ID" required>
                            <br><button class="w3-btn w3-green">Update Email</button>
                        </form>
                    </div>
                </div>
            </div><br><br>
            <div class="w3-dropdown-click" style="width: 100%;">
                <button class="w3-btn-block w3-blue" onclick="myFunction33()" style="width: 100%;text-align: left;height: 50px">
                    Update Password&nbsp;<i class="fa fa-caret-down"></i>
                </button>
                <div id="demo33" class="w3-dropdown-content w3-bar-block w3-card-2" style="width: 78.3%">
                    <div class="w3-panel w3-blue" style="height: 50px" onclick="myFunction11()" ><h4 class="w3-label" style="color: white">Update Password</h4></div>
                    <div class="w3-container" style="width: 100%">
                        <form class="w3-form" name="update_password" method="post" action="update_password.jsp" id="Demo11" class="w3-dropdown-content w3-card">
                            <input type="hidden" name="uname" value="<%=rs.getString("uname")%>">
                            <input class="w3-input" type="password" name="password" placeholder="Enter old Password" required>
                            <br><input class="w3-input" type="password" name="new_password" placeholder="Enter New Password" required>
                            <br><button class="w3-btn w3-blue">Update Password</button>
                        </form>
                    </div>
                </div>
            </div>
            

        </div>
        <br>
    </div>
    <div class="w3-col" style="width: 10%">&nbsp;</div>
    <script>
        function myFunction11() {
            document.getElementById("Demo11").classList.toggle("w3-show");
        }
    </script>
    <script>
        function myFunction12() {
            document.getElementById("Demo12").classList.toggle("w3-show");
        }
        function myFunction22() {
            var x = document.getElementById("demo22");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
        }
        function myFunction33() {
            var x = document.getElementById("demo33");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
        }
    </script>
</html>