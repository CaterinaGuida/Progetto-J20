<!DOCTYPE html>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>CONVALIDA</title>
      <style media="screen">
         *{
         padding:0;
         margin:0;
         font-family:sans-serif;
         }
         #head{
         background-color:black;
         height:150px;
         width:auto;
         list-style-type:none;
         text-align:center;
         }
         h1{
         color:white;
         font-size:3em;
         }
         #content{
         background-color:black;
         opacity:0.8;
         height:610px;
         width:auto;
         text-align:center;
         }
         .panel{
         background-color:black;
         opacity:0.8;
         height:610px;
         width:auto;
         text-align:left;
         padding-left:250px;
         }
         label{
         }
         em{
         }
         @media only screen and (max-width: 900px){
         .panel{
         padding-left:50px;
         }
         }
         @media only screen and (max-width: 600px){
         #content{
         height:650px;
         width:auto;
         text-align:center;
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
     	 <br>
      	 <br>
         <h1>VERIFICA</h1>
      </div>
      <div id="content">
      <div class="panel">
         <%
            if(output[0].equals("Titolo non esistente")){
            	out.println("<br><br><label style='font-weight:bold;font-style:italic;font-size:2.5em;color:red'>Il codice inserito non corrisponde ad alcun titolo di viaggio!</label>");
            }
            else if(output[0].equals("Titolo non attivato")){
            	out.println("<br><br><label style='font-size:3em;color:white'>Tipo: <em style='font-style:italic;color:green'>"+output[1]+"</em></label>");
            	out.println("<br><label style='font-size:3em;color:white'>Stato: <em style='font-style:italic;color:red'>NON ATTIVO</em></label>");
            }
            else if(output[0].equals("Titolo scaduto")){
             	out.println("<br><br><label style='font-size:3em;color:white'>Tipo: <em style='font-style:italic;color:green'>"+output[1]+"</em></label>");
             	out.println("<br><label style='font-size:3em;color:white'>Stato: <em style='font-style:italic;color:red'>SCADUTO </em></label>");
             	out.println("<br><label style='font-size:3em;color:white'>Data di scadenza: <em style='font-style:italic;color:green'>"+output[2].split(" ")[0]+"</em></label>");
             	out.println("<br><label style='font-size:3em;color:white'>Orario di scadenza: <em style='font-style:italic;color:green'>"+output[2].split(" ")[1]+":00</em></label>");	
            }
            else if(output[0].equals("Titolo valido")){
             	out.println("<br><br><label style='font-size:3em;color:white'>Tipo: <em style='font-style:italic;color:green'>"+output[1]+"</em></label>");
             	out.println("<br><label style='font-size:3em;color:white'>Stato: <em style='font-style:italic;color:green'>VALIDO</em></label>");
             	out.println("<br><label style='font-size:3em;color:white'>Data di scadenza: <em style='font-style:italic;color:green'>"+output[2].split(" ")[0]+"</em></label>");
             	out.println("<br><label style='font-size:3em;color:white'>Orario di scadenza: <em style='font-style:italic;color:green'>"+output[2].split(" ")[1]+":00</em></label>");		
            }
            else if(output[0].equals("Titolo non attivato 2")){	
            	out.println("<br><br><label style='font-size:3em;color:white'>Tipo: <em style='font-style:italic;color:green'>"+output[1]+"</em></label>");
            	out.println("<br><label style='font-size:3em;color:white'>Stato: <em style='font-style:italic;color:red'>NON ATTIVO</em></label>");
            	out.println("<br><label style='font-size:3em;color:white'>Viaggi restanti: <em style='font-style:italic;color:green'>"+output[2]+"</em></label>");	
            }
            else if(output[0].equals("Titolo attivato 2")){
            	out.println("<br><br><label style='font-size:3em;color:white'>Tipo: <em style='font-style:italic;color:green'>"+output[1]+"</em></label>");
            	out.println("<br><label style='font-size:3em;color:white'>Stato: <em style='font-style:italic;color:green'>VALIDO</em></label>");
            	out.println("<br><label style='font-size:3em;color:white'>Data di scadenza: <em style='font-style:italic;color:green'>"+output[2].split(" ")[0]+"</em></label>");
            	out.println("<br><label style='font-size:3em;color:white'>Orario di scadenza: <em style='font-style:italic;color:green'>"+output[2].split(" ")[1]+":00</em></label>");
            	out.println("<br><br><label style='font-size:2em;color:white'>Il biglietto può essere attivato ancora "+output[3]+" volte dopo la scadenza dell'attivazione corrente.</h2>");
            }
            else if(output[0].equals("Titolo scaduto 2")){
            	out.println("<br><br><label style='font-size:3em;color:white'>Tipo: <em style='font-style:italic;color:green'>"+output[1]+"</em></label>");
            	out.println("<br><label style='font-size:3em;color:white'>Stato: <em style='font-style:italic;color:red'>SCADUTO</em></label>");
            	out.println("<br><label style='font-size:3em;color:white'>Data di scadenza: <em style='font-style:italic;color:green'>"+output[2].split(" ")[0]+"</em></label>");
            	out.println("<br><label style='font-size:3em;color:white'>Orario di scadenza: <em style='font-style:italic;color:green'>"+output[2].split(" ")[1]+":00</em></label>");
            }   
            %>
      </div>
      </div>
   </body>
</html>