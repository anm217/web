<%--
    Document   : compile
    Created on : 26 Jul, 2013, 10:42:28 PM
    Author     : anmol
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.io.*" %>
<%@page import="java.util.*" %>
<%@page import="java.Math.*" %>
<%@page import="java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<% response.setHeader("Refresh","20"); %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
		<h1>THANKS FOR SUBMISSION</h1>
		<%! 
			String s1="",ans1="",line="",input="",output="",s="",result="";
			String sourcecode="",ans="",lang="",question="",lmt="";
			int flag=1,runid=0;
			float answer=0,limit=0;
			double time=0;
			private static final String url = "jdbc:mysql://localhost";
   			private static final String user = "root";
   	 		private static final String password = "1010";
			ResultSet r1=null,r2=null;
		%>
        <%
			Class.forName("com.mysql.jdbc.Driver").newInstance();
            		Connection con = DriverManager.getConnection(url, user, password);
			Statement st=con.createStatement();
			String query="SELECT runid,question,code,language from judge.submissions where result is null";
			r1=st.executeQuery(query);
	while(r1.next()){
			runid=Integer.parseInt(r1.getString(1));
			question=r1.getString(2);
			sourcecode=r1.getString(3);
			lang=r1.getString(4);
			FileWriter fw;
			File fex=new File("/usr/share/tomcat6-compiler/web/Flag.txt");
			fex.delete();
			Statement st1=con.createStatement();
			String q="SELECT input,output,time from judge.question where qname='"+question+"'";
			r2=st1.executeQuery(q);
		while(r2.next()){ 
			String q1=r2.getString(3);
			input=r2.getString(1);
			output=r2.getString(2); 
			File fe=new File("/usr/share/tomcat6-compiler/web/in.txt");	
			fw=new FileWriter(fe);
			fw.write(input);
			fw.flush();
			fw.close();
			fe=new File("/usr/share/tomcat6-compiler/web/output.txt");	
			fw=new FileWriter(fe);
			fw.write(output);
			fw.flush();
			fw.close();	
			limit=Float.parseFloat(q1);
		}
		if(lang.equals("Java")){
			limit=limit*3;
			lmt=limit+"s";
        		File f=new File("/usr/share/tomcat6-compiler/web/Solution.java");
        		fw=new FileWriter(f);
        		fw.write(sourcecode);
        		fw.flush();
        		fw.close();
			Runtime rt = Runtime.getRuntime() ;
        		Process process=Runtime.getRuntime().exec("/usr/share/tomcat6-compiler/web/anmol"+" "+lmt);
			while(!fex.exists()){
			}	
			f=new File("/usr/share/tomcat6-compiler/web/Solution.class");
			if(!f.exists()){
				
				InputStream error=process.getErrorStream();
				InputStreamReader iserror=new InputStreamReader(error);
				BufferedReader bre=new BufferedReader(iserror);
				out.println("<h1>Compilation Error</h1>");
				result="CE";
				PreparedStatement ps=con.prepareStatement("UPDATE judge.submissions SET result='"+result+"' WHERE runid="+runid+"");
				ps.execute();
				while((line=bre.readLine()) !=null)
					out.println("<b>"+line+"</b>");
				flag=0;
			}	
			else{
				f=new File("/usr/share/tomcat6-compiler/web/Solution.class");
				f.delete();
				flag=1;
			}
		}
		else if(lang.equals("C++")){
			lmt=limit+"s";
			File f=new File("/usr/share/tomcat6-compiler/web/code.cpp");
        		fw=new FileWriter(f);
        		fw.write(sourcecode);
        		fw.flush();
        		fw.close();
			Runtime rt = Runtime.getRuntime() ;
        		Process process=Runtime.getRuntime().exec("/usr/share/tomcat6-compiler/web/anm2"+" "+lmt);
			while(!fex.exists()){
			}
			f=new File("/usr/share/tomcat6-compiler/web/a.out");
			if(!f.exists()){
				InputStream error=process.getErrorStream();
				InputStreamReader iserror=new InputStreamReader(error);
				BufferedReader bre=new BufferedReader(iserror);
				out.println("<h1>Compilation Error</h1>");
				result="CE";
				PreparedStatement ps=con.prepareStatement("UPDATE judge.submissions SET result='"+result+"' WHERE runid="+runid+"");
				ps.execute();
				while((line=bre.readLine())!=null)
					out.println("<b>"+line+"</b>");
				flag=0;
			}	
			else{
				f=new File("/usr/share/tomcat6-compiler/web/error.txt");
				FileReader fe=new FileReader(f);
				BufferedReader be=new BufferedReader(fe);
				if(f.exists() && (line=be.readLine())!=null){
					out.println("<b>Runtime Error</b>");
					result="RE";
					PreparedStatement ps=con.prepareStatement("UPDATE judge.submissions SET result='"+result+"' WHERE runid="+runid+"");
				ps.execute();
					out.println("<b>"+line+"</b>");
					while((line=be.readLine())!=null)
						out.println("<b>"+line+"</b>");
					flag=0;
					f=new File("/usr/share/tomcat6-compiler/web/a.out");
					f.delete();
				}
				else{
					f=new File("/usr/share/tomcat6-compiler/web/a.out");
					f.delete();
					flag=1;
				}
			}
		}
		else{
			lmt=limit+"s";
			File f=new File("/usr/share/tomcat6-compiler/web/code.c");
        		fw=new FileWriter(f);
        		fw.write(sourcecode);
        		fw.flush();
        		fw.close();
        		Process process=Runtime.getRuntime().exec("/usr/share/tomcat6-compiler/web/anm1"+" "+lmt);
			while(!fex.exists()){
			}
			f=new File("/usr/share/tomcat6-compiler/web/a.out");
			if(!f.exists()){
				InputStream error=process.getErrorStream();
				InputStreamReader iserror=new InputStreamReader(error);
				BufferedReader bre=new BufferedReader(iserror);
				out.println("<h1>Compilation Error</h1>");
				result="CE";
				PreparedStatement ps=con.prepareStatement("UPDATE judge.submissions SET result='"+result+"' WHERE runid="+runid+"");
				ps.execute();
				while((line=bre.readLine())!=null)
					out.println("<b>"+line+"</b>");
				flag=0;
			}	
			else{
				f=new File("/usr/share/tomcat6-compiler/web/error.txt");
				FileReader fe=new FileReader(f);
				BufferedReader be=new BufferedReader(fe);
				if(f.exists() && (line=be.readLine())!=null){
					out.println("<b>Runtime Error</b>");
					result="RE";
					PreparedStatement ps=con.prepareStatement("UPDATE judge.submissions SET result='"+result+"' WHERE runid="+runid+"");
					ps.execute();
					out.println("<b>"+line+"</b>");
					while((line=be.readLine())!=null)
						out.println("<b>"+line+"</b>");
					flag=0;
					f=new File("/usr/share/tomcat6-compiler/web/a.out");
					f.delete();
				}	
				else{
					f=new File("/usr/share/tomcat6-compiler/web/a.out");
					f.delete();
					flag=1;
				}
			}
		}
		if(flag!=0){
			ans=null;ans1=null;
			FileReader fr=new FileReader("/usr/share/tomcat6-compiler/web/output.txt");
			BufferedReader br=new BufferedReader(fr);
			while((s=br.readLine())!=null)
			{
				ans=ans+s;
				//System.out.println(s);
			}
			FileReader fr1=new FileReader("/usr/share/tomcat6-compiler/web/out1.txt");
			BufferedReader br1=new BufferedReader(fr1);
			while((s1=br1.readLine())!=null)
			{
				ans1=ans1+s1;
				//System.out.println(s1);
			}
			FileReader ft=new FileReader("/usr/share/tomcat6-compiler/web/time1.txt");
			BufferedReader brt=new BufferedReader(ft);
			String start=brt.readLine();
			Float stt=Float.valueOf(start);
			answer=Float.valueOf(stt);
			answer=Float.valueOf(answer/1000);
			double round=Math.round(answer*100.0)/100.0;
			time=round;
			if(ans.equals(ans1))
			{
				out.println("<h1>ACCEPTED<h1>");
				result="AC";
				out.println("<b>Time Taken:</b>");
				out.println("<b>"+time+"</b>");
				
			}
			else{
				File ff=new File("/usr/share/tomcat6-compiler/web/error.txt");
				FileReader fe=new FileReader(ff);
				BufferedReader be=new BufferedReader(fe);
				if(time>limit){
					out.println("<b>Time Limit Exceded</b>");
					result="TLE";
				}
				else if(ff.exists() && be.readLine()!=null){
					out.println("<b>Runtime Error::</b>");
					result="RE";
					while((line=be.readLine())!=null)
						out.println("<b>"+line+"</b>");
				}
				else{
					out.println("<h1>NOT ACCEPTED<h1>");
					result="WA";
				}	
			}
			fw=new FileWriter("/usr/share/tomcat6-compiler/web/out1.txt");
			fw.flush();
			fw.close();
			PreparedStatement pst=con.prepareStatement("UPDATE judge.submissions SET runtime="+time+" , result='"+result+"' WHERE runid="+runid+"");
			pst.execute();
		}
			File f=new File("/usr/share/tomcat6-compiler/web/error.txt");
			f.delete();
			f=new File("/usr/share/tomcat6-compiler/web/Flag.txt");
			f.delete();
			fw=new FileWriter("/usr/share/tomcat6-compiler/web/in.txt");
			fw.flush();
			fw.close();
			fw=new FileWriter("/usr/share/tomcat6-compiler/web/output.txt");
			fw.flush();
			fw.close();
	}
    	%>
    </body>
</html>
