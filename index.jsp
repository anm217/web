<%-- 
    Document   : index
    Created on : 26 Jul, 2013, 2:17:42 AM
    Author     : anmol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doku Wiki</title>
    </head>
    <body>
	<h1>Submit code here</h1>
	<h2>In java use class name Solution</h2>
        <form action="submission.jsp" method="POST">
		<table>
        <tr><th> Language : </th><td><select name="Language">
            <option>C</option>
            <option>Java</option>
			<option>C++</option>
        </select> </td> </tr>
	<tr><th> Question : </th><td><select name="Question">
		<option>WITMATH</option>
		<option>XBITOP</option>
		</select></td></tr>
		<tr><td colspan='4' style='padding: 0;border-bottom: 1px solid #ddd;'>
<textarea rows="50" cols="120" name="code"
    style="max-height:350px;min-height:100px;"></textarea></td></tr>
	</table>
        <input type="submit" value="Submit" name="submit" />
        </form>
    </body>
</html>
