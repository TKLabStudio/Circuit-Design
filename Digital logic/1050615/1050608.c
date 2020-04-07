#include<regx51.h>
#define led P0
#define sw P2
bit flag;
void main()
{
	sw=0xff;
	SCON=0x90;
	PCON=0X80;
	EA=ES=1;
	while(1)
		{
			SBUF=sw;
			flag=0;
			while(flag==0);
		}
}
 void uart() interrupt 4
{
	if(TI==1)
	{
		TI=0;
		flag=1;;
	}
	else
	{
		led=SBUF;
		RI=0;
	}
}