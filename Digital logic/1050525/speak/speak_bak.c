#include <regx52.h>
#define  SP P0_0
code char wtf[]={0xfc,0x0c,
									0xfc,0x44,
									0xfc,0xac,
									0xfd,0x09,
									0xfd,0x34,
									0xfd,0x82,
									0xfd,0xc8,
									0xfe,0x06,
									0xfe,0x22,
									0xfe,0x56,
									0xfe,0x85};
code char song[]={5,4,3,4,3,8,4,4,2,4,2,8,
									1,4,2,4,3,4,4,4,5,4,5,4,5,8,
									5,4,3,4,3,8,4,4,2,4,2,8,
									1,4,3,4,5,4,5,4,3,16,
									2,4,2,4,2,4,2,4,2,4,3,4,4,8,
									3,4,3,4,3,4,3,4,3,4,4,4,5,8,
									5,4,3,4,3,8,4,4,2,4,2,8,
									1,4,3,4,5,4,5,4,1,16,0xff};
unsigned char scale;
void deplay(unsigned int t)
{ while(t>0) t--;	}

void main()
{
	unsigned char i,beat,j;
	EA=1;ET0=1;
	TMOD=0X01;
	TR0=1;
	while(1)
	{
		scale=song[i];
		if(scale==0xff)
			{TR0=0;SP=1;while(1);}
		else
		{beat=song[i+1];
			for(j=0;j<beat;j++)
				{deplay(12500);}
			TR0=0;
			deplay(12500);
			TR0=1;
			i=i+2;
			}
		}
}
void timer0() interrupt 1
{
	TH0=wtf[scale*2];
	TL0=wtf[scale*2+1];
	SP=!SP;
}