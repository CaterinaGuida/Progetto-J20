<!DOCTYPE html>
<html>
   <head>
      <meta charset="ISO-8859-1">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <title>URBAN PAVIA - Pagamento in corso</title>
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
         }
         .row{
         display:flex;
         flex-direction:row;
         align-items:center;
         justify-content:center;
         color:white;
         font-size:1.3rem;
         }
         .column{
         display:flex;
         flex-direction:column;
         align-items:center;
         justify-content:center;
         width:20%;   	
         }
         select{
         font-size:1em;
         width:15%;
         height:35px;
         }
         #but{       
         width:10%;
         height:45px;
         font-size:1em;
         }
         #tot{
     	 font-size:1.5rem;
     	 text-align:center;
     	 }
         #s{  
         background-color:black;
         opacity:0.8;
         height:610px;
         width:auto;
         text-align:center;
         display:none;
         }
         a:hover{
         font-size:3rem;
         color:purple;
         }
         @media only screen and (max-width: 800px){
         select{
         width:25%;
         }
         }
         @media only screen and (max-width: 600px){
         .column{
         width:30%;   	
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
         var page='<%=nextpage%>';
         
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
               alert("L'importo inserito non è sufficiente!");
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
         <br>
         <br>
         <h1>PAGAMENTO</h1>
      </div>
      <div id="content">
         <div class="panel">
            <br>
            <h1 id="text" style="font-size:2em;text-align:center;color:red">Importo: <%=price %>&euro;</h1>
            <div class="row">
               <div class="column">
                  <br>
                  0.05&euro; 
                  <select name="cars" id="car1" onclick="toti()" onmouseover="toti()">
                     <option value=0>0</option>
                     <option value=0.05>1</option>
                     <option value=0.10>2</option>
                     <option value=0.15>3</option>
                     <option value=0.20>4</option>
                     <option value=0.25>5</option>
                  </select>
               </div>
               <div class="column">
                  <br>
                  0.10&euro; 
                  <select name="cars" id="car2" onclick="toti()">
                     <option value=0>0</option>
                     <option value=0.10>1</option>
                     <option value=0.2>2</option>
                     <option value=0.3>3</option>
                     <option value=0.4>4</option>
                     <option value=0.50>5</option>
                  </select>
               </div>
               <div class="column">
                  <br>
                  0.20&euro; 
                  <select name="cars" id="car3" onclick="toti()">
                     <option value=0>0</option>
                     <option value=0.2>1</option>
                     <option value=0.4>2</option>
                     <option value=0.6>3</option>
                     <option value=0.8>4</option>
                     <option value=1>5</option>
                  </select>
               </div>
               <div class="column">
                  <br>
                  0.50&euro; 
                  <select name="cars" id="car4" onclick="toti()">
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
               <div class="column" >
                  <br>
                  <em style="color:black">0.0</em>1&euro; 
                  <select name="cars" id="car5" onclick="toti()">
                     <option value=0>0</option>
                     <option value=1>1</option>
                     <option value=2>2</option>
                     <option value=3>3</option>
                     <option value=4>4</option>
                     <option value=5>5</option>
                  </select>
               </div>
               <div  class="column">
                  <br>
                  <em style="color:black">0.0</em>2&euro; 
                  <select name="cars" id="car6" onclick="toti()">
                     <option value=0>0</option>
                     <option value=2.0>1</option>
                     <option value=4.0>2</option>
                     <option value=6.0>3</option>
                     <option value=8.0>4</option>
                     <option value=10>5</option>
                  </select>
               </div>
               <div  class="column">
                  <br>
                  <em style="color:black">0.0</em>5&euro; 
                  <select name="cars" id="car7" onclick="toti()">
                     <option value=0>0</option>
                     <option value=5.0>1</option>
                     <option value=10.0>2</option>
                     <option value=15.0>3</option>
                     <option value=20.0>4</option>
                     <option value=25>5</option>
                  </select>
               </div>
               <div  class="column">
                  <br>
                  <em style="color:black">0.0</em>10&euro; 
                  <select name="cars" id="car8" onclick="toti()">
                     <option value=0>0</option>
                     <option value=10.0>1</option>
                     <option value=20.0>2</option>
                     <option value=30>3</option>
                     <option value=40>4</option>
                     <option value=50>5</option>
                  </select>
               </div>
            </div>
            <div class="row">
               <div class="column">
                  <br>
                  <em style="color:black">0.0</em> 20&euro; 
                  <select name="cars" id="car9" onclick="toti()">
                     <option value=0>0</option>
                     <option value=20>1</option>
                     <option value=40>2</option>
                     <option value=60>3</option>
                     <option value=80>4</option>
                     <option value=100>5</option>
                  </select>
               </div>
               <div class="column">
                  <br>
                  <em style="color:black">0.0</em> 50&euro; 
                  <select name="cars" id="car10" onclick="toti()">
                     <option value=0>0</option>
                     <option value=50>1</option>
                     <option value=100>2</option>
                     <option value=150>3</option>
                     <option value=200>4</option>
                     <option value=250>5</option>
                  </select>
               </div>
               <div class="column">
                  <br>
                  <em style="color:black">0</em>100&euro; 
                  <select name="cars" id="car11" onclick="toti()">
                     <option value=0>0</option>
                     <option value=100>1</option>
                     <option value=200>2</option>
                     <option value=300>3</option>
                     <option value=400>4</option>
                     <option value=500>5</option>
                  </select>
               </div>
               <div class="column">
                  <br>
                  <em style="color:black">0</em> 500&euro; 
                  <select name="cars" id="car12" onclick="toti()">
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
            <br>
            <h1 style="font-size:2em;color:green"> Importo inserito (&euro;): </h1>
            <input id="tot" type="text" name="" value="0" readonly="readonly"><br><br>
            <input id="but" type="button" name="" value="Paga" onclick="validation()">
         </div>
      </div>
      <div id="s">
         <br>
         <br>
         <h1 style="text-align:left;padding-left:80px;color:green;font-style:italic">Il pagamento è avvenuto con successo!</h1>
         <br>
         <br>
         <h1 style="text-align:left;padding-left:80px" id="resto">RESTO:</h1>
         <br>
         <br>
         <br>
         <br>
         <br>
         <br>
         <h1 style="text-align:center;font-size:2.5rem"><a href="<%=nextpage%>">Clicca qui per SCARICARE il titolo di viaggio!</a></h1>
      </div>
   </body>
</html>