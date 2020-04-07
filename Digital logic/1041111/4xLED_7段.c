#include <regx52.h>
code wtf[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
code fxxk[]={0x7f,0xbf,0xdf,0xef};
void deplay(int t)
{while(t>0) t--; }

int main()
{
	int time,count=0,i,t1,t2,hour=11,min=58;
	char disp[4];
	count=hour*60+min;
	while(1)
	{
		P0=0XFF;
		P1=disp[i];
		P0=fxxk[i];
		i++;
		if(i>=4) i=0;
		deplay(100);
		time++;
		if(time>=500)
		{
			time=0;
			count++;
			if(count>=720) count=0;
			disp[0]=~wtf[count/600];t1=count%600;
			disp[1]=~wtf[t1/60];t2=count%60;
			disp[2]=~wtf[t2/10];
			disp[3]=~wtf[count%10];
		}
	}
}