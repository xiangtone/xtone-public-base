<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript" src="jquery-1.7.js"></script>
    

<script>
$(function(){
	alert("load...");
	$("#btn1").on('click',function(){
	    alert("Text: " + $("#test").text());
	    console.log("Text: " + $("#test").text());
	  });
	  $("#btn2").on('click',function(){
	    alert("HTML: " + $("#test").html());
	    console.log("HTML: " + $("#test").html());
	  }); 
	  
	  $("#btn3").on('click',function (){
		  
		  htmlobj = $.ajax({
			  
			  url:"test.txt",
			  async:false
			  
		  });
		  
		  $("#div").html(htmlobj.responseText)
		  
		  
	  });
});
/*
$(document).ready(function(){
	alert("load...");
  $("#btn1").on('click',function(){
    alert("Text: " + $("#test").text());
    console.log("Text: " + $("#test").text());
  });
  $("#btn2").on('click',function(){
    alert("HTML: " + $("#test").html());
    console.log("HTML: " + $("#test").html());
  });  
});*/

</script>

</head>

<body>
<p id="test">这是段落中的<b>粗体</b>文本。</p>
<button id="btn1">显示文本</button>
<button id="btn2">显示 HTML</button>


<button id="btn3">测试</button>
<div id="div">

</div>

</body>

</html>