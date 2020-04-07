#include <regx52.h>
#define LED P0
#define DIPSW P3_0
#define DIPSW_1 P3_1
#define SEG P2
code seg7[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0x86};
code wtf[]={1,2,4,8,16,32,64,128};
void deplay(int t)
{while(t>0) t--; }

int main()
{
	signed char i;
	int a;
	while(1)
	{
		if(DIPSW==0) 
		{
			for(i=0;i<=9;i++)
			{
			 if(DIPSW_1==0) a=20000;
			 else a=15000;
				LED=~wtf[i];
				SEG=seg7[i];
				deplay(a);
			}
		}else
		{
			for(i=9;i>=0;i--)
			{
			 if(DIPSW_1==0) a=20000;
			 else a=15000;
				LED=~wtf[i];
				SEG=seg7[i];
				deplay(a);
			}
		}
	}
}
