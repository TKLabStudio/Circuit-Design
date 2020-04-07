#include <reg52.h>
void deplay_10us(unsigned int time)
{
	while(time>0) time--;
}
void main(void)
{
	while(1)
	{
		P0=0x01;
		deplay_10us(10000);
		P0=0x02;
		deplay_10us(10000);
		P0=0x07;
		deplay_10us(10000);
		P0=0x08;
		deplay_10us(10000);
		P0=0x10;
		deplay_10us(10000);
		P0=0x20;
		deplay_10us(10000);
		P0=0x70;
		deplay_10us(10000);
		P0=0x80;
		deplay_10us(10000);
		
		P0=0x80;
		deplay_10us(10000);
		P0=0x70;
		deplay_10us(10000);
		P0=0x20;
		deplay_10us(10000);
		P0=0x10;
		deplay_10us(10000);
		P0=0x08;
		deplay_10us(10000);
		P0=0x07;
		deplay_10us(10000);
		P0=0x02;
		deplay_10us(10000);
		P0=0x01;
		deplay_10us(10000);
	}
}