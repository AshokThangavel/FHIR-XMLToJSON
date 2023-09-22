Class dc.FHIR.XMLToJSON Extends %CSP.Page
{

ClassMethod OnPage() As %Status
{
	write "<link rel=""stylesheet"" href=""https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css"" integrity=""sha384-QYIZto+st3yW+o8+5OHfT6S482Zsvz2WfOzpFSXMF9zqeLcFV0/wlZpMtyFcZALm"" crossorigin=""anonymous"">"
	write "<link rel=""stylesheet"" href=""https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"">"
	write "<link rel=""preconnect"" href=""https://fonts.googleapis.com""><link rel=""preconnect"" href=""https://fonts.gstatic.com"" crossorigin><link href=""https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@200;400&family=Source+Code+Pro&display=swap"" rel=""stylesheet"">"
	do ..LoadSetup()
	write "<title>FHIR XML > JSON</title>"
	&HTML<
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="jquery.json-editor.min.js"></script>
	>
	write "<div>",!
	write "<button class='convert-btn' id='translate' >convert</button>Convert FHIR XML to JSON format</div>",!
	write "<div class='row'>",!
	write "<div class='column'> <textarea style=""width: 100%; height: 100%;"" id='fhirxml'></textarea></div>",!
	write "<div class='column json'> <pre id='json-display'></pre></div>",!
	write "</div>",!
	&HTML<
		<script language="javascript">
			
		!function(){var e='/* Syntax highlighting for JSON objects */ .json-editor-blackbord {   background: #1c2833;   color: #fff;   font-size: 13px;   font-family: Menlo,Monaco,Consolas,"Courier New",monospace; } @media screen and (min-width: 1600px) {   .json-editor-blackbord {     font-size: 14px;   } }  ul.json-dict, ol.json-array {   list-style-type: none;   margin: 0 0 0 1px;   border-left: 1px dotted #525252;   padding-left: 2em; } .json-string {   /*color: #0B7500;*/   /*color: #BCCB86;*/   color: #0ad161; } .json-literal {   /*color: #1A01CC;*/   /*font-weight: bold;*/   color: #ff8c00; } .json-url {   color: #1e90ff; } .json-property {   color: #4fdee5;   line-height: 160%;   font-weight: 500; }  /* Toggle button */ a.json-toggle {   position: relative;   color: inherit;   text-decoration: none;   cursor: pointer; } a.json-toggle:focus {   outline: none; } a.json-toggle:before {   color: #aaa;   content: "\\25BC"; /* down arrow */   position: absolute;   display: inline-block;   width: 1em;   left: -1em; } a.json-toggle.collapsed:before {   transform: rotate(-90deg); /* Use rotated down arrow, prevents right arrow appearing smaller than down arrow in some browsers */   -ms-transform: rotate(-90deg);   -webkit-transform: rotate(-90deg); }   /* Collapsable placeholder links */ a.json-placeholder {   color: #aaa;   padding: 0 1em;   text-decoration: none;   cursor: pointer; } a.json-placeholder:hover {   text-decoration: underline; }',o=function(e){var o=document.getElementsByTagName("head")[0],t=document.createElement("style");if(o.appendChild(t),t.styleSheet)t.styleSheet.disabled||(t.styleSheet.cssText=e);else try{t.innerHTML=e}catch(n){t.innerText=e}};o(e)}(),function(e){function o(e){return e instanceof Object&&Object.keys(e).length>0}function t(e){var o=/^(ftp|http|https):\/\/(\w+:{0,1}\w*@)?(\S+)(:[0-9]+)?(\/|\/([\w#!:.?+=&%@!\-\/]))?/;return o.test(e)}function n(e,r){var s="";if("string"==typeof e)e=e.replace(/&/g,"&amp;").replace(/</g,"&lt;").replace(/>/g,"&gt;"),s+=t(e)?'<a href="'+e+'" class="json-string json-url">"'+e+'"</a>':'<span class="json-string">"'+e+'"</span>';else if("number"==typeof e)s+='<span class="json-literal json-literal-number">'+e+"</span>";else if("boolean"==typeof e)s+='<span class="json-literal json-literal-boolean">'+e+"</span>";else if(null===e)s+='<span class="json-literal json-literal-null">null</span>';else if(e instanceof Array)if(e.length>0){s+='[<ol class="json-array">';for(var l=0;l<e.length;++l)s+="<li>",o(e[l])&&(s+='<a href class="json-toggle"></a>'),s+=n(e[l],r),l<e.length-1&&(s+=","),s+="</li>";s+="</ol>]"}else s+="[]";else if("object"==typeof e){var a=Object.keys(e).length;if(a>0){s+='{<ul class="json-dict">';for(var i in e)if(e.hasOwnProperty(i)){s+="<li>";var c=r.withQuotes?'<span class="json-string json-property">"'+i+'"</span>':'<span class="json-property">'+i+"</span>";s+=o(e[i])?'<a href class="json-toggle"></a>'+c:c,s+=": "+n(e[i],r),--a>0&&(s+=","),s+="</li>"}s+="</ul>}"}else s+="{}"}return s}e.fn.jsonViewer=function(t,r){return r=r||{},this.each(function(){var s=n(t,r);o(t)&&(s='<a href class="json-toggle"></a>'+s),e(this).html(s),e(this).off("click"),e(this).on("click","a.json-toggle",function(){var o=e(this).toggleClass("collapsed").siblings("ul.json-dict, ol.json-array");if(o.toggle(),o.is(":visible"))o.siblings(".json-placeholder").remove();else{var t=o.children("li").length,n=t+(t>1?" items":" item");o.after('<a href class="json-placeholder">'+n+"</a>")}return!1}),e(this).on("click","a.json-placeholder",function(){return e(this).siblings("a.json-toggle").click(),!1}),1==r.collapsed&&e(this).find("a.json-toggle").click()})}}(jQuery),function(e){function o(e){var o={'"':'\\"',"\\":"\\\\","\b":"\\b","\f":"\\f","\n":"\\n","\r":"\\r","	":"\\t"};return e.replace(/["\\\b\f\n\r\t]/g,function(e){return o[e]})}function t(e){if("string"==typeof e)return o(e);if("object"==typeof e)for(var n in e)e[n]=t(e[n]);else if(Array.isArray(e))for(var r=0;r<e.length;r++)e[r]=t(e[r]);return e}function n(o,t,n){n=n||{},n.editable!==!1&&(n.editable=!0),this.$container=e(o),this.options=n,this.load(t)}n.prototype={constructor:n,load:function(e){this.$container.jsonViewer(t(e),{collapsed:this.options.defaultCollapsed,withQuotes:!0}).addClass("json-editor-blackbord").attr("contenteditable",!!this.options.editable)},get:function(){try{return this.$container.find(".collapsed").click(),JSON.parse(this.$container.text())}catch(e){throw new Error(e)}}},window.JsonEditor=n}(jQuery);
		function getJson() {
			  try {
				  value = document.getElementById('fhirxml').value;
					if (value=='') { 
						return
					}
					data = #server(..Test(value))#;
					obj = JSON.parse(data);
			    	return obj;
			  } catch (ex) {
			    alert('Wrong JSON Format: ' + ex);
			  }
		}

		var editor = new JsonEditor('#json-display', getJson());
		
		$('#translate').on('click', function () {
			json = getJson()
			if (json=='') {
				return
			}
		  editor.load(getJson());
		  document.getElementById('json-display').style.display = "block";
		});
		</script>
	>
	return $$$OK
}

ClassMethod Test(file) As %String
{
	#dim ex As %Exception.SystemException
	try {
		set jsonstr = {}
		set file1=##class(%Stream.TmpCharacter).%New()
		do file1.Write($ZCVT(file,"O","UTF8"))
		set schema = ##class(HS.FHIRServer.Schema).%New("HL7v40")
		set json = ##class(HS.FHIRServer.Util.XMLToJSON).XMLToJSON(file1,schema)
		set jsonstr = json.%ToJSON()
	}
	catch ex {
		set jsonstr={"error" : (ex.BinDisplayString())}.%ToJSON()
	}
	return jsonstr
}

ClassMethod LoadSetup()
{
	Do ..cssStyleSheet()
	Write ..HyperEventHead(),!
}

ClassMethod cssStyleSheet()
{
	&HTML<
	<style>
	
	.column {
		float: left;
		  width: 50%;
		  height: 95%;
		  border-radious:10px;
		  box-shadow: 0 0 5px rgba(0, 0, 0.15);
		 font-family:'Source Code Pro', monospace;
		}
	.json {
		box-shadow:5px solid gray;
		background-color:rgb(249 248 249);
		overflow: scroll;
		 border-radious:10px;
		 box-shadow: 0 0 5px rgba(0, 0, 0.15);
		font-family:'Source Code Pro', monospace;
	}
	.convert-btn{
		padding: 5px;
	    text-align: center;
	    color: white;
	    background: #333695;
	    font-family:'Source Code Pro', monospace;
	    cursor:pointer;
	}
	.convert-btn:hover{
		color: #333695;
		background: white;
		cursor: pointer;
	}
	textarea {
	  color: #333695;
	}
	#json-display{
		display:none;
	}
	</style>
	>
}
}