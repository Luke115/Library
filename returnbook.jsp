<%@include file="common/header.jsp" %>
<br><br>
<div class="w3-container">
    <div class="w3-col" style="width: 10%">&nbsp;</div>
    <div class="w3-col" style="width: 80%">
        <form method="post" action="return_book.jsp">
            <input type="text"  class="w3-input" name="userid" placeholder="Enter UserID Here...">
            <br>
            <input type="submit" value="Submit" class="w3-btn w3-blue">
            <br><br>
            <%
                        if(null!=request.getAttribute("errorMessage"))
                        { %>
                        <div class="w3-card w3-white w3-border-0 w3-pale-red" style="height: 60px;width: 450px">
                        <h4 style="color:red;padding-top: 15px;text-align: center">
                        <% 
                            out.println(request.getAttribute("errorMessage"));
                        %>
                        </h4></div>
                        <%    
                        }
                        else if(null!=request.getAttribute("errorMessage1"))
                        { %>
                        <div class="w3-card w3-white w3-border-0 w3-pale-green" style="height: 60px;width: 450px">
                        <h4 style="color:green;padding-top: 15px;text-align: center">
                        <%
                            out.println(request.getAttribute("errorMessage1"));
                        %>
                        </h4></div>
                        <%    
                        }
                        %>
</form>
    </div>
    <div class="w3-col" style="width: 10%">&nbsp;</div>
</div>