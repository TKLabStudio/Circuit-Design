#include <regx52.h>
#define LED P0
void deplay(int t)
{while(t>0) t--; }

int main()
{
	int a,b,c;
	for(a=0;a<=200;a++)
	{
		for(b=0;b<=a;b++) 
		LED=0xff;
		for(c=0;c<=(200-a);c++) 
		LED=0x00;
	}
		LED=0xff;
		deplay(10000);
}

