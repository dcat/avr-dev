CFLAGS = -Os -mmcu=atmega328p
CC     = avr-gcc

.SUFFIXES:
.SUFFIXES: .c .o .elf .hex .flash

all: pgm.flash

.o.elf:
	avr-gcc -o $@ ${LDFLAGS} $<

.elf.hex:
	avr-objcopy -j .text -j .data -O ihex $< $@

.hex.flash:
	avrdude -qq -P /dev/ttyUSB0 -b 57600 -c avrisp -p m328p -U flash:w:$<

clean:
	rm -f pgm.o pgm.elf pgm.hex pgm
