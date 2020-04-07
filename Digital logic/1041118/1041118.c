#include <regx52.h>
code wtf[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
code fxxk[]={0x7f,0xbf,0xdf,0xef,0xf7,0xfb};
void deplay(int t)
{while(t>0) t--; }

int main()
{
	unsigned int time,count=0,i,t1,t2,t3,t4,hour=11,min=58,sec=58;
	char disp[6];
	count=((hour*3600)+(min*60)+sec);
	while(1)
	{
		P0=0XFF;
		P1=disp[i];
		P0=fxxk[i];
		i++;
		if(i>=6) i=0;
		deplay(100);
		time++;
		if(time>=100)
		{
			time=0;
			count++;
			if(count>=43200) count=0;
			disp[0]=~wtf[count/36000];t1=count%36000;
			disp[1]=~wtf[t1/3600];t2=count%3600;
			disp[2]=~wtf[t2/600];t3=count%600;
			disp[3]=~wtf[t3/60];t4=count%60;
			disp[4]=~wtf[t4/10];
			disp[5]=~wtf[count%10];
		}
	}
}