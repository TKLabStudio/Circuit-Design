#include<regx51.h>
#define seg_7 P2
void main()
{
	TMOD=0X20;
	TH1=244;
	PCON=0X80;
	TR1=1;
	SCON=0x50;
	while(1)
	{
		RI=0;
	while(RI==0);
	if(SBUF==0XFE)
		seg_7=0xf9;
	else if(SBUF==0XFd)
		seg_7=0xa4;
	else if(SBUF==0XFB)
		seg_7=0xb0;
	else if(SBUF==0XF7)
		seg_7=0x99;
	else if(SBUF==0Xef)
		seg_7=0x92;
	else if(SBUF==0Xdf)
		seg_7=0x82;
	else if(SBUF==0Xbf)
		seg_7=0xf8;
	else if(SBUF==0X7f)
		seg_7=0x80;
	else
		seg_7=0x7f;
	}
}