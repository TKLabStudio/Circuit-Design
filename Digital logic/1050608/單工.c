#include<regx51.h>
code char tab[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
code char send_data[]={0,1,2,3,4,5,6,7,8,9};
unsigned char i;

void delay(unsigned int t)
{	while(t>0) t--;	}
void main()
{
	TMOD=0X20;
	TH1=TL1=243;
	TR1=1;
	SCON=0x50;
	while(1)
	{
		for(i=0;i<10;i++)
		{
		SBUF=send_data[i];
		while(TI==0);
		TI=0;
		while(RI==0);
		RI=0;
		P2=tab[SBUF];
		delay(50000);
		}
	}
}
