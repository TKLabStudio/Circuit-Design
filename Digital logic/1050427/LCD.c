#include <regx52.h>
#include <lcd.h>
code char text1[]={0x00,0x0e,0x1c,0x18,0x18,0x1c,0x0e,0x00,
									 0x00,0x0e,0x1e,0x18,0x18,0x1e,0x0e,0x00,
									 0x00,0x0e,0x1f,0x1c,0x1c,0x1f,0x0e,0x00,
									 0x00,0x0e,0x1f,0x1f,0x1f,0x1f,0x0e,0x00,
									 0x04,0x04,0x04,0x1f,0x04,0x04,0x04,0x00};
void main()
{
	char i,j,x;
	while(1)
		{
	init();
	wc(0x40);
	for(i=0;i<40;i++)
	{ wd(text1[i]); }
	
	for (i=1;i<17;i++)
	{
		for (j=0;j<4;j++)
		{
			dp(1,i);
			wd(j);
				for (x=i+1;x<17;x++)
					{
						dp(1,x);
						wd(4);
					}
					deplay((i+1)*200);
				}
				dp(1,i);
				wd(0xfe);
			}
		}
}