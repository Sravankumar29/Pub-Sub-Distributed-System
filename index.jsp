<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>var r;var s;</script>
<style> 
textarea {
    width: 100%;
    height: 95px;
}
</style>
<style>
#form1 {
    background-color: #FDFEFE;
}
#form2 {
    background-color: #FDFEFE;
}

</style>
</head>
<body>
    <form id="form1">
    <h1>publish</h1>
          <p>
             <label>Select Topic</label>
             <select id = "myList">
               <option value = "javascript">javascript</option>
               <option value = "java">java</option>
               <option value = "python">python</option>
             </select>
          </p>
          <p>
          <label>Enter the message here</label>
          <br>
<textarea id="EC"></textarea>
<input type="submit" value="ADD" onclick="myFunction(); return false;"/>
        </p>
    </form>
    <form id="form2">
    <h1>subscribe</h1>
    Name:
  <input type="text" id="name"><br>
    <input type="checkbox" id="javascript" value="javascript"> javascript<br>
    <input type="checkbox" id="java" value="java"> java<br>
    <input type="checkbox" id="python" value="python"> python<br>
  
  <input type="submit" value="ADD" onclick="myFunction1(); return false;"/>
  </form>
    <p id="demo"></p>
    <p id="demo1"></p>    
    <script>
   
function myFunction() {
  newDetails = {topic: document.getElementById('myList').value, message: document.getElementById('EC').value};
	  $.ajax({
		  'async': false,
		  type: "POST",
	      url: "publish",
	      data: newDetails,
	   	  success: function(result){
	   		  r = result;
	   		  console.log(result);	   		
	   	  }
	  });	  
	 document.getElementById("demo").innerHTML = r;  
}
function myFunction1(){
	newDetails = {name: document.getElementById('name').value, 
			javascript: document.getElementById('javascript').checked,
			java: document.getElementById('java').checked,
			python: document.getElementById('python').checked};
	  $.ajax({
		  'async': false,
		  type: "POST",
	      url: "subscribe",
	      data: newDetails,
	   	  success: function(result){	   		 
	   		  s = result;
	   		  console.log(result);	   		
	   	  }
	  });	  
	 document.getElementById("demo").innerHTML = s;	
}
</script>
  </body>
</html>