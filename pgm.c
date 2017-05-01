#define F_CPU 16000000L /* frequency */
#include <util/delay.h>
#include <avr/io.h>

main() {
	/* data direction */
	DDRD = _BV(PD5);

	for (;;) {
		/* toggle PB5 */
		PORTB ^= _BV(PB5);
		_delay_ms(500);
	}
}
