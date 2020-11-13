<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>URBAN PAVIA - Verifica validità</title>
      <style type="text/css">
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
         display: flex;
         flex-direction:column;
         align-items: center;
         justify-content: center;  
         }
         h1{
         color:white;
         font-size:2em;
         }
         #profile{
         background-image:url('static/avatar.png');
         height:85px;
         border-radius:100%;
         width:8%;
         background-size:100% 85px;
         }
         #content{
         background-color:black;
         opacity:0.8;
         height:610px;
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
         input{
         font-size:1.2em;
         }
         .butt{ 
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
   <%
      String username= (String) session.getAttribute("username");
    %>
   <body>
      <div id="head">
         <div id="profile"><br>
         </div>
      	 
         <h1 id="nome" style="color:white"><%= username %></h1>
      </div>
      
      <div id="content">
         <form action="Validation" method="post">
            <input type="text" name="code" placeholder="inserisci il codice del titolo da verificare">
            <div id="butt">
            	<input style="max-width:60%" type="submit" id="but" value="Verifica">
            </div>
         </form>
      </div>
   </body>
</html>