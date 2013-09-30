<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>


<html>
<head>
	<title>Student Teacher </title>
	
<style>
   
#tabs ul#main {
	list-style: none;
	padding:0;
	margin:0;
	background:purple;
}


#tabs li#main {
	display: inline;
	border: solid;
	border-width: 1px 1px 0 1px;
	margin: 0 0.5em 0 0;
}


#tabs li a {
	padding: 0 0em;
}

#teacher-form{
border: solid;
}


body { font-size: 100%; }
label, input { display:block; }
input.text { margin-bottom:12px; width:95%; padding: .4em; }
fieldset { padding:0; border:0; margin-top:25px; }
h1 { font-size: 1.2em; margin: .6em 0; }
div#users-contain { width: 350px; margin: 20px 0; }
div#users-contain table { margin: 1em 0; border-collapse: collapse; width: 100%; }
div#users-contain table td, div#users-contain table th { border: 1px solid #eee; padding: .6em 10px; text-align: left; }
.ui-dialog .ui-state-error { padding: .3em; }
.validateTips { border: 1px solid transparent; padding: 0.3em; }
</style>
</head>
<body id="mainbody">
<div id="tabs">
<ul id="main">
<li id="main"><a href="#home">Home</a></li>
<li id="main"><a href="#teacher">Teacher</a></li>
<li id="main"><a href="#student">Student</a></li>
</ul>
<div id="home">
<p >Welcome To Student Teacher Relation Site</p>
<ul>
<li><a href="#teacher" id="clickmeteacher">Teacher's Click Here</a></li>
<li><a href="#student" id="clickmestudent">Students Zone</a></li>
</ul>
<p> ${message}</p>
</div>
<div id="teacher">
<p style="{color: "red" }">Welcome Teachers</p>
<button class="create-user">Create new user</button>
</div>
<div id="student">
<p style="{color: "red" }">Welcome Students</p>
<button class="create-user">Create new user</button>
</div>
</div>
<div id="teacher-form" title="Create new Teacher">
<p class="validateTips">All form fields are required.</p>
<form>
<fieldset>
<label for="name">Name</label>
<input type="text" name="name" id="tname" class="text ui-widget-content ui-corner-all" />
<label for="email">Email</label>
<input type="text" name="email" id="temail" value="" class="text ui-widget-content ui-corner-all" />
<label for="password">Password</label>
<input type="password" name="password" id="tpassword" value="" class="text ui-widget-content ui-corner-all" />

</fieldset>
</form>
</div>




<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript">

$("docment").ready(function(){
	var a=$("#tabs").tabs();
	$("#tabs").bind("tabsselect", function(event, ui) { window.location.hash = ui.tab.hash; });
	$("a#clickmeteacher").click(function(){
		a.tabs("option", "active", 1);
		$("#tabs").bind("tabsselect", function(event, ui) { window.location.hash = ui.tab.hash; });
	});
	$("a#clickmestudent").click(function(){
		a.tabs("option", "active", 2);
		$("#tabs").bind("tabsselect", function(event, ui) { window.location.hash = ui.tab.hash; });
	});
	$( "#teacher-form" ).dialog({
		autoOpen: false,
		height: 300,
		width: 350,
		modal: true,
		buttons: {
		"Create an account":function(){
			var teacher = new Object();
		    article.name = $('#title').val();
		    article.url = $('#url').val();
		    article.categories = $('#categories').val().split(";");
		    article.tags = $('#tags').val().split(";");
			 $.ajax({
				 url: '/newteacher',
				 type: 'POST',
				 contentType: 'application/json',
				 data: { json: JSON.stringify({
		                name:"Bob",
		                email:"xyz@xyz.com"
		                
		            })},
				 
				 
			 });
			
		} ,
		Cancel: function() {
		$( this ).dialog( "close" );
		}
		},
		close: function() {
		$( this ).dialog( "close" );
		}
		
		});
	$( ".create-user" )
	.button()
	.click(function() {
	$( "#teacher-form" ).dialog( "open" );
	});
});
</script>


</body>
</html>