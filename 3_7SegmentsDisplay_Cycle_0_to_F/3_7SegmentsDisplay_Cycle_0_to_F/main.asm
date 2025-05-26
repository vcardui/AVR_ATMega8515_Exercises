// +----------------------------------------------------------------------------+
// | Author.......: Vanessa Reteguín <vanessa@reteguin.com>
// | Author.......: 
// | First release: May 19th, 2025
// | Last update..: May 23rd, 2025
// | WhatIs.......: 7 Segments Display Cycle: 0 to F - Main
// +----------------------------------------------------------------------------+

// ------------ Objective -------------
// Escribir un programa que despliegue en un Display de 7 segmentos el conteo de O a F de forma cíclica (Se sugiere que sea con Lógica Inversa)


// ------------ Resources / Documentation involved -------------
// Bit Shifting with Delays Teacher's Tutorial: https://www.youtube.com/watch?v=apbuP5SLwVA

// AVR Delay Loop Calculator: http://darcy.rsgc.on.ca/ACES/TEI4M/AVRdelay.html
; Assembly code auto-generated
; by utility from Bret Mulvey
; Delay 16 000 000 cycles
; 1s at 16 MHz

/*
		ldi  r25, 82
		ldi  r26, 43
		ldi  r27, 0
	L1: dec  r27
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
			LDI		R24,0B1000111	// 7 -> 1000111 -> 47
			// LDI		R25,0B1111111	// 8 -> 1111111 -> 7F
			// LDI		R26,0B1101111	// 9 -> 1101111 -> 6F
			// LDI		R27,0B1110111	// A -> 1110111 -> 77
			// LDI		R28,0B1111100	// b -> 1111100 -> 7C
			// LDI		R29,0B0111001	// C -> 0111001 -> 39
			// LDI		R30,0B1011110	// d -> 1011110 -> 5E
			// LDI		R31,0B1111001	// E -> 1111001 -> 79
			// LDI		R32,0B1110001	// F -> 1110001 -> 71
			
CICLO:		OUT		PORTA,R17

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L1:		DEC  R27
			BRNE L1
			DEC  R26
			BRNE L1
			DEC  R25
			BRNE L1
			LPM
			NOP

			OUT		PORTA,R18

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L2:		DEC  R27
			BRNE L2
			DEC  R26
			BRNE L2
			DEC  R25
			BRNE L2
			LPM
			NOP

			OUT		PORTA,R19

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L3:		DEC  R27
			BRNE L3
			DEC  R26
			BRNE L3
			DEC  R25
			BRNE L3
			LPM
			NOP

			OUT		PORTA,R20

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L4:		DEC  R27
			BRNE L4
			DEC  R26
			BRNE L4
			DEC  R25
			BRNE L4
			LPM
			NOP

			OUT		PORTA,R21

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L5:		DEC  R27
			BRNE L5
			DEC  R26
			BRNE L5
			DEC  R25
			BRNE L5
			LPM
			NOP

			OUT		PORTA,R22

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L6:		DEC  R27
			BRNE L6
			DEC  R26
			BRNE L6
			DEC  R25
			BRNE L6
			LPM
			NOP

			OUT		PORTA,R23

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L7:		DEC  R27
			BRNE L7
			DEC  R26
			BRNE L7
			DEC  R25
			BRNE L7
			LPM
			NOP

			OUT		PORTA,R24

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L8:		DEC  R27
			BRNE L8
			DEC  R26
			BRNE L8
			DEC  R25
			BRNE L8
			LPM
			NOP

			OUT		PORTA,R23

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L9:		DEC  R27
			BRNE L9
			DEC  R26
			BRNE L9
			DEC  R25
			BRNE L9
			LPM
			NOP

			OUT		PORTA,R22

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L10:	DEC  R27
			BRNE L10
			DEC  R26
			BRNE L10
			DEC  R25
			BRNE L10
			LPM
			NOP

			OUT		PORTA,R21

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L11:	DEC  R27
			BRNE L11
			DEC  R26
			BRNE L11
			DEC  R25
			BRNE L11
			LPM
			NOP

			OUT		PORTA,R20

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L12:	DEC  R27
			BRNE L12
			DEC  R26
			BRNE L12
			DEC  R25
			BRNE L12
			LPM
			NOP

			OUT		PORTA,R19

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L13:	DEC  R27
			BRNE L13
			DEC  R26
			BRNE L13
			DEC  R25
			BRNE L13
			LPM
			NOP

			OUT		PORTA,R18

			LDI  R25, 82
			LDI  R26, 43
			LDI  R27, 0
	L14:	DEC  R27
			BRNE L14
			DEC  R26
			BRNE L14
			DEC  R25
			BRNE L14
			LPM
			NOP

			RJMP	CICLO