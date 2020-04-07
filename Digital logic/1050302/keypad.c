#include <regx52.h>
code wtf[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x27,0x7f,0x6f,0x5f,0x7c,0x58,0x5e,0x79,0x71,0x7f};
code fxxk[]={0x7f,0xbf,0xdf,0xef};
char key=16;
char disp[4],i;
void deplay(int t)
{while(t>0) t--; }

void display()
{
		P0=0XFF;
		P1=disp[i];
		P0=fxxk[i];
		i++;
		if(i>=4) i=0;
	deplay(100);
}

int main()
{
		P3=0xfe;
			if(P3_4==0) {key=7; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_4==0) display();}
			if(P3_5==0) {key=8; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_5==0) display();}
			if(P3_6==0) {key=9; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_6==0) display();}
			if(P3_7==0) {key=16; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_7==0) display();}
		P3=0XFD;
			if(P3_4==0) {key=4; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_4==0) display();}
			if(P3_5==0) {key=5; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_5==0) display();}
			if(P3_6==0) {key=6; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_6==0) display();}
			if(P3_7==0) {key=16; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_7==0) display();}
		P3=0xfB;
			if(P3_4==0) {key=1; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_4==0) display();}
			if(P3_5==0) {key=2; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_5==0) display();}
			if(P3_6==0) {key=3; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_6==0) display();}
			if(P3_7==0) {key=16; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_7==0) display();}
		P3=0xf7;
			if(P3_4==0) {key=16; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_4==0) display();}
			if(P3_5==0) {key=0; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_5==0) display();}
			if(P3_6==0) {key=16; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_6==0) display();}
			if(P3_7==0) {key=16; disp[3]=disp[2];disp[2]=disp[1];disp[1]=disp[0];disp[0]=wtf[key];while(P3_7==0) display();}
	display();
}