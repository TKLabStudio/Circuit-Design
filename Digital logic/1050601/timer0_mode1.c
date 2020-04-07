#include <reg52.h>
#define led P0
bit x=0;
code wtf[]={1,2,4,8,16,32,64,128};
void deplay_10us(unsigned int time)
{
	while(time>0) time--;
}
void timer0() interrupt 1
{
	x=~x;
}
 
 void main()
 {
	 signed int i;
	 TH0=256-3;
	 TL0=256-3;
	 EA=1;
	 ET0=1;
	 TMOD=0X06;
	 TR0=1;
	while(1)
	{
		if(x==0)
		{
		
		led=~wtf[i];
		deplay_10us(20000); 
		if(i>7)  i=0; else i++;
		}
		else
		{
		led=~wtf[i];
		deplay_10us(20000); 
		if(i<1) i=7;else i--;
		}
	}
	 while(1);
}