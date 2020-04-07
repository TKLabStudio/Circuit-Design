#include<reg52.h>
#define seg7 P2
#define cnt 5000
code char tab[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x83,0xf8,0x80,0x98};
int num,sec;

void main()
{
	seg7=tab[sec];
	EA=1;
	ET1=1;
	TMOD=0x00;
	TR1=1;
	while(1);
}

void timer1() interrupt 3
{
	TH1=(8192-cnt)/32;
	TL1=(8192-cnt)%32;
	num++;
	if(num>=200)
	{
		num=0;
		sec++;
		if(sec>=10) sec=0;
		seg7=tab[sec];
	}
}