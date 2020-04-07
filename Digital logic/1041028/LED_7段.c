#include <regx52.h>
#define LED P3
#define LED2 P2
code wtf[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90};
void deplay(int t)
{while(t>0) t--; }
int main()
{
	int i;
	while(1)
	{
		for(i=0;i<=99;i++)
		{
			if (i<10)
			{
				LED=wtf[i%10];
				LED2=0xff;
				deplay(1000000);
			}else
			{
				LED=wtf[i%10];
				LED2=wtf[i/10];
				deplay(1000000);
			}
		}
	}
}