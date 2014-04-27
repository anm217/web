<%-- 
    Document   : interface
    Created on : 28 Jul, 2013, 2:17:42 AM
    Author     : anmol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Interface</title>
    </head>
    <body>
	<h1>Interface for submitting question</h1>
        <form action="question.jsp" method="POST">
		<table>
		<tr><td><left><b>Question name:<input type="text" name="qname" value=""></td></tr>
		<tr><td><left><b>Time Limit:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <input type="text" name="time" value=""></td></tr>
	   	
<tr><td width="200"><b>Input:<br> 
<textarea rows="50" cols="20" name="input"
    style="max-height:350px;min-height:100px;"></textarea></td>
<td><b>Output:<br>
<textarea rows="50" cols="20" name="output"
    style="max-height:350px;min-height:100px;"></textarea></td><td width="300"></td><td width="300"></td></tr>
<tr><td colspan="3"><b>Question:<br>
<textarea rows="50" cols="120" name="question"
    style="max-height:350px;min-height:100px;"></textarea></td></tr>
	</table>
        <input type="submit" value="Submit" name="submit" />
        </form>
    </body>
</html>

