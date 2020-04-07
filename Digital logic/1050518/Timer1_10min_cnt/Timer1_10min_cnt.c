#include<reg52.h>
code char tab[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7c,0x27,0x7f,0x67};
code char com[]={0x7f,0xbf,0xdf,0xef};
char time=10;
char num,min,sec,wtf,disp[4];
void display()
{
	disp[0]=tab[min/10];
	disp[1]=tab[min%10];
	disp[2]=tab[sec/10];
	disp[3]=tab[sec%10];
}
void timer0() interrupt 1
{
	TH0=(65536-1000)/256;
	TL0=(65536-1000)%256;
	P0=0XFF;
	P1=disp[wtf];
	P0=com[wtf];
	wtf++;
	if(wtf>=4) wtf=0;
}

void timer1() interrupt 3
{
	TH1=(65536-50000)/256;
	TL1=(65536-50000)%256;
	num++;
	if(num>=20)
	{
		num=0;
		sec--;
		if(sec<0)
		{sec=59;min--;}
		if((min==0)&(sec==0))
		{TR0=0;min=time;}
		display();
	}
}

void main()
{
	IE=0X8A;
	TMOD=0x11;
	TR1=TR0=1;
	min=time;
	display();
	while(1);
}