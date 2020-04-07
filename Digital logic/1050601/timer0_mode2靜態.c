#include <reg52.h>
#define led P0
void timer0() interrupt 1
 {led=~led;}
 
 void main()
 {
	 TH0=256-3;
	 TL0=256-3;
	 EA=1;
	 ET0=1;
	 TMOD=0X06;
	 TR0=1;
	 led=0x0f;
	 while(1);
}