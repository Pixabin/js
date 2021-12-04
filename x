var CreateCSS=document.createElement("style");
CreateCSS.innerHTML=`
#alexaChecker{background-color:#fff;font-family:"Noto Sans",sans-serif;text-align:center;margin:auto;padding:20px;border:0;border-radius:10px;box-shadow:0 0 8px 0 rgba(0,0,0,.08)}
#alexaTitle{color:#666;font-size:25px;font-weight:bold;margin-bottom:20px}
#alexaChecker div input{background-color:#f6f6f6;font-family:"Fira Mono",monospace;font-size:13px;text-align:center;padding:25px;border:1px solid #f6f6f6;border-radius:99em}
#alexaChecker div input:focus{background-color:#fff;border:1px solid #e6e6e6}
#alexaChecker div input::placeholder{color:#aaa;text-align:center}
#alexaInput{width:100%;height:30px;padding-left:5px;outline:none}
#alexaButton{background-color:#009ee0;color:#fff;font-size:13px;margin:20px 0 10px;padding:15px;border:0;border-radius:99em;cursor:pointer}
#alexaButton:hover{background-color:rgba(0,158,224,.8);color:#fff}
#alexaRank{color:#009ee0;font-size:30px;font-weight:bold;margin:15px 0}
#alexaInfo{color:#333;font-size:13px}
`;
document.body.append(CreateCSS);
var dataValue=0;
if (document.getElementById("alexaChecker")){
    document.getElementById("alexaChecker").innerHTML=`
<div id="alexaTitle">Alexa Rank Checker</div>
<div><input id="alexaInput" placeholder="Paste your domain here..." spellcheck="false"/></div>
<div><button id="alexaButton">Check</button></div>
<div id="alexaRank">-</div>
<div id="alexaInfo">Click the button and get your Alexa Rank!</div>
`;
  document.getElementById("alexaButton").addEventListener("click",function(){
    var dataUrl=document.getElementById("alexaInput").value;
    if(dataUrl.indexOf("http://")>=0||dataUrl.indexOf("https://")>=0 ){
    	dataUrl=dataUrl
    }else{
    	dataUrl="http://"+dataUrl
    }
    document.getElementById("alexaRank").innerText="---";
        var xhr=new XMLHttpRequest();
        xhr.open("POST","https://apialexa.maskoding.com/",true);
        xhr.onreadystatechange=function(){
            if (xhr.readyState==4){ 
                if(xhr.status==200){
                   	var db=JSON.parse(xhr.responseText);
                  	document.getElementById("alexaRank").innerText =db.data
                 }
            }
        }
        xhr.onerror=function(){ 
         setTimeout(function(){
         document.getElementById("alexaButton").click();
         },1000)
        }
        xhr.send(JSON.stringify({
          "data":dataUrl
        }))
  })
}
