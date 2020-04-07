#include <regx52.h>
code wtf[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x27,0x7f,0x6f,0x5f,0x7c,0x58,0x5e,0x79,0x71,0x7f};
//code wtf[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0xa0,0x83,0xa7,0xa1,0x86,0x8e,0x7f};
code fxxk[]={0x7f,0xbf,0xdf,0xef};
void deplay(int t)
{while(t>0) t--; }

int main()
{
	char key=16,disp[4];
	int i;
		disp[0]=wtf[0];
		disp[1]=disp[2]=disp[3]=0x00;
	while(1)
	{
		deplay(100);
		
		P0=0XFF;
		P1=disp[i];
		P0=fxxk[i];
		i++;
		if(i>=4) i=0;
		
		P3=0xf0;
			if(P3_4==0) key=7;
			if(P3_5==0) key=8;
			if(P3_6==0) key=9;
			if(P3_7==0) key=16;
		P3=0XFD;
			if(P3_4==0) key=4;
			if(P3_5==0) key=5;
			if(P3_6==0) key=6;
			if(P3_7==0) key=16;
		P3=0xfB;
			if(P3_4==0) key=1;
			if(P3_5==0) key=2;
			if(P3_6==0) key=3;
			if(P3_7==0) key=16;
		P3=0xf7;
			if(P3_4==0) key=16;
			if(P3_5==0) key=0;
			if(P3_6==0) key=16;
			if(P3_7==0) key=16;
		disp[0]=wtf[key];
	}
}