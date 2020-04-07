#include<reg51.h>
code char font[][8]={{0,0x3c,0x24,0xff,0xff,0x24,0x3c,0},
										{0xe6,0xe6,0x84,0xff,0xff,0x84,0xe6,0xe6}};
void deplay(unsigned t)
{	while(t>0)	t--;}
void main()
{
	unsigned char i,j,n=0,sec;
	while(1)
	{
		for(i=0,j=0x80;i<8;i++,j=j>>1)
		{			
			P1=0xff;
			P0=~j;
			P1=font[n][i];
			deplay(100);
		}
		sec++;
			if(sec>=125)
			{
				sec=0;
				n++;
				if(n>=2)	n=0;
			}
		}
}