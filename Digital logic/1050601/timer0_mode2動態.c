#include <reg52.h>
#define led P0

void deplay_10us(unsigned int time)
{
	while(time>0) time--;
}
void timer0() interrupt 1
 {
	while(1)
	{
		if(TL0==0XFF)
		{
		code wtf[]={128,64,32,16,8,4,2,1};
		int i;
		for(i=0;i<8;i++)
		{
		led=~wtf[i];
		deplay_10us(20000);
		}
	}
	}
}
 
 void main()
 {
	 TH0=256-3;
	 TL0=256-3;
	 EA=1;
	 ET0=1;
	 TMOD=0X06;
	 TR0=1;
	while(1)
	{
		code wtf[]={1,2,4,8,16,32,64,128};
		int i;
		for(i=0;i<8;i++)
		{
		led=~wtf[i];
		deplay_10us(20000);
		}	
	}
	 while(1);
}