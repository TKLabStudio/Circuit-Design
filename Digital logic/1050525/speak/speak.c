#include <regx52.h>
#define  SP P0_0
code char wtf[]={0xf9,0x7d,0xfc,0xbf};
unsigned char scale;
void deplay(unsigned int t)
{ while(t>0) t--;	}

void main()
{
	unsigned char i;
	EA=1;ET0=1;
	TMOD=0X01;
	while(1)
	{
		TR0=1;
			for(i=0;i<20;i++)
				{
				scale=0;
				deplay(2500);
				scale=1;
				deplay(2500);
				}
			TR0=0;
				for(i=0;i<4;i++)
				{deplay(50000);}
		}
}
void timer0() interrupt 1
{
	TH0=wtf[scale*2];
	TL0=wtf[scale*2+1];
	SP=!SP;
}