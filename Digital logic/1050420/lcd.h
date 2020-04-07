#define RS P1_0
#define RW P1_1
#define E P1_2

void deplay(unsigned int t)
{	while(t>0)	t--;}
void wc(char lcd)
{
	RS=0;RW=0;E=1;
	P0=lcd;
	deplay(100);
	E=0;deplay(100);
}
void wd(char lcd)
{
	RS=1;RW=0;E=1;
	P0=lcd;
	deplay(100);
	E=0;deplay(100);
}
void init()
{
	deplay(2000);
	wc(0x30);
	wc(0x30);
	wc(0x38);
	wc(0x08);
	wc(0x01);
	wc(0x06);
	wc(0x0c);
}
void dp(char row,word)
{
	char cp;
	row--,word--;
	cp=0x80+(row*0x40+word);
	wc(cp);
}

void ds(char *ptr)
{
	while(*ptr!=0)
	{
		wd(*ptr);
		ptr++;
	}
}
