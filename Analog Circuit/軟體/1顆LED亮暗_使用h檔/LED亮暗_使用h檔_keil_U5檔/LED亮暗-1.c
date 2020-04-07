#include<regx52.h>
#include<delay.h>
/*void delay_10us(unsigned int time)
{while(time>0)
  {time--;}
}	*/
void main (void)
{ while(1)
	{ P0_7=0;
		delay_10us(50000);
		P0_7=1;
		delay_10us(50000);
	}	
}	