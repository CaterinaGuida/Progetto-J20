<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>attivazione</title>
<style type="text/css">
	  html{
		font-size:10px;
		font-family: sans-serif;
		}
  	  #head{
        position:absolute;
        width:100%;
        height:150px;
        background-color:black;
      }
      h1{
        color:white;
        text-align: center;
        font-family: sans-serif;
        font-style: italic;
        font-size:3.5rem;
      }
      #content{
        position:absolute;
        margin-top:153px;
        background-color:black;
        width: 100%;
        height: 100%;
        opacity:0.8;

	 }
	 #nome{
	 	position:absolute;
        margin-top:115px;
        text-align:center;
        width:100%;
	 }
	 #profile{ 
	 	position:absolute;
        margin-top:20px;
        background-color: white;
        margin-left:45%;
        border-radius:100%;
        width: 10%;
        height: 85px;
        background-image: url('static/avatar.png');
        background-size: 100% 85px;
 
	 }
	 
	 #codice{
      	position:absolute;
      	margin-top:120px;
      	width:60%;
      	margin-left:20%;
      	height: 35px;
      	border-radius: 35px;
      	text-align:center;
      	color: black;
      	font-size:2rem;
      }
      #but{
	     position: absolute;
	     margin-top: 220px; 
	     width:10%;
	     height:50px;
	     margin-left:45%;
	     
     }

     @media only screen and (max-width: 600px) {

     #content{
       	height:100%;
     }
	#profile{
		width: 40%;
        height: 85px;
        margin-left:30%;
        background-size: 100% 85px;
	}
	#codice{
      	width:80%;
      	margin-left:10%;
      	height: 40px;
      	border-radius: 40px;
      	font-size:1.2rem;
      }
 	#but{
     	width:24%;
     	margin-left:38%;
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