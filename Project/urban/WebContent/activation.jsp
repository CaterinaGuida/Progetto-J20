<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>RISULTATO</title>
    <style media="screen">
      #head{
        position:absolute;
        width:100%;
        height:120px;
        background-color:black;
      }
      #content{
        position:absolute;
        margin-top:123px;
        background-color:black;
        width: 100%;
        height: 500px;
        opacity:0.8;
        padding-top: 5%;
      }
      h1{
        color:white;
        text-align: center;
        font-family: sans-serif;
        font-style: italic;
        font-size:3em;

      }
      h2{
        color:red;
        margin-left:28%;
        font-family: sans-serif;
        font-size:2em;
	
      }

      em{
        color:white;
        text-align:right;
        margin-left:10%;
        font-size:1em;
      }
     
      

     @media only screen and (min-height: 800px) {

     #content{
     	padding-top:150px;
       	height:90%;

     }
     h2{
     	margin-left:25%;
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
      <h1>Attivazione</h1>
    </div>
    <div id="content">
    <% if(output[0].equals("Titolo non esistente")){
    	
    	out.println("<h2 style='font-size:2em;color:red;text-align:center; margin-left:0%'>Il codice inserito non corrisponde ad alcun titolo di viaggio.</h2>");
    	out.println("<h2 style='font-size:5em;text-align:center; margin-left:0%'>&#128549;</h2><br>");
    	}
    
    else if(output[0].equals("Titolo scaduto")){
    	
    	out.println("<h2 style='font-size:3em;'>Il titolo di viaggio è scaduto.&#128549;</h2>");
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white; text-align:left'>Data di scadenza: <em>"+output[2].split(" ")[0]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white; text-align:left'>Orario di scadenza: <em>"+output[2].split(" ")[1]+":00</em></h2><br>");	
    	
    }
    
	else if(output[0].equals("Titolo attivato")){
    	
    	out.println("<h2 style='font-size:3em;color:green'>Il titolo di viaggio è stato attivato.&#128526;</h2>");
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white; text-align:left'>Data di scadenza: <em>"+output[2].split(" ")[0]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white; text-align:left'>Orario di scadenza: <em>"+output[2].split(" ")[1]+":00</em></h2><br>");	
    	
    }
    
	else if(output[0].equals("Titolo valido")){
    	
    	out.println("<h2 style='font-size:3em;color:green'>Il titolo di viaggio è valido.&#128526;</h2>");
    	out.println("<h2 style='font-size:2em;color:white; text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white; text-align:left'>Data di scadenza: <em>"+output[2].split(" ")[0]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white; text-align:left'>Orario di scadenza: <em>"+output[2].split(" ")[1]+":00</em></h2><br>");	
    	
    }
    
else if(output[0].equals("Titolo attivato 2")){
    	
    	out.println("<h2 style='font-size:3em;color:green'>Il titolo di viaggio è stato attivato.&#128526;</h2>");
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Data di scadenza: <em>"+output[2].split(" ")[0]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Orario di scadenza: <em>"+output[2].split(" ")[1]+":00</em></h2><br>");
    	out.println("<h2 style='font-size:1.2em;color:green;text-align:center;margin-left:0%;width:100%'>Il biglietto può essere attivato ancora "+output[3]+" volte dopo la scadenza dell'attivazione corrente.</h2><br>");
    	
    }
    
    
    
    %>
    </div>

  </body>
</html>