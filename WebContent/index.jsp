<%@ page language="java" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
 <title>Urban PAVIA - Servizio urbano</title>
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
      $("#login").fadeToggle("slow");
    });
  });

 </script>
<style type="text/css">
	html{
		font-size:13px;
		font-family:sans-serif;
	}
	#navbar{
		position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
		width:100%;
		background-color:black;
		height:50px;
	}
	h1{
		margin-top:12px;
		margin-left:15px;
		color:white;
		float:left;
	}
	a{
		margin-top:15px;
		margin-right:15px;
		border-left:2px solid red;
		color:white;
		float:right;
		font-size:1.4rem;
		font-style:italic;
		padding-left:10px;
		text-decoration:none;
	}
	a:hover{
		text-decoration:underline;
		color:red;
	}
	#carousel{
		position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
		margin-top:50px;
		width:100%;
		background-image:url('static/pict4.png');
		background-size:100% 325px;
		height:325px;
		z-index:1;
	}
	#menu{
		position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
		margin-top:375px;
		width:100%;
		display:flex;
  		flex-direction:row;
		background-color:black;
		height:60px;
		z-index:3;
	}
	button{
		margin:5px;
		width:33.3%;	
		background-color:lightgrey;
		font-size:1.5rem;
	}
	#footer{
		position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
		margin-top:435px;
		width:100%;
		background-image:url('static/cart.jpg');
		background-size:100% 100%;
		height:100%;
		z-index:1;
	}
	.panel{
     	position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
      	margin-top:435px;
      	width:100%;
      	background-color:black;
      	opacity:0.85;
      	height:210px;
      	text-align:center;
      	color:white;
      	z-index:2;	
    }
    input{
        text-align:center;
    }
    tr,td{
     	padding:0px;
    } 
    #login{
      	position:absolute;
		right:0;
		top:0;
		margin-top:50px;
		width:23%;
     	background-color:black;
     	opacity:0.85;
      	height:325px;
      	z-index:2;
      	display:none;
    }
    .log{
    	positon:absolute;
    	margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
		margin-top:8px;
		padding:3px;
    }
    .sub{
      	positon:absolute;
    	margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
		margin-top:8px;
		padding:3px;
		margin-left:37.5%;
    }
    #msg{
      	position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
		margin-top:270px;
      	color:black;
      	text-align:center;
      	font-size:3rem;
		font-family:sans-serif;
		font-style:italic;
    }
	
    @media only screen and (max-width: 800px) {
    button{
		font-size:1.1rem;
	}
    #login {
        width:100%;
    }  
    .log{
      	width:85%;    
    }
    .sub{
      	width:35%;
      	margin-left:25.8%;
    }
    #msg{
      	font-size:2rem;
    }

	@media only screen and (max-width: 500px) {
    button{
		font-size:0.6rem;
	}	
	#msg{
      	font-size:1.2rem;
    }

</style>
<script type="text/javascript">

	var pictures=["url('static/pict4.png')","url('static/pict5.png')","url('static/pict3.png')"];
    counter=0;
    
    function bc(){
          document.getElementById('carousel').style.backgroundImage=pictures[counter];
          counter+=1;
          if(counter==3){
            counter=0;
          }
    }
    setInterval(function(){bc()},3000);

    var var1=0;
    var vars=[0,0,0,0];
    
    function ons(id){
      if(vars[id]==0){
        vars[id]=1;
        document.getElementById('button'+id).style.backgroundColor='black';
        document.getElementById('button'+id).style.color='white';
        document.getElementById('button'+id).style.fontSize='2em';
      }
      else{
        vars[id]=0
        document.getElementById('button'+id).style.backgroundColor='lightgrey';
        document.getElementById('button'+id).style.color='black';
        document.getElementById('button'+id).style.fontSize='1.5rem';
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
        document.getElementById('button'+id).style.fontSize='1.5rem';
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
	    <div id="login">
      <form class="" action="Login" method="post" required >
        <table class="log">
          <tr >
            <td><input class="log" type="text" name="username" value="" placeholder="username" required></td>
          </tr>
          <tr>
            <td>&nbsp</td>
          </tr>
          <tr>
            <td><input class="log"  type="password" name="password" value="" placeholder="password" required></td>
          </tr>
          <tr>
            <td>&nbsp</td>
          </tr>
          <tr >
            <td><input class="sub" type="submit" name="" value="Login" ></td>
          </tr>
        </table>
      </form>
    </div>
	<div id="carousel">
		      <div id="msg" >ACQUISTA UN TITOLO DI VIAGGIO</div>
	</div>
	<div id="menu">
		<button id="button1" id="button1" onclick="ons(1);off(2);off(3);" onmouseover="moveover(1)" onmouseout="moveout(1)">BIGLIETTO SINGOLO</button>
		<button id="button2"  onclick="ons(2);off(1);off(3);" onmouseover="moveover(2)" onmouseout="moveout(2)">BIGLIETTO CUMULATIVO</button>
		<button id="button3" onclick="ons(3);off(1);off(2);" onmouseover="moveover(3)" onmouseout="moveout(3)">ABBONAMENTO</button>	
	</div>
	<div id="footer"></div>
	<div id="panel1" class="panel" style="display:none;padding-top:20px">
	<form style="font-size:1.8rem" class="" action="payment.jsp" method="post">
        Prezzo (&euro;): <input style="color:black" id="de" type="text" name="price" value="1.50" readonly="readonly"> <br><br>
        <input style="display:none" id="type" type="text" name="type" value="single">
        <input style="color:black" type="submit" name="" value="Paga">
      </form>
	</div>
	<div id="panel2" class="panel" style="display:none;padding-top:20px">
	<form  style="font-size:1.8rem;" class="" action="payment.jsp" method="post">
        Numero di viaggi:
        <select style="color:black;" name="tripsNum" id="ca" onclick="if(this.value>10){document.getElementById('demo').value=(this.value*1);}else{document.getElementById('demo').value=(this.value*1.5);}" required>
          <option value=5>5</option>
          <option value=10>10</option>
          <option value=20>20</option>
          <option value=50>50</option>
          <option value=100>100</option>
        </select><br><br>
      Prezzo (&euro;): <input style="color:black" id="demo" type="text" name="price" value="7.5" readonly="readonly"> &euro;<br><br>
      <input style="display:none" type="text" name="type" value="cumulative">
      <input style="color:black;" type="submit" name="" value="Paga">
      </form>
	</div>
	<div id="panel3" class="panel" style="display:none; padding-top:20px">
	<form  style="font-size:1.8rem;" class="" action="payment.jsp" method="post">
<table style="margin:auto; border-collapse:collapse;">
          <tr>
            <td class='td' style="text-align:right;">Nome:</td>
            <td class='td'><input style="color:black" type="text" name="name" value="" required> </td>
          </tr>
          <tr>
            <td class='td' style="text-align:right;">Cognome:</td>
            <td class='td'><input style="color:black" type="text" name="surname" value="" required> </td>
           </tr>
           <tr>
            <td class='td' style="text-align:right;">Durata:</td>
            <td class='td'><select style="color:black" name="duration" id="duration" onclick="calcul(this.value)">
              <option value='SETTIMANALE'>SETTIMANALE</option>
              <option value='MENSILE'>MENSILE</option>
              <option value='ANNUALE'>ANNUALE</option>
            </select></td>
          </tr>
          <tr>
            <td class='td'><br> </td>
            <td class='td'> </td>
           </tr>
          <tr>
            <td class='td' style="text-align:right;">Prezzo (&euro;): </td>
            <td class='td'><input style="color:black" id="dem" type="text" name="price" value="25" readonly="readonly"></td>
          </tr>
          <tr>
            <td class='td' style="text-align:left;"></td>
            <td class='td'></td>
          </tr>
          <tr>
            <td class='td'></td>
            <input style="display:none" type="text" name="type" value="pass">
            <td class='td'><input style="color:black" type="submit" name="" value="Paga"></td>
          </tr>
        </table>
      </form>
	</div>
</body>
</html>