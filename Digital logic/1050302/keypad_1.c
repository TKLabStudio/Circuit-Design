#include <regx52.h>
code wtf[]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x27,0x7f,0x6f,0x5f,0x7c,0x58,0x5e,0x79,0x71,0x7f};
//code wtf[]={0xc0,0xf9,0xa4,0xb0,0x99,0x92,0x82,0xf8,0x80,0x90,0xa0,0x83,0xa7,0xa1,0x86,0x8e,0x7f};
code fxxk[]={0x7f,0xbf,0xdf,0xef};
char scan,x,key,cnt;
char disp[4],i;
bit flag;
void deplay(int t)
{while(t>0) t--; }
void keypad(void)
{
	int y;
	if(flag)
	{
		if(cnt>=20)
		{
			if((P3&0XF0)==0XF0)
			{
			disp[3]=disp[2];
			disp[2]=disp[1];
			disp[1]=disp[0];
			disp[0]=wtf[key];
			flag=0;
			}
		}	
		else cnt++;
	}
	else
	{
		P3=scan;
			if((P3&0XF0)!=0XF0)
		{
				cnt=0;
		switch(P3&0XF0)
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
				flag=1;
				if (key==0) key=7;
				else if  (key==1) key=8;
				else if  (key==2) key=9;
				else if  (key==3) key=16;
				else if  (key==4) key=4;
				else if  (key==5) key=5;
				else if  (key==6) key=6;
				else if  (key==7) key=16;
				else if  (key==8) key=1;
				else if  (key==9) key=2;
				else if  (key==10) key=3;
				else if  (key==11) key=16;
				else if  (key==12) key=16;
				else if  (key==13) key=0;
				else if  (key==14) key=16;
				else if  (key==15) key=16;
		}
		else
		{
			scan<<=1;scan|=1;x++;
			if(x>3){x=0;scan=0xfe;}
		}
	}
}

void display()
{
		P0=0XFF;
		P1=disp[i];
		P0=fxxk[i];
		i++;
		if(i>=4) i=0;
}

int main()
{
		x=0,scan=0xfe;
		disp[0]=wtf[0];
		disp[1]=disp[2]=disp[3]=0x00;
	while(1)
	{
		deplay(100);
		display();
		keypad();
	}
}