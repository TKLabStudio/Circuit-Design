#include <reg52.h>
void deplay_10us(unsigned int time)
{
	while(time>0) time--;
}
void main(void)
{
	while(1)
	{
		int i,temp;
		temp=0xFF;
		for(i=1;i<10;i++)
		{
		P0=temp;
		deplay_10us(10000);
		temp=temp>>1;
		}		
		for(i=1;i<10;i++)
		{
		P0=temp;
		deplay_10us(10000);
		temp=temp<<1;
		}
	}
}
	