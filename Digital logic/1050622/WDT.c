#include<regx52.h>
sfr WDTRST=0xA6;
code char tab[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
code char send[]={0,1,2,3,4,5,6,7,8,9};
signed i;

void delay(unsigned int time)
{
	unsigned int cnt;
	while(time>0)
	{
		cnt=1000;
		while(cnt>0) cnt--;
		time--;
		WDTRST=0x1E;
		WDTRST=0xE1;
	}
}
void main(void)
{
	TMOD=0x20;
	TH1=243;
	TR1=1;
	SCON=0x50;
	WDTRST=0x1E;
	WDTRST=0xE1;
	while(1)
	{
		for(i=0;i<10;i++)
		{
			SBUF=send[i];
			while(TI==0);
			TI=0;
			while(RI==0);
			RI=0;
			P2=tab[SBUF];
			delay(100);
		}
	}
}