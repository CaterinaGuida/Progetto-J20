<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>validation</title>
    <style media="screen">
    	html{
		font-size:20px;
		font-family: sans-serif;
		}
    
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
        height: 550px;
        opacity:0.8;
        padding-top: 20px;
      }
      h1{
        color:white;
        text-align: center;
        font-family: sans-serif;
        font-style: italic;
        font-size:3rem;

      }
      h2{
        color:red;
        text-align: center;
        font-family: sans-serif;
        font-size:3rem;
        margin-left:30%

      }

      em{
        color:white;
        text-align:right;
        margin-left:10%;
        font-size:1.5rem;
      }
     @media only screen and (min-height: 800px) {

     #content{
     	padding-top:150px;
       	height:90%;

     }
  
  	h2{

        margin-left:20%

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
      <h1>controllo</h1>
    </div>
    <div id="content">
    <% if(output[0].equals("Titolo non esistente")){
    	
    	out.println("<h2 style='font-size:2em;color:red;text-align:center; margin-left:0%'>Il codice inserito non corrisponde ad alcun titolo di viaggio.</h2>");
    	out.println("<h2 style='font-size:5em;text-align:center; margin-left:0%'>&#128549;</h2><br>");
    	}
    
     else if(output[0].equals("Titolo non attivato")){
    	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
    	out.println("<h2 style='font-size:2em;color:white;margin-left:30%;text-align:left'>Stato: <em style='color:red'>NON ATTIVO</em></h2>");
    	
     }
    
     else if(output[0].equals("Titolo scaduto")){
     	
     	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Tipo: <em>"+output[1]+"</em></h2>");
     	out.println("<h2 style='font-size:2em;color:white;text-align:left'>Stato:  <em style='color:red'>SCADUTO </em></h2>");
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
    	out.println("<h2 style='font-size:1.2em;color:green;text-align:center;margin-left:0%;width:100%'>Il biglietto pu� essere attivato ancora "+output[3]+" volte dopo la scadenza dell'attivazione corrente.</h2><br>");
    	
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