<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://127.0.0.1/login"
                           user="root"  password=""/>
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE users SET email = ?
            WHERE uname='${param.uname}'
            <sql:param value="${param.new_email}" />
        </sql:update>
        <c:if test="${count>=1}">
             <% response.sendRedirect("profile.jsp?Email Changed Succesfully"); %>          
        </c:if>
    </body>
</html>