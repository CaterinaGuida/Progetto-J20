<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>ATTIVAZIONE</title>
    <style media="screen">
      #head{
        position:absolute;
        width:1520px;
        height:120px;
        background-color:black;
      }
      #content{
        position:absolute;
        margin-top:122px;
        background-color:black;
        width: 1520px;
        height: 515px;
        opacity:0.8;
        padding-top: 100px;
      }
      h1{
        color:white;
        text-align: center;
        font-family: sans-serif;
        font-style: italic;
        font-size:3em;
      }
      em{
        color:white;
        text-align:center;
        margin-left:40%;
        font-size:1.4em;
      }
      #s{
      	position:absolute;
        margin-top:9.5%;
        background-color:black;
        width: 100%;
        height: 80%;
        opacity:0.8;
        padding-left:20px;
        display:none;
        color:white;
      }
      a{
      	font-size:1.5em;
      	text-decoration:underline;
      	color: lightblue;
      }
      a:hover{
      	font-size:1.8em;
      	color: purple;
      }
      #codice{
      	margin:auto;
      	width:80%;
      	margin-left:10%;
      	height: 45px;
      	text-align: center;
      	font-size: 1.5em;
      	border-radius: 15px;
      }
      #att{
      	position: absolute;
      	margin-left: 45%;
	    margin-top: 100px; 
	    width:10%;
	    height:50px;
      }
      #attiva{
      	width:100%;
	    height:50px;
      }
      
      @media only screen and (min-height: 800px) {

     #content{
     	padding-top:300px;
       	height:90%;
       	font-size: 2em;
     }
      #att{
      	position: absolute;
      	margin-left: 40%;
	    margin-top: 100px; 
	    width:20%;
	    height:70px;
      }
      #codice{
      	width:80%;
      	margin-left:10%;
      	height: 45px;
      	text-align: center;
      	font-size: 1.2em;
      	height:100px;
      	border-radius: 100px;
      }
      #attiva{
      	width:100%;
	    height:70px;
	    font-size: 1em;
      }     
     }
    </style>

  </head>
   
  <body  onload="initialize()">
    <div id="head">
      <h1>Attivazione</h1>
    </div>
    <div id="content">
    <form action="Attivazione" method="post">
      <input id="codice" name="code" type="text" placeholder="inserisci il codice del titolo da attivare" required>
      <div id="att"><input id="attiva" input  type="submit" value="Attiva"></div>
      </form>
    </div>
  </body>
</html>