#include <regx52.h>
code wtf[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
code fxxk[]={0x7f,0xbf,0xdf,0xef};
void deplay(int t)
{while(t>0) t--; }

int main()
{
	int time,i,hour,min,sec;
	char disp[4];
	while(1)
	{
		P0=0XFF;
		P1=disp[i];
		P0=fxxk[i];
		i++;
		if(i>=4) i=0;
		deplay(100);
		time++;

		if(time>=1000)
		{
			time=0; sec++;
			if(sec>=60)
			{
				sec=0; min++;
				if(min>=60)
				{	
					min=0; hour++;
						if(hour>=24)
							hour=0;
				}
			}
		}
			disp[0]=~wtf[hour/10];
			disp[1]=~wtf[hour%10];
			disp[2]=~wtf[min/10];
			disp[3]=~wtf[min%10];
		if(time>500)
			disp[3]=~wtf[min%10]+0x80;
	}			
}