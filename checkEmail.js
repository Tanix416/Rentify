
function func1(p1)
{
    //alert(p1)
    xmlHttp=GetXmlHttpObject()
    //alert(xmlHttp);
    url="Email-check.jsp?email="+p1;    
    //alert(url);
    xmlHttp.onreadystatechange=stateChanged1
    xmlHttp.open("GET",url,true)
    xmlHttp.send(null)
}

function stateChanged1() 
{ 
	
	var showdata = xmlHttp.responseText; 
	//alert(showdata);
    if(showdata==1){
    document.registration.email.value="";
    document.getElementById("result1").innerHTML="<font color=red>Email Alredy Exsist</font>";
  }
  else{
    document.getElementById("result1").innerHTML="<font color=green>Email does not exsist</font>";
  }
}

function func2(p2)
{
    //alert(p2)
    xmlHttp=GetXmlHttpObject()
    //alert(xmlHttp);
    url="Email-check1.jsp?email="+p2;    
    //alert(url);
    xmlHttp.onreadystatechange=stateChanged2
    xmlHttp.open("GET",url,true)
    xmlHttp.send(null)
}

function stateChanged2() 
{ 
	
	var showdata = xmlHttp.responseText; 
	//alert(showdata);
    if(showdata==1){
    document.registration.renter_email.value="";
    document.getElementById("result2").innerHTML="<font color=red>Email Alredy Exsist</font>";
  }
  else{
    document.getElementById("result2").innerHTML="<font color=green>Email does not exsist</font>";
  }
}

function GetXmlHttpObject()
{
var xmlHttp=null;
try
 {
 // Firefox, Opera 8.0+, Safari
 xmlHttp=new XMLHttpRequest();
 }
catch (e)
 {
 //Internet Explorer
 try
  {
  xmlHttp=new ActiveXObject("Msxml2.XMLHTTP");
  }
 catch (e)
  {
  xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
 }
return xmlHttp;
}
