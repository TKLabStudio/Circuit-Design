#include<reg52.h>
#define seg7 P2
#define cnt 5000
code char tab[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x83,0xf8,0x80,0x98};
int num,sec;

void main()
{
	seg7=tab[sec];
	EA=1;
	ET0=1;
	TMOD=0x01;
	TR0=1;
	while(1);
}

void timer1() interrupt 1
{
	TH1=(65536-cnt)/256;
	TL1=(65536-cnt)%256;
	num++;
	if(num>=20)
	{
		num=0;
		sec++;
		if(sec>=10) sec=0;
		seg7=tab[sec];
	}
}