#include<stdio.h>
#include<string.h>
#include<time.h>
 
#define VAL 1000000000
 
long long int multiply2(long long int a,long long int b,long long int mod)
{
long long int div = ((double)a*b /mod) - 1;
return (a*b - div*mod)%mod;
}
 
long long int multiply(long long int a,long long int b,long long int mod)
{
long long int res=0;
while(a>0)
{
if(a&1)
res=(res+b)%mod;
 
a=a>>1;
b=(2*b)%mod;
}
return res;
}
 
long long int power(long long int a,long long int b,long long int mod)
{
long long int res;
if(b==0)
return 1;
 
res=power(a,b/2,mod);
res=multiply2(res,res,mod);
 
if(b%2==1)
res=multiply2(res,a,mod);
 
return res;
}
 
int witness(long long int a,long long int n)
{
long long int n1=n-1;
 
int t1=0;
while(n1%2==0)
{
t1++;
n1=n1>>1;
}
 
long long int d=power(a,n1,n);
 
while(t1--)
{
long long int x=d;
d=multiply2(d,d,n);
 
if(d==1 && x!=1 && x!=n-1)
return 1;
}
 
if(d!=1)
return 1;
return 0;
 
}
int millerrabin(long long int n,int s)
{
int i;
long long int a;
 
for(i=0;i<s;i++)
{
if(n<VAL)
a=(rand()%(n-1))+1;
else
a=(rand()%VAL)+1;
 
//printf("a:%lld\n",a);
 
if(witness(a,n))
return 1;
 
// printf("\nStill here");
}
return 0;
}
 
int main()
{
 
int t;
scanf("%d",&t);
 
while(t--)
{
long long int n;
scanf("%lld",&n);
 
if(n%2==0 && n!=2)
n=n-1; // n cannot be prime
 
int s=4;
int flag=1;
while(flag)
{
int zz=millerrabin(n,s); // n number to be tested and s: no of random 'a' to be selected or the no of iterations
flag=zz; // 1 if composite
 
//printf("%d %d\n",flag,zz);
 
if(!flag)
break;
 
if(zz)
n=n-2;
}
printf("%lld\n",n);
}
return 0;
}