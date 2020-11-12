<%@ page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>URBAN PAVIA - Servizio urbano</title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script>
         $(document).ready(function(){
           $("#button1").click(function(){
             $("#panel1").fadeToggle("slow");
             $("#panel2").hide();
             $("#panel3").hide();
           });
         });
         
         $(document).ready(function(){
           $("#button2").click(function(){
             $("#panel2").fadeToggle("slow");
             $("#panel3").hide();
             $("#panel1").hide();
           });
         });
         
         $(document).ready(function(){
           $("#button3").click(function(){
             $("#panel3").fadeToggle("slow");
             $("#panel2").hide();
             $("#panel1").hide();
           });
         });
         
         $(document).ready(function(){
           $("#signIn").click(function(){
             $(".login").fadeToggle("slow");
           });
         });
      </script>
      <style type="text/css">
         *{
         padding:0;
         margin:0;
         font-family:sans-serif;
         }
         #navbar{
         background-color:black;
         height:69px;
         width:auto;
         list-style-type:none;
         }
         h1{                      
         float:left;
         color:white;
         font-size:1.6em;
         margin-top:8px;
         padding:12px;
         }
         a{
         float:right;
         color:white;
         font-size:1.3em;
         font-style:italic;
         margin-top:12px;
         padding:12px;
         border-left:3px solid red;
         text-decoration:none;
         }
         a:hover{
         text-decoration:underline;
         color:red;
         }
         #background1{
         background-image:url('static/background1.png');
         height:310px;
         width:auto;
         background-size:100% 310px;
         }
         #menu{
         background-color:black;
         height:65px;
         width:auto;
         display:flex;
         flex-direction:row;
         }
         button{
         background-color:lightgrey;
         width:33.3%;
         margin:3px;     
         font-size:1.3rem;
         font-style:italic;
         }
         #background2{
         background-image:url('static/background2.png');
         height:310px;
         width:auto;
         background-size:100% 310px;
         }
         .panel{
         background-color:black;
         opacity:0.85;
         height:310px;
         width:auto;
         border:5px solid green;
         text-align:center;       
         color:white;
         display:none;
         }
         input{
         width:150px;
         height:20px;
         border-style:solid;
         border-width:2px;
         border-color:green;
         text-align:center;
         }
         label{
         font-size:1.2rem;
         }
         .login{
         background-color:black;
         opacity:0.85;
         height:310px;
         width:22%;
         float:right;       
         text-align:center;
         color:white;
         display:none;
         }
		 @media only screen and (max-width: 800px){
		 #navbar{
         height:55px;
         }
         h1{
         font-size:0em;
         }
         a{
         margin-top:4px;
         }
		 #background1{
         height:150px;
         background-size:100% 150px;
         }
         @media only screen and (max-width: 600px){
         a{
         font-size:0.9em;
         }
		 #background1{
         height:80px;
         background-size:100% 80px;
         }
         button{
         background-color:lightgrey;
         width:33.3%;
         margin:3px;     
         font-size:0.9em;
         font-style:italic;
         }
		 }
      </style>
      <script type="text/javascript">
         var var1=0;
         var vars=[0,0,0,0];
         
         setInterval(function(){bc()},3000);
         
         function ons(id){
           if(vars[id]==0){
             vars[id]=1;
             document.getElementById('button'+id).style.backgroundColor='black';
             document.getElementById('button'+id).style.color='white';
             document.getElementById('button'+id).style.fontSize='1.5em';
           }
           else{
             vars[id]=0
             document.getElementById('button'+id).style.backgroundColor='lightgrey';
             document.getElementById('button'+id).style.color='black';
             document.getElementById('button'+id).style.fontSize='1.3em';
           }
         }
         
         function onl(id){
           if(var1==0){
             var1=1;
             document.getElementById(id).style.color='red';
           }
           else{
             var1=0
             document.getElementById(id).style.color='white';
           }
         }
         
         function off(id){
             vars[id]=0
             document.getElementById('button'+id).style.backgroundColor='lightgrey';
             document.getElementById('button'+id).style.color='black';
             document.getElementById('button'+id).style.fontSize='1.3rem';
         }
         function moveover(id){
           if(vars[id]==0){
         	  document.getElementById('button'+id).style.backgroundColor='grey';
         	  document.getElementById('button'+id).style.color='white';
           }
         }
         
         function moveout(id){
           if(vars[id]==0){
         	  document.getElementById('button'+id).style.backgroundColor='lightgrey';
         	  document.getElementById('button'+id).style.color='black';
           }
         }
         
         function calco(val){
         	if(val>10){
         		document.getElementById('demo').value=(val*1);
         	}
         	else{
         		document.getElementById('demo').value=(val*1.5);
         	}
         }
         setInterval(function(){calco(document.getElementById('ca').value)},500);
         
         function calcul(val){
         	if(val=='SETTIMANALE'){
         		 document.getElementById('dem').value='25';
         	}
         	else if(val=='MENSILE'){
         		 document.getElementById('dem').value='75';
         	}
         	else if(val=='ANNUALE'){
         		 document.getElementById('dem').value='250';
         	}
         }
         setInterval(function(){calcul( document.getElementById('duration').value)},500);
         
      </script>
   </head>
   <body>
      <div id="navbar">
         <h1>URBAN PAVIA</h1>
         <a id="signIn" href="#" onclick="onl('signIn')">Accedi</a>
         <a href="activate.jsp">Attiva il tuo titolo di viaggio</a>
      </div>
      <div id="background1">
         <div class="login">
            <form style="margin-top:30px" action="Login" method="post">
               <label>Username:</label><br>
               <input style="margin-top:5px"type="text" name="username" value="" placeholder="username" required><br><br>
               <label>Password:</label><br>
               <input style="margin-top:5px" type="password" name="password" value="" placeholder="password" required><br><br>
               <input style="margin-top:15px; height:35px" type="submit" name="" value="Login" ><br>
            </form>
         </div>
      </div>
      <div id="menu">
         <button id="button1" id="button1" onclick="ons(1);off(2);off(3);" onmouseover="moveover(1)" onmouseout="moveout(1)">BIGLIETTO SINGOLO</button>
         <button id="button2"  onclick="ons(2);off(1);off(3);" onmouseover="moveover(2)" onmouseout="moveout(2)">BIGLIETTO CUMULATIVO</button>
         <button id="button3" onclick="ons(3);off(1);off(2);" onmouseover="moveover(3)" onmouseout="moveout(3)">ABBONAMENTO</button>	
      </div>
      <div id="background2">
         <div id="panel1" class="panel">
            <form style="margin-top:20px" action="payment.jsp" method="post">
               <label>Prezzo (&euro;):</label><br>
               <input id="de" type="text" name="price" value="1.50" readonly="readonly"><br><br>
               <input style="display:none" id="type" type="text" name="type" value="single"><br>
               <input style="height:35px" type="submit" name="" value="Paga"><br>
            </form>
         </div>
         <div id="panel2" class="panel">
            <form style="margin-top:20px" action="payment.jsp" method="post">
               <label>Numero di viaggi:</label>
               <select name="tripsNum" id="ca" onclick="if(this.value>10){document.getElementById('demo').value=(this.value*1);}else{document.getElementById('demo').value=(this.value*1.5);}" required>
                  <option value=5>5</option>
                  <option value=10>10</option>
                  <option value=20>20</option>
                  <option value=50>50</option>
                  <option value=100>100</option>
               </select>
               <br>
               <label>Prezzo (&euro;):</label><br>
               <input id="demo" type="text" name="price" value="7.5" readonly="readonly"><br><br>
               <input style="display:none" type="text" name="type" value="cumulative"><br>
               <input style="height:35px" type="submit" name="" value="Paga"><br>
            </form>
         </div>
         <div id="panel3" class="panel">
            <form style="margin-top:20px" action="payment.jsp" method="post">
               <label>Nome:</label><br>
               <input type="text" name="name" value="" required><br>
               <label>Cognome:</label><br>
               <input type="text" name="surname" value="" required><br>
               <label>Durata:</label>
               <select name="duration" id="duration" onclick="calcul(this.value)">
                  <option value='SETTIMANALE'>SETTIMANALE</option>
                  <option value='MENSILE'>MENSILE</option>
                  <option value='ANNUALE'>ANNUALE</option>
               </select>
               <br>
               <label>Prezzo (&euro;):</label><br>
               <input id="dem" type="text" name="price" value="25" readonly="readonly"><br><br>
               <input style="display:none" type="text" name="type" value="pass"><br>
               <input style="height:35px" type="submit" name="" value="Paga"><br>
            </form>
         </div>
      </div>
   </body>
</html>