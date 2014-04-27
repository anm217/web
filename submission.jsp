<%-- 
    Document   : submissions
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
    String lang=null,code=null,question=null;
    private static final String url = "jdbc:mysql://localhost";
    private static final String user = "root";
    private static final String password = "1010";
    ResultSet rt=null;
    int runid=0;
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Submission</title>
    </head>
    <body>
        <% 
	    lang=request.getParameter("Language");
	    code=request.getParameter("code");
	    question=request.getParameter("Question");
	    Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection(url, user, password);
	    PreparedStatement pst=con.prepareStatement("INSERT INTO judge.submissions(question,code,language) values(?,?,?)");
	    pst.setString(1,question);
	    pst.setString(2,code);
	    pst.setString(3,lang);
            pst.execute();
	    pst.close();
	    Statement st=con.createStatement();
	    String query="SELECT runid FROM judge.submissions ORDER BY runid DESC LIMIT 1";
	    rt=st.executeQuery(query);
	while(rt.next())
	    runid=Integer.parseInt(rt.getString("runid"));
	    session.putValue("runid",runid);
	    //RequestDispatcher rd = request.getRequestDispatcher("/result.jsp");
            //rd.forward(request, response);
	    response.sendRedirect("result.jsp");
        %>
    </body>
</html>

