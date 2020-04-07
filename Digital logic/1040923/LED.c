#include <reg52.h>
void deplay_10us(unsigned int time)
{
	while(time>0) time--;
}
void main(void)
{
	while(1)
	{
		P0=0xFF;
		deplay_10us(10000);
		P0=0xFD;
		deplay_10us(10000);
		P0=0xFB;
		deplay_10us(10000);
		P0=0xF7;
		deplay_10us(10000);
		P0=0xEF;
		deplay_10us(10000);
		P0=0xDF;
		deplay_10us(10000);
		P0=0xBF;
		deplay_10us(10000);
		P0=0x7F;
		deplay_10us(10000);
		P0=0xFF;
		deplay_10us(10000);
		
		P0=0xFF;
		deplay_10us(10000);
		P0=0x7F;
		deplay_10us(10000);
		P0=0xBF;
		deplay_10us(10000);
		P0=0xDF;
		deplay_10us(10000);
		P0=0xEF;
		deplay_10us(10000);
		P0=0xF7;
		deplay_10us(10000);
		P0=0xFB;
		deplay_10us(10000);
		P0=0xFD;
		deplay_10us(10000);
		P0=0xFF;
		deplay_10us(10000);
	}
}