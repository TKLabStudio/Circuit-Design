#include<regx51.h>
#define send P2
void main()
{
	send=0xff;
	TMOD=0X20;
	TH1=244;
	PCON=0X80;
	TR1=1;
	SM1=1;
	while(1)
	{
		TI=0;
		SBUF=send;
		while(TI==0);
	}
}