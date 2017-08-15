<%@ include file="common/header.jsp" %>    
<br><br>
<div class="container w3-card w3-border-white" style="font-size:20px;margin-top:0px;font-family:Pridi;height: 450px">
<div style="width: 10%" class="w3-col">&nbsp;</div>
<div class="w3-content w3-col w3-border-white" style="width: 80%;">
  <img class="mySlides" src="lib1.jpg" style="width:125%;height: 550px">
  <img class="mySlides" src="lib2.jpg" style="width:125%;height: 550px">
  <img class="mySlides" src="lib3.jpg" style="width:125%;height: 550px">
  <img class="mySlides" src="lib4.jpg" style="width:125%;height: 550px">
</div>
<div style="width: 10%" class="w3-col">&nbsp;</div>
</div>
<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";  
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}    
    x[myIndex-1].style.display = "block";  
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>

</body>