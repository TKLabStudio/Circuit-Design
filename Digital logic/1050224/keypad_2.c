#include <regx52.h>
code wtf[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0xa0,0x83,0xa7,0xa1,0x86,0x8e,0x7f};
int main()
{
	char key=16;
	while(1)
	{
		P1=0xf0;
			if(P1_4==0) key=7;
			if(P1_5==0) key=8;
			if(P1_6==0) key=9;
			if(P1_7==0) key=16;
		P1=0XFD;
			if(P1_4==0) key=4;
			if(P1_5==0) key=5;
			if(P1_6==0) key=6;
			if(P1_7==0) key=16;
		P1=0xfB;
			if(P1_4==0) key=1;
			if(P1_5==0) key=2;
			if(P1_6==0) key=3;
			if(P1_7==0) key=16;
		P1=0xf7;
			if(P1_4==0) key=16;
			if(P1_5==0) key=0;
			if(P1_6==0) key=16;
			if(P1_7==0) key=16;
		P2=wtf[key];
	}
}