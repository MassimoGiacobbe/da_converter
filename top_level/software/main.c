

#include <stdio.h>
#include "sys/alt_irq.h"
#include "system.h"
#include <stdint.h>
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer_regs.h"





void get_serial(char* freq, char* val) //this function is used to get the
{
	char tmp;
	int i;
	for(i=0;i<10;i++)
	{
		scanf("%c",&tmp);
		if(i==0)
		{
			*freq=tmp;
		}
		else if(i!=1)
		{
			*(val+i-2)=tmp;
		}


	}
}

uint8_t binaryStringToValue(const char* binaryString) {
    unsigned char result = 0;

    for (int i = 0; i < 8; i++) {
        if (binaryString[i] == '1') {
            result |= (1 << (7 - i));
        }
    }

    return result;
}



int main()
{
	char val_freq;
	char val_convert[9];
	uint8_t val_convert_binary;
	int Sel_freq =1;
	int val=0;
	printf("inserisci valore char: \n");
	val = alt_getchar();
	switch (Sel_freq){//the name LEDS is an error, it represents the 2 bit PIO for the frquency input value
	case 0 : IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE, 0x00);; break;
	case 1 : IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE,0x1);break;
	case 2 :IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE,0x2) ;break;
	case 3 : IOWR_ALTERA_AVALON_PIO_DATA(LEDS_BASE,0x3);break;
	default : printf("problem in Sel_freq\n");
	}
while(1)
{
get_serial(&val_freq,val_convert);
val_convert_binary=binaryStringToValue(val_convert);
IOWR_ALTERA_AVALON_PIO_DATA(HEX0_BASE,val_convert_binary & 0xFF); //the name HEX0 is an error, it represents the 8 bit PIO for the input value

}

  return 0;
}
