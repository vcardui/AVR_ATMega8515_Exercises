// +----------------------------------------------------------------------------+
// | Author.......: Alexis Alberto Zúñiga Alonso <>
// | First release: May 20th, 2025
// | Last update..: June 4th, 2025
// | WhatIs.......: Port A to B Data Transfer - Main
// +----------------------------------------------------------------------------+

// ------------ Resources / Documentation involved -------------


// ------------ Objective -------------
// Leer datos digitales desde el PORTB (configurado como entrada) y transferirlos a PORTA (configurado
; como salida), aplicando un desplazamiento de bits hacia la izquierda con un retardo para que se
; pueda observar el proceso (por ejemplo, en LEDs).

; Inclusion de las definiciones del microcontrolador
.INCLUDE <M8515DEF.INC>

.CSEG
.ORG 0x0000

RJMP INIT					; Ir a la rutina de inicialización en el arranque

; // { Inicializacion }
INIT:
	LDI R16, 0xFF
	OUT DDRA, R16			; Configuramos todos los pines de PORTA como salidas

	LDI R16, 0x00
	OUT DDRB, R16			; Configuramos todos los pines de PORTB como entradas

	RJMP MAIN_LOOP

// { Bucle principal }
MAIN_LOOP:
	IN R17, PINB			; Se lee el estado de PORTB

	MOV R18, R17			; Copiamos el valor leído a R18 para trabajarlo
	RCALL SHIFT_N_SHOW

	RJMP MAIN_LOOP			; Repite el ciclo infinitamente

// { Sub:	Desplazamiento
//			Visualización }
SHIFT_N_SHOW:
	LDI R16, 8				; 8 desplazamientos (1 por bit)

SHIFT_LOOP:
	OUT PORTA, R18			; Muestra el patrón actual en PORTA (LEDs)
	RCALL DELAY				; Espera para que sea visible el cambio

	LSL R18					; Desplaza un bit a la izquierda
	DEC R19	
	BRNE SHIFT_LOOP			; Repite hasta haber hecho 8 desplazamientos

// { Sub: Delay }
DELAY:
	LDI R20, 0xFF
	LDI R21, 0xFF
WAIT1:
	DEC R21
	BRNE WAIT1
	DEC R20
	BRNE WAIT1
	RET
