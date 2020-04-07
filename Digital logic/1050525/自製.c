 #include <regx52.h>
 #define sp P2_0
 
 code char tab[]={0xfc,0x0c,
                  0xfc,0x44,
                  0xfc,0xac,
                  0xfd,0x09,
                  0xfd,0x34,
                  0xfd,0x82,
                  0xfd,0xc8,
                  0xfe,0x06,
                  0xfe,0x22,
                  0xfe,0x56,
                  0xfe,0x85};
							
 code char song[]={1,3,4,3,5,3,
	                 5,3,6,3,6,3,6,3,6,3,6,9,
	                 6,7,5,3,5,3,5,3,5,3,5,9,
                   5,7,4,3,4,3,4,3,4,3,4,9,
                   4,3,1,3,1,3,1,9, 
                   1,3,4,3,5,3,5,3,6,3,6,3,6,3,  6,4,6,4,8,8,
                   6,4,5,4,5,4,4,4,5,4,6,4,6,8,
                   5,4,6,4,5,4,4,4,4,8,
                   5,4,6,4,5,4,4,4,4,16,0xff};
									 
 unsigned char scale ;
 void delay (unsigned int time)
 {while (time--);}
 
 void main(void)
 {unsigned char i,beat,j;
  EA=1;	ET0=1;
	TMOD=0x01;
	TR0=1;
	 
	while(1)
	{scale=song[i];
		if(scale==0xff)
		{TR0=0; SP=1; while(1);}
		else
		{beat=song[i+1];
		 for(j=0;j<beat;j++)
			{delay(6250);}
			TR0=0;
			delay(6250);
			TR0=1;
			i=i+2;
		}
	}
 }
  void time0(void) interrupt 1
  {TH0=tab[scale*2];
   TL0=tab[scale*2+1];
	 sp=!sp;
	}