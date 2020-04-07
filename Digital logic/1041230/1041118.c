#include <regx52.h>
#define LED P0
#define SEG7 P2
#define PB P3_2
#define PB1 P3_3
code wtf[]={1,2,4,8,16,32,64,128};
void deplay(int t)
{while(t>0) t--; }

int main()
{
	char cnt;
	PB=PB1=1;

	while(1)
	{

		if(PB==0)
		{
		deplay(2000);
		if(PB==1)
		{
		deplay(2000);
			for(cnt=0;cnt<8;cnt++)
			{
				LED=~wtf[cnt];
				deplay(10000);
			}
		}
	}
			
		if(PB1==0)
		{
		deplay(2000);
		if(PB==1)
		{
		deplay(2000);
			for(cnt=7;cnt>=0;cnt--)
			{
				LED=~wtf[cnt];
				deplay(10000);
			}
		}
		}
	}
}