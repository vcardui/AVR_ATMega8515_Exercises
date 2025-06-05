// +----------------------------------------------------------------------------+
// | Author.......: Martin Isai Nuñez Villeda <raisainu@outlook.com>           |
// | First release: May 19th, 2025                                              |
// | Last update..: June 6th, 2025                                              |
// | WhatIs.......: Connecting 4 7SegmentsDisplays different values - Main      |
// +----------------------------------------------------------------------------+

// ------------ Objective -------------
// Programa que en un solo puerto conecte 4 Displays de 7 segmentos, solo se activará uno a la vez y cada uno mostrará un valor distinto.


//explicacion aaaaaaaa
//basicamente use 7 segmentos y me aroveche de que tiene el anodo comun y hice que se le diera corriente en funcion del 7 segmentos que le tocara.
.include "m8515def.inc"

MAIN:
; ---------------- Configuración inicial ----------------
LDI R16, HIGH(RAMEND)
OUT SPH, R16
LDI R16, LOW(RAMEND)
OUT SPL, R16

LDI R16, 0xFF
OUT DDRA, R16           ; PORTA como salida (segmentos)

LDI R16, 0x0F
OUT DDRC, R16           ; PORTC0–3 como salida (control de displays)
LDI R16, 0x00
OUT PORTC, R16          
; ---------------- Valores a mostrar ----------------

LOOP:
	; DISPLAY 1
	LDI R24, 1                  ; índice para '1'
	RCALL MOSTRAR
	LDI R16, 0b0001             ; activar solo display 1 (PC0)
	OUT PORTC, R16
	RCALL DELAY

	; DISPLAY 2
	LDI R24, 2
	RCALL MOSTRAR
	LDI R16, 0b0010             ; activar solo display 2 (PC1)
	OUT PORTC, R16
	RCALL DELAY

	; DISPLAY 3
	LDI R24, 3
	RCALL MOSTRAR
	LDI R16, 0b0100             ; activar solo display 3 (PC2)
	OUT PORTC, R16
	RCALL DELAY

	; DISPLAY 4
	LDI R24, 4
	RCALL MOSTRAR
	LDI R16, 0b1000             ; activar solo display 4 (PC3)
	OUT PORTC, R16
	RCALL DELAY

	RJMP LOOP

; ---------------- Subrutina para mostrar en display ----------------
MOSTRAR:
	LDI R31, HIGH(TABLE * 2)
	LDI R30, LOW(TABLE * 2)
	ADD R30, R24
	LPM R16, Z
	OUT PORTA, R16
	RET

; ---------------- Subrutina de retardo ----------------
DELAY:
	LDI R18, 5
	LDI R19, 30
	LDI R20, 229
L1: DEC R20
	BRNE L1
	DEC R19
	BRNE L1
	DEC R18
	BRNE L1
	RET

; ---------------- Tabla de segmentos (lógica negativa) ----------------
.org 0x0200
TABLE:
.DB 0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8
.DB 0x80, 0x98, 0x88, 0x83, 0xC6, 0xA1, 0x86, 0x8E
