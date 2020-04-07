#include<reg51.h>
code char font[]={0,0x3c,0x24,0xff,0xff,0x24,0x3c,0};
void deplay(unsigned t)
{	while(t>0)	t--;}
void main()
{
	unsigned char i,j;
	while(1)
	{
		for(i=0,j=0x80;i<8;i++,j=j>>1)
		{
			P1=0xff;
			P0=j;
			P1=~font[i];
			deplay(100);
		}
	}
}