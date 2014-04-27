import java.io.*;
import java.util.*;
class time{
	public static void main(String[] args)throws IOException{
		FileReader ft=new FileReader("/usr/share/tomcat6-compiler/web/time1.txt");
		BufferedReader brt=new BufferedReader(ft);
		String start=brt.readLine();
		Float st=Float.valueOf(start);
		float ans=Float.valueOf(st/1000);
		System.out.println(ans);
	}
}
