import java.io.*;
import java.math.*;
import java.util.*;
class Solution{
    public static void main(String[] args)throws IOException{
       BigInteger n = new BigInteger("0"); 
        int t=0;
        BigInteger one = new BigInteger("1");
        Scanner d=new Scanner(System.in);
        t=d.nextInt();
        while(t>0)
   {	
   n=d.nextBigInteger();
   while(!n.isProbablePrime(200))
			{
				n=n.subtract(one);
			}
   System.out.println(n);
   t--;
   }
   }
 
} 