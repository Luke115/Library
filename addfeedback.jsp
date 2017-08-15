<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
    <head>
        <title>INSERT Operation</title>
    </head>
    <body>
        <c:if test="${ empty param.fname or empty param.lname}">
            <c:redirect url="contactus.jsp" >
                <c:param name="errMsg" value="Please Enter Valid Details" />
            </c:redirect>

        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://127.0.0.1/login"
                           user="root"  password=""/>


        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO feedback(fname,lname,email,phone,message) VALUES (?,?,?,?,?);
            <sql:param value="${param.fname}" />
            <sql:param value="${param.lname}" />
            <sql:param value="${param.email}" />
            <sql:param value="${param.phone}" />
            <sql:param value="${param.message}" />

        </sql:update>
        <c:if test="${result>=1}">
            <font size="5" color='green'> Congratulations ! Send
			successfully.</font>

            <c:redirect url="contactus.jsp" >
                <c:param name="susMsg" value="Congratulations ! Feedback Submitted
			successfully." />
            </c:redirect>
        </c:if>
    </body>
</html>