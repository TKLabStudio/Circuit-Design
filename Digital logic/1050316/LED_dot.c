#include<reg51.h>
code char font[]={0,0x3c,0x24,0xff,0xff,0x24,0x3c,0,
									0xe6,0xe6,0x84,0xff,0xff,0x84,0xe6,0xe6};
code char com[]={0xfe,0xfd,0xfb,0xf7,0xef,0xdf,0xbf,0x7f};
char disp[8],t_disp[8];
void deplay(unsigned t)
{	while(t>0)	t--;}
void main()
{
	unsigned char i,j,tmp=200,sec,n=0,ptr=16;
			for(i=0;i<8;i++)
		{			
			disp[i]=font[i];
			t_disp[i]=font[i+8];
		}
	while(1)
	{
		for(i=0;i<8;i++)
		{			
			P0=0xff;
			P0=com[i];
			P1=disp[i];
			deplay(50);
		}
		sec++;
			if(sec>=tmp)
			{
				sec=0;
				for(j=0;j<7;j++)
					{		disp[j]=font[j+1];	}
						disp[7]=t_disp[n];
						n++;
						if(n>=8)
						{
							n=0;
							tmp=200;
									for(i=0;i<8;i++)
									{		t_disp[i]=font[ptr+i];	}
										ptr=ptr+8;
										if(ptr>=80)ptr=0;
						}
						else tmp=40;
			}
		}
}