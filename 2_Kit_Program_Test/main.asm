// +----------------------------------------------------------------------------+
// | Author.......: Vanessa Reteguín <vanessa@reteguin.com>
// | First release: May 19th, 2025
// | Last update..: May 19th, 2025
// | WhatIs.......: Kit Program Test - Main
// +----------------------------------------------------------------------------+

// ------------ Resources / Documentation involved -------------
// Bit Shifting with Delays Teacher's Tutorial: https://www.youtube.com/watch?v=apbuP5SLwVA

// ------------ Objective -------------
// Construir el circuito para probar el "Programa KIT"

.INCLUDE <M8515DEF.INC>

// Declaramos el puerto A como salida

			LDI		R16,0XFF
			OUT		DDRA,R16	// Configuramos el puerto como salida

			LDI		R17,0B10000000
			LDI		R18,0B01000000
			LDI		R19,0B00100000
			LDI		R20,0B00010000
			LDI		R21,0B00001000
			LDI		R22,0B00000100
			LDI		R23,0B00000010
			LDI		R24,0B00000001

CICLO:		OUT		PORTA,R17

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
L1:			DEC		R27
			BRNE	L1
			DEC		R26
			BRNE	L1
			DEC		R25
			BRNE	L1

			OUT		PORTA,R18

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
L2:			DEC		R27
			BRNE	L2
			DEC		R26
			BRNE	L2
			DEC		R25
			BRNE	L2

			OUT		PORTA,R19

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
			DEC		R27
			BRNE	L3
L3:			DEC		R26
			BRNE	L3
			DEC		R25
			BRNE	L3

			OUT		PORTA,R20

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
			DEC		R27
			BRNE	L4
L4:			DEC		R26
			BRNE	L4
			DEC		R25
			BRNE	L4

			OUT		PORTA,R21

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
			DEC		R27
			BRNE	L5
L5:			DEC		R26
			BRNE	L5
			DEC		R25
			BRNE	L5

			OUT		PORTA,R22

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
			DEC		R27
			BRNE	L6
L6:			DEC		R26
			BRNE	L6
			DEC		R25
			BRNE	L6

			OUT		PORTA,R23

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
			DEC		R27
			BRNE	L7
L7:			DEC		R26
			BRNE	L7
			DEC		R25
			BRNE	L7

			OUT		PORTA,R24

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
L8:			DEC		R27
			BRNE	L8
			DEC		R26
			BRNE	L8
			DEC		R25
			BRNE	L8

			OUT		PORTA,R23

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
L9:			DEC		R27
			BRNE	L9
			DEC		R26
			BRNE	L9
			DEC		R25
			BRNE	L9

			OUT		PORTA,R22

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
L10:		DEC		R27
			BRNE	L10
			DEC		R26
			BRNE	L10
			DEC		R25
			BRNE	L10

			OUT		PORTA,R21

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
L11:		DEC		R27
			BRNE	L11
			DEC		R26
			BRNE	L11
			DEC		R25
			BRNE	L11

			OUT		PORTA,R20

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
L12:		DEC		R27
			BRNE	L12
			DEC		R26
			BRNE	L12
			DEC		R25
			BRNE	L12

			OUT		PORTA,R19

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
L13:		DEC		R27
			BRNE	L13
			DEC		R26
			BRNE	L13
			DEC		R25
			BRNE	L13

			OUT		PORTA,R18

			LDI		R25,1
			LDI		R26,150
			LDI		R27,128
L14:		DEC		R27
			BRNE	L14
			DEC		R26
			BRNE	L14
			DEC		R25
			BRNE	L14

			RJMP	CICLO
