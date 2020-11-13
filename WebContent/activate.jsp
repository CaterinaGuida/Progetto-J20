<!DOCTYPE html>
<html lang="en" dir="ltr">
   <head>
      <meta charset="utf-8">
      <title>URBAN PAVIA - Attiva il tuo titolo di viaggio</title>
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
         height:600px;
         width:auto;
         text-align:center;
         }
         input{
         height:45px;
         width:80%;
         border-style:solid;
         border-width:2px;
         border-color:green;
         text-align:center;
         border-radius:15px;
         margin-top:100px;
         font-size:1.5em;
         }
         .att{ 
         height:50px;
         width:auto;
         text-align:center;
         }
         @media only screen and (max-width: 600px){
         input{
         font-size:0.9em;
         }
         }  
      </style>
   </head>
   <body  onload="initialize()">
      <div id="head">
      	 <br>
      	 <br>
         <h1>ATTIVAZIONE</h1>
      </div>
      <div id="content">
         <form action="Attivazione" method="post">
            <input id="codice" name="code" type="text" placeholder="inserisci il codice del titolo da attivare" required>
            <div id="att">
            	<input style="max-width:60%" id="attiva" input  type="submit" value="Attiva">
            </div>
         </form>
      </div>
   </body>
</html>