#include<reg51.h>
code char font[]={0x2c,0x7e,0x29,0x20,0x30,0x28,0x34,0x20,
									0,0x7e,0x20,0,0x68,0x3e,0x48,0,
									0,0x3c,0x24,0xff,0xff,0x24,0x3c,0,
									0xe6,0xe6,0x84,0xff,0xff,0x84,0xe6,0xe6,
									0,0x7e,0x20,0,0x6a,0x3e,0x4a,0,
									0,0,0x3e,0x40,0x40,0x20,0,0};
char disp[8];
void deplay(unsigned t)
{	while(t>0)	t--;}
void main()
{
	char i,j,sec,ptr;
				for(i=0;i<8;i++)	disp[0]=font[0];
	while(1)
	{
		for(i=7,j=1;i>=0;i--,j=j<<1)
		{			
			P0=0xff;
			P0=~j;
			P1=disp[i];
			deplay(100);
		}
		sec++;
			if(sec>=20)
			{
				sec=0;
				for(i=0;i<7;i++)	disp[i]=disp[i+1];
						disp[7]=font[ptr--];
						if(ptr<=0) ptr=48;
			}
		}
}