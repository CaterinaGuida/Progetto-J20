<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>URBAN PAVIA - Attiva il tuo titolo di viaggio</title>
    <style media="screen">
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
      h1{
      	margin-top:34px;
      	text-align:center;
      	font-family:sans-serif;
        font-style:bold;
        font-size:3em;
        color:white;
      }
/*      em{
        color:white;
        text-align:center;
        margin-left:40%;
        font-size:1.4em;
      } 
      #s{
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
        display:none;
      } 
      a{
      	font-size:1.5em;
      	text-decoration:underline;
      	color:red;
      }
      a:hover{
      	font-size:1.8em;
      	color:purple;
      } */
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
      #att{
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
      #attiva{
      	width:100%;
	    height:50px;
      }
      
      @media only screen and (max-width: 800px){
      h1{
        font-size:2.5em;
      }
      #content{
       	height:400px;
      }
      #att{
	    width:20%;
	    margin-top:240px;
      }
      #codice{
      	width:80%;
      	font-size:1.2em;
      	margin-top:160px;
      }
      #attiva{
      	width:100%;
	    font-size:1em;
      }     
      }
      
      @media only screen and (max-width: 600px){
      #att{
	    width:15%;
	    margin-top:190px;
      }
      #codice{
      	width:80%;
      	font-size:0.9em;
      	margin-top:120px;
      }
      #attiva{
      	width:100%;
	    height:40px;
      }
      }   

    </style>
  </head>
  <body  onload="initialize()">
    <div id="head">
      <h1>ATTIVAZIONE</h1>
    </div>
    <div id="content">
    <form action="Attivazione" method="post">
      <input id="codice" name="code" type="text" placeholder="inserisci il codice del titolo da attivare" required>
      <div id="att"><input id="attiva" input  type="submit" value="Attiva"></div>
      </form>
    </div>
  </body>
</html>