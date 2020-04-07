#include<regx52.h>
bit dir;
unsigned char led;
void deplay(unsigned int t)
{	while(t>0) t--;	}

void ext0() interrupt 0
	{
		char i;
		for(i=0;i<5;i++)
		{
			P0=0; deplay(20000);
			P0=0xff;	deplay(20000);
		}

	}
	
void main()
{
		
		led=1;
		dir=0;
		EX0=1;
		EA=1;
		IT0=1;
		while(P3_0==0)
		{
			P0=~led;
			deplay(1000);
			if (dir==0)	led<<=1;
			else led=led>>1;
			if (led==0x80) dir=1;
			if (led==1) dir=0;
		}
}