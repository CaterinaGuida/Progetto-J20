<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>URBAN PAVIA - Verifica validità</title>
<style type="text/css">
	  html{
		font-size:15px;
		font-family:sans-serif;
		}
  	  #head{
       	position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
		width:100%;
		background-color:black;
        height:150px;
      }
      h1{
      	margin-top:34px;
        text-align:center;
        font-family:sans-serif;
        font-style:bold;
        font-size:3em;
        color:white;
      }
      #content{
        position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
        margin-top:150px;
        background-color:black;
        opacity:0.8;
        height:100%;
	 }
	 #nome{
	 	position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
        margin-top:115px;
        text-align:center;
	 }
	 #profile{ 
	 	position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
        margin-top:20px;
        background-color:white;
        border-radius:100%;
        width:8%;
        height:85px;
        background-image:url('static/avatar.png');
        background-size:100% 85px;
	 }
	 #codice{
      	position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
      	width:80%;
      	margin-top:150px;
      	height:45px;
      	text-align:center;
      	font-size:1.5em;
      	border-radius:15px;
      }
      #but{
	    position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
		width:10%;
	    margin-top:240px;
	    height:50px;
     }

     @media only screen and (max-width: 800px){
      h1{
        font-size:2.5em;
      }
      #content{
       	height:400px;
      }
      #but{
	    width:20%;
	    margin-top:240px;
	    font-size:1em;
      }
      #codice{
      	width:80%;
      	font-size:1.2em;
      	margin-top:160px;
      }
      }
      
      @media only screen and (max-width: 600px){
      #but{
	    margin-top:190px;
	    height:40px;
      }
      #codice{
      	width:80%;
      	font-size:0.9em;
      	margin-top:120px;
      }
      }   

  </style>    
</head>
<%
	   String username= (String) session.getAttribute("username");
%>
<body>
  <div id="head">
      <div id="profile">
      </div>
      <h2 id="nome" style="color:white"><%= username %></h2>
   </div>
   <div id="content">
	<form action="Validation" method="post">
		<input type="text" id="codice" name="code" placeholder="inserisci il codice del titolo da verificare">
		<input type="submit" id="but" value="Verifica">
	</form>
   </div>
</body>
</html>