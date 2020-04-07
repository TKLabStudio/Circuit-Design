#include <reg52.h>
void deplay_10us(unsigned int time)
{
	while(time>0) time--;
}
void main(void)
{
	while(1)
	{
		code wtf[]={1,128,2,64,4,32,8,16,8,32,4,64,2,128};
		int i;
		for(i=0;i<14;i++)
		{
		P0=~wtf[i];
		deplay_10us(20000);
		}		
	}
}
	