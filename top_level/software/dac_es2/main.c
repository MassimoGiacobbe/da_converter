

#include <stdio.h>
#include "sys/alt_irq.h"
#include "system.h"
#include <stdint.h>
#include "altera_avalon_pio_regs.h"
#include "altera_avalon_timer_regs.h"

static void timer_isr() {
/* Clear the interrupt */
IOWR_ALTERA_AVALON_TIMER_STATUS(TIMER_0_BASE, 0x00);
char samples[20]= {127,167,202,231,249,255,249,231,202,167,127,88,53,24,6,0,6,24,53,88};
static short i=0;
if(i < 20){
IOWR_ALTERA_AVALON_PIO_DATA(HEX0_BASE,samples[i] & 0xff);
i++;
}
if(i==20)
i=0;
}

// * Timer initialization routine
void init_timer(){
int test;
/* Write in the period register the value 0x0007A120 corresponding to 500.000 */
IOWR_ALTERA_AVALON_TIMER_PERIODL(TIMER_0_BASE, 0xA120);
IOWR_ALTERA_AVALON_TIMER_PERIODH(TIMER_0_BASE, 0x0007);
test = alt_ic_isr_register(TIMER_0_IRQ_INTERRUPT_CONTROLLER_ID, TIMER_0_IRQ,timer_isr, NULL, NULL);
if (test == 0)
printf("Timer Interrupt Routine Registered\n");
IOWR_ALTERA_AVALON_TIMER_CONTROL(TIMER_0_BASE,
ALTERA_AVALON_TIMER_CONTROL_ITO_MSK| ALTERA_AVALON_TIMER_CONTROL_CONT_MSK
| ALTERA_AVALON_TIMER_CONTROL_START_MSK);
}







int main()
{
	init_timer();
  return 0;
}
