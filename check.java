import java.io.*;

class check{

public static void main(String[] args) throws IOException{
String s="",ans="";
FileReader fr=new FileReader("output.txt");
BufferedReader br=new BufferedReader(fr);
while((s=br.readLine())!=null)
{
ans=ans+"\n"+s;
//System.out.println(s);
}
String s1="",ans1="";
FileReader fr1=new FileReader("out1.txt");
BufferedReader br1=new BufferedReader(fr1);
while((s1=br1.readLine())!=null)
{
ans1=ans1+"\n"+s1;
//System.out.println(s1);
}
if(ans.equals(ans1))
System.out.println("Accepted");
else
System.out.println("Fuck off");
}
}