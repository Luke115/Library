<%@page import ="java.sql.*" %>
<%@page import ="java.io.IOException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@page import="java.io.*"%>  
<%
        String uname = request.getParameter("uname");
        String password = request.getParameter("password");
        String driver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql://127.0.0.1/login";
        String dbuser = "root";
        String dbpassword = "";
        Connection theConnection = null;
        PreparedStatement theStatement = null;


            try{  
                Class.forName(driver);
                theConnection=DriverManager.getConnection(dbURL,dbuser,dbpassword);  
                theStatement = theConnection.prepareStatement("select * from users where uname=? and password=?");
                theStatement.setString(1,request.getParameter("uname"));
                theStatement.setString(2,request.getParameter("password"));
                ResultSet theResult = theStatement.executeQuery();

                if(theResult.next())
                {
                    System.out.println("Success"); 
                    String name = request.getParameter("uname");  
                    out.print("Welcome "+name);  
                    session.setAttribute("uname",name);
                    String sname = new String();
                    sname = "admin";
                    if(name.equals(sname))
                    {
                        response.sendRedirect("admin/index.jsp");
                    }
                    else
                    {
//                    
                    response.sendRedirect("index.jsp");
                    }
                }
                        
                else
                {
                    request.setAttribute("errorMessage", "Invalid username or password"); 
                    RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                    dispatcher.forward( request, response);
//                    System.out.println("Failed");
//                    response.sendRedirect("login.jsp");
                }
                
                }catch(Exception e){
                    System.out.println("Exception occured! "+e.getMessage()+" "+e.getStackTrace());
                    response.sendRedirect("login.jsp");
                }  
        %>