<%-- 
    Document   : result
    Created on : 2 September, 2013, 7:25:30 PM
    Author     : anmol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.http.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%!
    String lang=null,code=null,question=null,result=null;
    private static final String url = "jdbc:mysql://localhost";
    private static final String user = "root";
    private static final String password = "1010";
    String runtime=null;
    int runid=0;
    ResultSet rt1=null;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result</title>
    </head>
    <body>
	<center>
	<h1>Thanks for Submission </h1>
	</center>
        <% 
	    runid=Integer.parseInt((session.getValue("runid").toString()));
	while(result==null){
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(url, user, password);
	    Statement st=con.createStatement();
	    String query="SELECT runtime,result from judge.submissions where runid="+runid;
	    rt1=st.executeQuery(query);
	    while(rt1.next()){
	    	runtime=rt1.getString("runtime");
	    	result=rt1.getString("result");	
	    }
	}
	    if(result.equals("AC") || result.equals("WA") || result.equals("TLE")){
		out.println("<b>"+result+"</b>");
		out.println("<b>Time Taken:</b>");
		out.println("<b>"+runtime+"</b>");
	    }
	    else
		out.println("<b>"+result+"</b>");
        %>
    </body>
</html>

