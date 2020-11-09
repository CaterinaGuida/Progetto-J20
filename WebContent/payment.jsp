<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>URBAN PAVIA - Pagamento in corso</title>
<style type="text/css">
	html{
		font-size:20px;
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
    h1{
      	margin-top:34px;
      	text-align:center;
      	font-family:sans-serif;
        font-style:bold;
        font-size:3rem;
        color:white;  
    }
    #content{
        position:absolute;
		margin-left:auto;
		margin-right:auto;
		left:0;
		right:0;
		top:0;
		margin-top:150px;
		width:100%;    
        background-color:black;
        opacity:0.8;
        height:100%;
    }
    .row{
      	display:flex;
  		flex-direction:row;
      	color:white;
      	font-size:1.3rem;
    }
    .column{
      	display:flex;
  		flex-direction:column;
      	width:100%;
      	margin-left:10%;   
    }
    select{
      	font-size:1rem;
      	width:17%;
      	height:35px;
    }
    #to{
      	position:absolute;
	  	margin-left:auto;
	  	margin-right:auto;
	  	left:0;
	  	right:0;
	  	top:0;
	  	margin-top:410px;
	  	margin-left:26%;
      	font-size:2rem;
    }
    #tot{
     	font-size:1.5rem;
     	text-align:center;
    }
    em{
     	color:green;
     	display:inline;
    }
    #but{
	    position:absolute;
	 	margin-left:auto;
	 	margin-right:auto;
	 	left:0;
	 	right:0;
	 	top:0;
	    margin-top:500px;
	    width:10%;
	    height:45px; 
    }
    #s{
       	position:absolute;
	 	margin-left:auto;
	 	margin-right:auto;
	 	left:0;
	 	right:0;
	 	top:0;
	 	margin-top:150px;
	 	width:100%;    
        background-color:black;
        opacity:0.8;
        height:100%;
        display:none;
    }
    a:hover{
      	font-size:3rem;
      	color:purple;
    }
      
    @media only screen and (max-width: 1200px){
    #but{
     	margin-top:470px;
     	width:12%;
    }
    #content{
        height:600px;
    }
    }
      
    @media only screen and (max-width: 1000px){
    select{
      	font-size:0.5rem;
      	width:22%;
    }
    #but{
     	margin-top:520px;
     	width:20%;
    }
    #content{
        height:600px;
    }
    }
   
    @media only screen and (max-width: 600px) {
    html{
		font-size:15px;
	}
	.row{
      	font-size:1rem;
    }
    select{
      	width:40%;
    }
    #to{
        margin-top:300px;
      	font-size:1rem;
    }
    #tot{
		font-size:1rem;
    }
    #but{
        margin-top:360px;
     	width:20%;
    }
    #content{
        height:600px;
    }
    }
  
</style>
 <% 	
 		String price=request.getParameter("price"); 
    	String type=request.getParameter("type");
    	String nextpage="";
    	
    	if(type.equals("single")){
    		nextpage="Bigliettosingolo";
    	}
    	else if(type.equals("cumulative")){
    		nextpage="Bigliettocumulativo";
    		int tripsNum=Integer.parseInt(request.getParameter("tripsNum"));
    		double prez=Double.parseDouble(price);
    		session.setAttribute("tripsNum",tripsNum);
    		session.setAttribute("price",prez);
    	}
    	else{
    		nextpage="Abbonamento";
    		String name=request.getParameter("name");
    		String surname=request.getParameter("surname");
    		String duration=request.getParameter("duration");
    		double prez=Double.parseDouble(price);
    		session.setAttribute("firstName",name);
    		session.setAttribute("lastName",surname);
    		session.setAttribute("duration",duration);
    		session.setAttribute("price",prez);
    	}
    %>
    
<script type="text/javascript">

      var total= 0.0;
      var importo=<%=price%>;
      var page='<%= nextpage%>';
      
      function initialize(){
        for (let i = 1; i < 13; i++) {
          document.getElementById('car'+i).value=0;
      }
      document.getElementById('tot').value=0;
      }

      function toti(){
        document.getElementById('tot').value=0.0;
        for (let i = 1; i < 13; i++) {
            document.getElementById('tot').value=(parseFloat(document.getElementById('tot').value)+document.getElementById('car'+i).value*1.0).toFixed(2);
        }
      }
      setInterval(function(){toti()},500);
      
      function validation(){
          if(parseFloat(document.getElementById('tot').value)<importo){
            alert("L'importo inserito non � sufficiente!");
          }
          else{
          	document.getElementById('content').style.display='none';
          	document.getElementById('resto').innerHTML +="&nbsp "+(parseFloat(document.getElementById('tot').value -importo)).toFixed(2)+'&euro; ';
          	document.getElementById('s').style.display='block';
          }
        }

   </script>
</head>
<body>
  <div id="head">
      <h1>PAGAMENTO</h1>
   </div>
   <div id="content">
   <h2 id="text" style="color:white;font-size:2rem;margin-top:20px;text-align:center;padding-bottom:5px">Importo: <%=price %>&euro;</h2>
   <div class="row">
   		<div class="column">0.05&euro; <select name="cars" id="car1" onclick="toti()" onmouseover="toti()">
                <option value=0>0</option>
                <option value=0.05>1</option>
                <option value=0.10>2</option>
                <option value=0.15>3</option>
                <option value=0.20>4</option>
                <option value=0.25>5</option>
                </select>
          </div>
          <div class="column">0.10&euro; <select name="cars" id="car2" onclick="toti()">
                <option value=0>0</option>
                <option value=0.10>1</option>
                <option value=0.2>2</option>
                <option value=0.3>3</option>
                <option value=0.4>4</option>
                <option value=0.50>5</option>
                </select>
          </div>
          <div class="column">0.20&euro; <select name="cars" id="car3" onclick="toti()">
            <option value=0>0</option>
            <option value=0.2>1</option>
            <option value=0.4>2</option>
            <option value=0.6>3</option>
            <option value=0.8>4</option>
            <option value=1>5</option>
            </select>
           </div>
           <div class="column">0.50&euro; <select name="cars" id="car4" onclick="toti()">
              <option value=0>0</option>
              <option value=0.5>1</option>
              <option value=1.0>2</option>
              <option value=1.5>3</option>
              <option value=2.0>4</option>
              <option value=2.5>5</option>
            </select>
            </div>
   </div>
   <div class="row">
   		<div class="column" ><em style="color:black">0.0</em>1&euro; <select name="cars" id="car5" onclick="toti()">
                <option value=0>0</option>
                <option value=1>1</option>
                <option value=2>2</option>
                <option value=3>3</option>
                <option value=4>4</option>
                <option value=5>5</option>
                </select>
          </div>
          <div  class="column"><em style="color:black">0.0</em>2&euro; <select name="cars" id="car6" onclick="toti()">
               <option value=0>0</option>
                <option value=2.0>1</option>
                <option value=4.0>2</option>
                <option value=6.0>3</option>
                <option value=8.0>4</option>
                <option value=10>5</option>
                </select>
          </div>
          <div  class="column"><em style="color:black">0.0</em>5&euro; <select name="cars" id="car7" onclick="toti()">
	            <option value=0>0</option>
	            <option value=5.0>1</option>
	            <option value=10.0>2</option>
	            <option value=15.0>3</option>
	            <option value=20.0>4</option>
	            <option value=25>5</option>
            	</select>
            </div>
           <div  class="column"><em style="color:black">0.0</em>10&euro; <select name="cars" id="car8" onclick="toti()">
              <option value=0>0</option>
              <option value=10.0>1</option>
              <option value=20.0>2</option>
              <option value=30>3</option>
              <option value=40>4</option>
              <option value=50>5</option>
            </select></div>
   </div>
   <div class="row">
   	<div class="column"> <em style="color:black">0.0</em> 20&euro; <select name="cars" id="car9" onclick="toti()">
                <option value=0>0</option>
                <option value=20>1</option>
                <option value=40>2</option>
                <option value=60>3</option>
                <option value=80>4</option>
                <option value=100>5</option>
                </select>
      </div>
      <div class="column"> <em style="color:black">0.0</em> 50&euro; <select name="cars" id="car10" onclick="toti()">
                <option value=0>0</option>
                <option value=50>1</option>
                <option value=100>2</option>
                <option value=150>3</option>
                <option value=200>4</option>
                <option value=250>5</option>
                </select>
          </div>
         <div class="column"> <em style="color:black">0</em>100&euro; <select name="cars" id="car11" onclick="toti()">
            <option value=0>0</option>
            <option value=100>1</option>
            <option value=200>2</option>
            <option value=300>3</option>
            <option value=400>4</option>
            <option value=500>5</option>
            </select>
           </div>
          <div class="column"><em style="color:black">0</em> 500&euro; <select name="cars" id="car12" onclick="toti()">
            <option value=0>0</option>
              <option value=500>1</option>
              <option value=1000>2</option>
              <option value=1500>3</option>
              <option value=2000>4</option>
              <option value=2500>5</option>
            </select>
          </div>
   </div>
   <br>
   <br>
   <div id="to"><em >Importo inserito (&euro;): <input id="tot"  type="text" name="" value="0" readonly="readonly"></em></div>
   <input  id="but" type="button" name="" value="paga" onclick="validation()">
   </div>
   <div id="s">
		<h1>Il pagamento � avvenuto con successo!</h1>
		<h1 id="resto">RESTO:</h2><br>
		<h2 style="text-align:center;  font-size:2.5rem"><a href="<%=nextpage%>">Clicca qui per SCARICARE il titolo di viaggio!</a><h2>
    </div>
</body>
</html>