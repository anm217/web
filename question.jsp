<%-- 
    Document   : question
    Created on : 28 July, 2013, 2:25:30 PM
    Author     : anmol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%!
    String qname=null,question=null,time=null,input=null,output=null;
    private static final String url = "jdbc:mysql://localhost";
    private static final String user = "root";
    private static final String password = "1010";
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
	
	    qname=request.getParameter("qname");
	    question=request.getParameter("question");
	    time=request.getParameter("time");
	    input=request.getParameter("input");
	    output=request.getParameter("output");
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(url, user, password);
	    PreparedStatement pst=con.prepareStatement("INSERT INTO judge.question(qname,question,input,output,time) values(?,?,?,?,?)");
	    pst.setString(1,qname);
	    pst.setString(2,question);
	    pst.setString(5,time);
	    pst.setString(3,input);
            pst.setString(4,output);
	    //String q2="INSERT INTO judge.question(qname,question,input,output,time) values('"+qname+"','"+question+"','"+time+"')";
            pst.execute();
	    pst.close();
        %>
    </body>
</html>

