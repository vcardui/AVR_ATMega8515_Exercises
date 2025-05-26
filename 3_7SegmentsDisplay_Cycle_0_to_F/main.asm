// +----------------------------------------------------------------------------+
// | Author.......: Vanessa Reteguín <vanessa@reteguin.com>
// | Author.......: 
// | First release: May 19th, 2025
// | Last update..: May 26rd, 2025
// | WhatIs.......: 7 Segments Display Cycle: 0 to F - Main
// +----------------------------------------------------------------------------+

// ------------ Objective -------------
// Escribir un programa que despliegue en un Display de 7 segmentos el conteo de O a F de forma cíclica (Se sugiere que sea con Lógica Inversa)


// ------------ Resources / Documentation involved -------------
// Bit Shifting with Delays Teacher's Tutorial: https://www.youtube.com/watch?v=apbuP5SLwVA
// AVR Stack Pointer y Subrutinas: https://youtu.be/489lpgMzDzk?si=Z6iZih3l-I8lIOES

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

							  // Display -> Binario -> Hex
			LDI		R17,0B0111111	// 0 -> 0111111 -> 3F
			LDI		R18,0B0000110	// 1 -> 0000110 -> 06
			LDI		R19,0B1011011	// 2 -> 1011011 -> 5B
			LDI		R20,0B1001111	// 3 -> 1001111 -> 4F
			LDI		R21,0B1100110	// 4 -> 1100110 -> 66
			LDI		R22,0B1101101	// 5 -> 1101101 -> 6D
			LDI		R23,0B1111101	// 6 -> 1111101 -> 7D
			LDI		R24,0B0000111	// 7 -> 0000111 -> 07
			LDI		R25,0B1111111	// 8 -> 1111111 -> 7F
			LDI		R26,0B1101111	// 9 -> 1101111 -> 6F
			LDI		R27,0B1110111	// A -> 1110111 -> 77
			LDI		R28,0B1111100	// b -> 1111100 -> 7C
			LDI		R29,0B0111001	// C -> 0111001 -> 39
			// LDI		R30,0B1011110	// d -> 1011110 -> 5E
			// LDI		R31,0B1111001	// E -> 1111001 -> 79
			// LDI		R32,0B1110001	// F -> 1110001 -> 71
			
CICLO:		OUT		PORTA,R17
			RCALL	SUBRRUTINA
			OUT		PORTA,R18
			RCALL	SUBRRUTINA
			OUT		PORTA,R19
			RCALL	SUBRRUTINA
			OUT		PORTA,R20
			RCALL	SUBRRUTINA
			OUT		PORTA,R21
			RCALL	SUBRRUTINA
			OUT		PORTA,R22
			RCALL	SUBRRUTINA
			OUT		PORTA,R23
			RCALL	SUBRRUTINA
			OUT		PORTA,R24
			RCALL	SUBRRUTINA
			OUT		PORTA,R25
			RCALL	SUBRRUTINA
			OUT		PORTA,R26
			RCALL	SUBRRUTINA
			OUT		PORTA,R27
			RCALL	SUBRRUTINA
			OUT		PORTA,R28
			RCALL	SUBRRUTINA
			
			RJMP	CICLO

SUBRRUTINA:
			LDI  R29, 10
			LDI  R30, 150
			LDI  R31, 128
	L1:		DEC  R31
			BRNE L1
			DEC  R30
			BRNE L1
			DEC  R29
			BRNE L1

			RET
