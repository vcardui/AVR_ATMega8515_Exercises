// +----------------------------------------------------------------------------+
// | Author.......: Vanessa Reteguín <vanessa@reteguin.com>
// | Author.......: 
// | First release: May 19th, 2025
// | Last update..: May 27rd, 2025
// | WhatIs.......: 7 Segments Display Cycle: 0 to F - Main
// +----------------------------------------------------------------------------+

// ------------ Objective -------------
// Escribir un programa que despliegue en un Display de 7 segmentos el conteo de O a F de forma cíclica (Se sugiere que sea con Lógica Inversa)


// ------------ Resources / Documentation involved -------------
// Bit Shifting with Delays Teacher's Tutorial: https://www.youtube.com/watch?v=apbuP5SLwVA
// AVR Stack Pointer y Subrutinas: https://youtu.be/489lpgMzDzk?si=Z6iZih3l-I8lIOES
// "macros" and "lookup tables: https://www.instructables.com/Command-Line-Assembly-Language-Programming-for-Ard-3/

// AVR Delay Loop Calculator: http://darcy.rsgc.on.ca/ACES/TEI4M/AVRdelay.html
; Assembly code auto-generated
; by utility from Bret Mulvey
; Delay 8 000 000 cycles
; 1s at 8 MHz

/*
		ldi  r25, 82
		ldi  r26, 43
		ldi  r27, 0
L1:		dec  r27
		brne L1
		dec  r26
		brne L1
		dec  r25
		brne L1
		lpm
		nop
*/

.INCLUDE <M8515DEF.INC>

// Declaramos el puerto A como salida

			LDI		R16,0XFF	// Llenamos el registro 16 con puros 1s
			OUT		DDRA,R16	// Configuramos el puerto A como salida
			
CICLO:		
			LDI		R17,0B0111111	// 0 -> 0111111 -> 3F
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B0000110	// 1 -> 0000110 -> 06
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B1011011	// 2 -> 1011011 -> 5B
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B1001111	// 3 -> 1001111 -> 4F
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B1100110	// 4 -> 1100110 -> 66
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B1101101	// 5 -> 1101101 -> 6D
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B1111101	// 6 -> 1111101 -> 7D
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B0000111	// 7 -> 0000111 -> 07
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B1111111	// 8 -> 1111111 -> 7F
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B1101111	// 9 -> 1101111 -> 6F
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B1110111	// A -> 1110111 -> 77
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B1111100	// b -> 1111100 -> 7C
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B0111001	// C -> 0111001 -> 39
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B1011110	// d -> 1011110 -> 5E
			OUT		PORTA,R17
			RCALL	SUBRRUTINA
			
			LDI		R17,0B1111001	// E -> 1111001 -> 79
			OUT		PORTA,R17
			RCALL	SUBRRUTINA

			LDI		R17,0B1110001	// F -> 1110001 -> 71
			OUT		PORTA,R17
			RCALL	SUBRRUTINA
			
			RJMP	CICLO

SUBRRUTINA:
			LDI  R29, 5
			LDI  R30, 150
			LDI  R31, 128
	L1:		DEC  R31
			BRNE L1
			DEC  R30
			BRNE L1
			DEC  R29
			BRNE L1

			RET