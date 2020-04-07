#include <regx52.h>
code wtf[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
code fxxk[]={0x7f,0xbf,0xdf,0xef};
void deplay(int t)
{while(t>0) t--; }

int main()
{
	unsigned int time,count=0,i;
	char disp[4];
	while(1)
	{
		P0=0XFF;
		P1=disp[i];
		P0=fxxk[i];
		i++;
		if(i>=4) i=0;
		deplay(200);
		time++;
		if(time>=100)
		{
			time=0;
			if(count>=10) count=0;
			disp[0]=disp[1];
			disp[1]=disp[2];
			disp[2]=disp[3];
			disp[3]=~wtf[count];
			count++;
		}
	}
}
