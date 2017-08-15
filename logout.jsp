<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged out</title>
    </head>
    <body>
        
        <%
            session.removeAttribute("uname");
            session.invalidate();
            out.println("Hi : "+session);
            request.setAttribute("errorMessage1", "Logout Succesful"); 
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward( request, response);
           
        %>

        <a href="login.jsp">LogIn</a>
    </body>
</html>