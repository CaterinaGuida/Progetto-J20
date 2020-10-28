<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>index</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

 <script>
  $(document).ready(function(){
    $("#flip1").click(function(){
      $("#panel1").fadeToggle();
      $("#panel2").hide();
      $("#panel3").hide();
    });
  });
  $(document).ready(function(){
    $("#flip2").click(function(){
      $("#panel2").fadeToggle("slow");
      $("#panel3").hide();
      $("#panel1").hide();
    });
  });
  $(document).ready(function(){
    $("#flip3").click(function(){
      $("#panel3").fadeToggle("slow");
      $("#panel2").hide();
      $("#panel1").hide();
    });
  });
  $(document).ready(function(){
    $("#cl").click(function(){
      $("#login").fadeToggle("slow");
    });
  });
 
 </script>
<style type="text/css">
	html{
		font-size:10px;
		font-family: sans-serif;
	}
	#navbar{
		position:absolute;
		background-color:black;
		width:100%;
		height:55px;
		color:white;	
	}
	h1{
		font-size:2.5rem;
		float: left;
		font-style: italic;
		margin-left:15px;
	}
	a{
		float:right;
		font-size:1.7rem;
		margin-top:22.5px;
		margin-right:15px;
		text-align:center;
		padding-left:10px;
		border-left: 1px solid white;
		text-decoration: none;
		color: white;
	}
	a:hover{
		text-decoration: underline;
		color: blue;
	}
	#carousel{
		position:absolute;
		background-color:black;
		background-image:url('static/pict4.jpg');
		background-size: 100% 300px;
		margin-top:58px;
		margin-left:5px;
		margin-right:5px;
		width:100%;
		height:300px;
		color:white;
	}
	#menu{
		position:absolute;
		display: flex;
  		flex-direction: row;
		background-color:black;
		margin-top:361.5px;
		width:100%;
		height:58px;
		color:white;
		z-index:3;
	}
	button{
		width:33.3%;
		margin: 5px;
		color: black;
		background-color:lightgrey;
		font-size:1.5rem;
	}
	#footer{
		position:absolute;
		background-image: url('static/cart.jpg');
		background-size: 100% 300px;
		margin-top:423px;
		width:100%;
		height:300px;
		z-index:1;
	}
	.panel{
      position: absolute;
      margin-top: 418px;
      width:100%;
      height:200px;
      background-color: black;
      color: white;
      /*display: none;*/
      opacity:0.85;
      text-align: center;
      z-index:2;
      padding-top:40px;
    }
    input{
        text-align:center;
      }
     tr,td{
     	padding:3px;
     }
      #login{
      position: absolute;
      background-color: black;
      padding-top:10px;
      width:20%;
      height:290px;
      margin-top:58.7px;
      margin-left:80%;
      opacity:0.8;
      z-index:2;
      display:none;
      }
      .log{
      	 width:267px; 
      	 margin-left:5px; 
      }
      .sub{
      	margin-left:118.5px;
      }
      #msg{
      	color:white; 
      	text-align:center; 
      	width:100%; 
      	margin-top:250px; 
      	font-size:3.95rem;
      }
	@media only screen and (max-width: 800px) {
      #login {
        width:100%;
        margin-left:0%;
        padding-top:10px;
      }  
      .log,.sub{
      	  width:85%;
      	  margin-left:9.5%;      
      }}
      @media only screen and (max-width: 400px){
      #msg {
      	 font-size:2.5rem;
      	 text-align:left;
      	 margin-top:235px;  
      }}
      @media only screen and (max-width: 400px){
      button{
		width:31%;
		margin: 5px;
		color: black;
		background-color:lightgrey;
	}}
	@media only screen and (min-width: 400px){
      #footer{
		height: 400px;
		background-size: 100% 400px ;
	}
	#msg{
      	font-size:3.5rem;
      }
	}
	@media only screen and (min-height: 800px){
      #footer{
		height: 400px;
		width: 100%;
		background-size: 100% 400px ;
	}
	#msg{
      	font-size:4.5rem;
      }
	}
      
</style>
<script type="text/javascript">
var pictures=["url('static/pict4.jpg')","url('static/pict5.jpg')","url('static/pict3.jpg')"];
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
        document.getElementById('flip'+id).style.backgroundColor='black';
        document.getElementById('flip'+id).style.color='white';
        document.getElementById('flip'+id).style.fontSize='2em';
      }
      else{
        vars[id]=0
        document.getElementById('flip'+id).style.backgroundColor='lightgrey';
        document.getElementById('flip'+id).style.color='black';
        document.getElementById('flip'+id).style.fontSize='1.3rem';
      }

    }
    function onl(id){
      if(var1==0){
        var1=1;
        document.getElementById(id).style.color='blue';

      }
      else{
        var1=0
        document.getElementById(id).style.color='white';

      }

    }
    function off(id){
        vars[id]=0
        document.getElementById('flip'+id).style.backgroundColor='lightgrey';
        document.getElementById('flip'+id).style.color='black';
        document.getElementById('flip'+id).style.fontSize='1.3rem';
    }

    function moveover(id){
      if(vars[id]==0){
    	  document.getElementById('flip'+id).style.backgroundColor='grey';
    	  document.getElementById('flip'+id).style.color='white';
      }
    }
    function moveout(id){
      if(vars[id]==0){
    	  document.getElementById('flip'+id).style.backgroundColor='lightgrey';
    	  document.getElementById('flip'+id).style.color='black';
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
		<a id="cl" href="#" onclick="onl('cl')">Accedi</a>
		<a  href="activate.jsp">Attiva il tuo titolo di viaggio</a>
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
		      <h1 id="msg" >ACQUISTA UN TITOLO DI VIAGGIO</h1>
	</div>
	<div id="menu">
		<button id="flip1" id="flip1" onclick="ons(1);off(2);off(3);" onmouseover="moveover(1)" onmouseout="moveout(1)">BIGLIETTO SINGOLO</button>
		<button id="flip2"  onclick="ons(2);off(1);off(3);" onmouseover="moveover(2)" onmouseout="moveout(2)">BIGLIETTO CUMULATIVO</button>
		<button id="flip3" onclick="ons(3);off(1);off(2);" onmouseover="moveover(3)" onmouseout="moveout(3)">ABBONAMENTO</button>	
	</div>
	<div id="footer"></div>
	<div id="panel1" class="panel" style="display:none">
	<form style="font-size:1.4em" class="" action="payment.jsp" method="post">
        Prezzo: <input style="color:black" id="de" type="text" name="price" value="1.50"  readonly="readonly"> &euro;<br><br>
        <input style="display:none" id="type" type="text" name="type" value="single">
        <input style="color:black" type="submit" name="" value="Paga">
      </form>
	</div>
	<div id="panel2" class="panel" style="display:none">
		<form  style="font-size:1.4em" class="" action="payment.jsp" method="post">
        Numero di viaggi:
        <select style="color:black" name="tripsNum" id="ca" onclick="if(this.value>10){document.getElementById('demo').value=(this.value*1);}else{document.getElementById('demo').value=(this.value*1.5);}" required>
          <option value=5>5</option>
          <option value=10>10</option>
          <option value=20>20</option>
          <option value=50>50</option>
          <option value=100>100</option>
        </select><br><br>
      Prezzo: <input style="color:black" id="demo" type="text" name="price" value="7.5"  readonly="readonly"> &euro;<br><br>
      <input style="display:none" type="text" name="type" value="cumulative">
      <input style="color:black;" type="submit" name="" value="Paga">
      </form>
	</div>
	<div id="panel3" class="panel" style="display:none; padding-top:20px">
		<form  style="font-size:1.4em;" class="" action="payment.jsp" method="post">
        <table style="margin:auto; border-collapse: collapse;">
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
              <option value='ANNO'>ANNUALE</option>
            </select></td>
          </tr>
          <tr>
            <td class='td'><br> </td>
            <td class='td'> </td>
           </tr>
          <tr>
            <td class='td' style="text-align:right;">Prezzo: </td>
            <td class='td'><input style="color:black" id="dem" type="text" name="price" value="25"  readonly="readonly">&euro;</td>
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