#include <regx52.h>
code wtf[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0xa0,0x83,0xa7,0xa1,0x86,0x8e,0x7f};
code gay[]={7,8,9,14,4,5,6,14,1,2,3,14,14,0,14,14};
int main()
{
	char scan,x,kc,key=16;
	while(1)
	{
		scan=0x01;
		for(x=0;x<4;x++)
		{
			P1=~scan;
			if((P1&0XF0)!=0XF0)
			{
				kc=P1&0XF0;
				switch(kc)
				{
					case 0xe0:
						key=x*4;
						break;
					case 0xd0:
						key=x*4+1;
						break;
					case 0xb0:
						key=x*4+2;
						break;
					case 0x70:
						key=x*4+3;
						break;
				}
			}				
		P2=wtf[gay[key]];
			scan=scan<<1;
		}
	}
}