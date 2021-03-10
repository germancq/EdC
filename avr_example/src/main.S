; blink: demo programación en ensamblador AVR
#include <avr/io.h>
; Número de ciclos del bucle de espera
.equ NPASS,1000000

.global main

;_SFR_IO_ADDR esta macro resta 0x20 del valor. ya que el IO las instrucciones no se refieren al valor mapeado en memoria del registro https://www.avrfreaks.net/forum/operand-1-out-range


;http://tigcc.ticalc.org/doc/gnuasm.html#SEC77
;

main:
	;;;; Inicialización del sistema
	clr r1		; Usamos r1 como cero
	;ldi r16,(1<<DDB5)	; Configuramos puerto de salida
	out _SFR_IO_ADDR(DDRB),0
	sbi _SFR_IO_ADDR(DDRB), DDB5
	cbi _SFR_IO_ADDR(PORTB),PORTB5	; Iniciamos el bit de salida a cero

	;;;; Bucle principal
loop:
	ldi r20,(NPASS) & 0xFF		; Iniciamos el contador
	ldi r21,(NPASS >> 8) & 0xFF
	ldi r22,(NPASS >> 16) & 0xFF
wait1:					; Bucle de espera 1
	subi r20,1					
	sbc r21,r1
	sbc r22,r1
	brne wait1
	sbi _SFR_IO_ADDR(PORTB),PORTB5			; Activamos la salida

	ldi r20,(NPASS)	& 0xFF	; Iniciamos el contador
	ldi r21,(NPASS >> 8) & 0xFF
	ldi r22,(NPASS >> 16) & 0xFF
wait2:					; Bucle de espera 2
	subi r20,1					
	sbc r21,r1
	sbc r22,r1
	brne wait2
	cbi _SFR_IO_ADDR(PORTB),PORTB5			; Desactivamos la salida

	rjmp loop				; Repetimos