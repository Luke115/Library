<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ include file="common/header.jsp" %>
<br><br>
<div class="se-pre-con"></div>
<div class="w3-col" style="width:10%">&nbsp;</div>
<div class="w3-col w3-card w3-border-0" style="width: 80%">
    <center><h4 style="text-align: center"><b>Who are We ?</b></h4></center>
    <h4>We are Charusat Library Who provide the Services of the Knowledge Resource Center In this College. With this 
    we provide facility of the no. of magazines to read and explore the Knowledge of the World. The Library the Place of peace 
    we are providing the easy and efficient search or medium for exploration of knowledge and value your time. We care about your
    time and curiosity related to the Knowledge so by this student get interacted with the world with better way. World is  place 
    of the knowledge where the student have to explore with world's technology and compitite with the World to achieve goal in life.
    </h4><br><br>
</div>
<div class="w3-col" style="width: 10%">&nbsp;</div>
<br><br><br>    
<div class="w3-container">
<div class="w3-col" style="width: 10%">&nbsp;</div>
<div class="w3-col" style="width: 80%">
    <div class="w3-panel">
        <h4><center><b>Testimonials</b></center></h4>
    </div>
    <div class="w3-panel">
        <div class="w3-content" style="max-width:1000px">
            
            <div class="container">
            <div class="w3-col" style="width: 10%">
                <br><br>
                <button class="w3-button " onclick="plusDivs(-1)">&#10094;</button>
            </div>
                <div class="w3-col" style="width: 80%">
            
             <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://127.0.0.1/login"
                           user="root"  password=""/>

        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from feedback;
        </sql:query>
            
                <c:forEach var="row" items="${result.rows}">
                    <div class="mySlides w3-container w3-xlarge w3-white">
                <div class="w3-col"  style="width: 5%">&nbsp;</div>
                <div  class="w3-col" style="width: 75%">
                    <p><span class="w3-tag"><c:out value="${row.fname}"/>&nbsp;<c:out value="${row.lname}"/></span>
                    <p><c:out value="${row.message}"/></p>
                </div>
            </div>
                </c:forEach>        
            </div>    
            <div  class="w3-col" style="width: 10%">
                <br><br>
                <button class="w3-button" onclick="plusDivs(1)">&#10095;</button>
            </div>
            </div>
            
        </div>
    </div>
</div>
<div class="w3-col" style="width: 10%">&nbsp;</div>
</div>
<br><br><br>
<div class="w3-container">
    <div class="w3-col" style="width: 8%">&nbsp;</div>
    <div class="w3-col" style="width: 84%">
        <form action="addfeedback.jsp" method="post" class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin">
<h2 class="w3-center">Provide Feedback</h2>
 
<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="fname" type="text" placeholder="First Name">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="lname" type="text" placeholder="Last Name">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-envelope-o"></i></div>
    <div class="w3-rest">
        <input class="w3-input w3-border" name="email" type="email" placeholder="Email">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-phone"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="phone" type="text" placeholder="Phone">
    </div>
</div>

<div class="w3-row w3-section">
  <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-pencil"></i></div>
    <div class="w3-rest">
      <input class="w3-input w3-border" name="message" type="text" placeholder="Message">
    </div>
</div>

<button class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding">Send</button>

</form>
    </div>
    <div class="w3-col" style="width: 8%">&nbsp;</div>
</div>
<script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
