<%@ include file="common/header.jsp" %>
<script>  
var request=new XMLHttpRequest();  
function searchInfo(){  
var bookname=document.vinform.bookname.value;  
var url="find.jsp?val="+bookname;  
  
try{  
request.onreadystatechange=function(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('mylocation').innerHTML=val;  
}  
}//end of function  
request.open("GET",url,true);  
request.send();  
}catch(e){alert("Unable to connect to server");}  
}  
</script>  

<div class="container">
    <div class="w3-col" style="width: 10%">&nbsp;</div>
    <div class="w3-col" style="width: 80%">
        <h4><b>Search Books From Here </b></h4>
        <form class="w3-row" name="vinform">
            <div class="container">
                <div class="w3-col" style="width: 100%">
                    <input class="w3-input w3-border w3-validate" type="text" style="width:100%" name="bookname" placeholder="Enter book Name or Author Name" onkeyup="searchInfo()">
                    <span id="mylocation"></span>  
                </div>
                
            </div>
        </form>
    </div>
    <div class="w3-col" style="width: 10%">&nbsp;</div>
</div>




 
