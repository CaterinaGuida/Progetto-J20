<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>CONVALIDA</title>
    <style media="screen">
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
        font-size:3rem;
        color:white;
      }
      h2{
        color:red;
        text-align:center;
        font-family:sans-serif;
        font-size:3rem;
        margin-left:21%
      }
      em{
        color:green;
        text-align:right;
        font-size:1em;
      }
 
      @media only screen and (max-width: 800px){
      #content{
       	height:800px;
      }
      h2{
        font-size:1.6em;
      }
	  }

    </style>
  </head>
  <% 
  	String output[]= (String[]) session.getAttribute("output");
  	System.out.println(output[0]);
  %>

  <body  onload="initialize()">
    <div id="head">
      <h1>VERIFICA</h1>
    </div>
    <div id="content">
    <%
    if(output[0].equals("Titolo non esistente")){
    	out.println("<h2 style='font-size:2em;color:red;text-align:center; margin-left:0%;margin-top:100px'>Il codice inserito non corrisponde ad alcun titolo di viaggio!</h2>");
    	out.println("<h2 style='font-size:5em;text-align:center; margin-left:0%'></h2><br>");
    }
    else if(output[0].equals("Titolo non attivato")){
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Stato: <em style='color:red'>NON ATTIVO</em></h2>");
    }
    else if(output[0].equals("Titolo scaduto")){
     	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
     	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Stato: <em style='color:red'>SCADUTO </em></h2>");
     	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Data di scadenza: <em>"+output[2].split(" ")[0]+"</em></h2>");
     	out.println("<h2 style='font-size:2em;color:white; text-align:left'>Orario di scadenza: <em>"+output[2].split(" ")[1]+":00</em></h2><br>");	
    }
    else if(output[0].equals("Titolo valido")){
     	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
     	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Stato: <em style='color:green'>VALIDO</em></h2>");
     	out.println("<h2 style='font-size:2em;color:white; text-align:left'>Data di scadenza: <em>"+output[2].split(" ")[0]+"</em></h2>");
     	out.println("<h2 style='font-size:2em;color:white; text-align:left'>Orario di scadenza: <em>"+output[2].split(" ")[1]+":00</em></h2><br>");		
    }
    else if(output[0].equals("Titolo non attivato 2")){	
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Stato: <em style='color:red'>NON ATTIVO</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Viaggi restanti: <em > "+output[2]+"</em></h2>");	
    }
    else if(output[0].equals("Titolo attivato 2")){
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Stato: <em style='color:green'>VALIDO</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white; text-align:left'>Data di scadenza: <em>"+output[2].split(" ")[0]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Orario di scadenza: <em>"+output[2].split(" ")[1]+":00</em></h2><br>");
    	out.println("<h2 style='font-size:1.3em;color:green;text-align:left;'>Il biglietto può essere attivato ancora "+output[3]+" volte dopo la scadenza dell'attivazione corrente.</h2><br>");
    }
    else if(output[0].equals("Titolo scaduto 2")){
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
   		out.println("<h2 style='font-size:2em;color:white;text-align:left'>Stato: <em style='color:red'>SCADUTO</em></h2>");
   		out.println("<h2 style='font-size:2em;color:white; text-align:left'>Data di scadenza: <em>"+output[2].split(" ")[0]+"</em></h2>");
   		out.println("<h2 style='font-size:2em;color:white; text-align:left'>Orario di scadenza: <em>"+output[2].split(" ")[1]+":00</em></h2><br>");
   }   
    %>
    </div>
  </body>
</html>