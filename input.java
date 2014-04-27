import java.util.*;
import java.io.*;
class input{
	public static void main(String[] args)throws IOException{
		File fi=new File("/usr/share/tomcat6-compiler/web/in.txt");
		PrintWriter fwi=new PrintWriter(new FileWriter(fi));
		Random random=new Random();
		int t=500;
		fwi.write(t + "\n");
		for(int i=0;i<t;i++){
			long a=random.nextInt((int)(Math.pow(10,12)))+1;
			fwi.write(a+"\n");
		}
		fwi.close();
	}
}
