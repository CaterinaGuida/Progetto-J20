<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>VERIFICA</title>
<style type="text/css">
	  html{
		font-size:10px;
		font-family:sans-serif;
		}
  	  #head{
       position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
        height:150px;
        background-color:black;
      }
      h1{
        color:white;
        text-align:center;
        font-family:sans-serif;
        font-style:bold;
        font-size:3em;
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
        height:530px;
        opacity:0.8;
        padding-top:5%;
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
      	margin-top:100px;
      	width:80%;
      	height:45px;
      	border-radius:15px;
      	text-align:center;
      	color:black;
      	font-size:1.5em;
      }
      #but{
	    position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
	    margin-top:200px; 
	    width:10%;
	    height:50px;
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