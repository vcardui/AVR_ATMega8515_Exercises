// +----------------------------------------------------------------------------+
// | Author.......: Martin Nunez <raisainu@outlook.com>
// | First release: May 29th, 2025
// | Last update..: May 30th, 2025
// | WhatIs.......: 0-9 / A-F switch counter with 7-segment using INT0
// +----------------------------------------------------------------------------+

// ------------ Objective -------------
// Escribir programa que cuente de manera cíclica del 0 al 9 o A a F .
// Write a program for the ATmega8515 which counts from 0 to 9 or A to F depending on an input.

// ------------ Resources -------------
// Utiliza interrupciones, tabla de valores 7 segmentos (lógica negativa), y delay básico

.include "m8515def.inc"

// ------------------- Configuración inicial ---------------------
.cseg
.org 0x0000

RJMP MAIN              ; Vector de reset
RJMP INT0_ISR          ; Vector de interrupción externa INT0 (PD2) 

MAIN:
; ---------------- Configuración inicial ----------------

LDI R16, HIGH(RAMEND)
OUT SPH, R16
LDI R16, LOW(RAMEND)
OUT SPL, R16

LDI R16, 0xFF
OUT DDRA, R16           ; Puerto A como salida (7 segmentos)

LDI R16, 0x00
OUT DDRD, R16           ; Puerto D como entrada
LDI R16, (1 << PD2)
OUT PORTD, R16          ; Pull-up interno activado en PD2 (INT0)

LDI R16, (1 << ISC01) | (1 << ISC00)
OUT MCUCR, R16          ; Interrupción en flanco de subida
LDI R16, (1 << INT0)
OUT GICR, R16           ; Habilita INT0

SEI                     ; Habilita interrupciones globales

CLR R25                 ; Bandera de cambio de modo (0 = sin cambio, 1 = cambiar modo)
LDI R28, 1              ; Modo inicial: 0–9

LOOP:
	CLR R25             ; Limpia bandera de cambio al entrar
	CPI R28, 1
	BREQ CUENTA_0_9
	CPI R28, 0
	BREQ CUENTA_A_F
	RJMP LOOP

; ---------------- Modo 0-9 ----------------
CUENTA_0_9:
	LDI R24, 0
CUENTA_0_9_LOOP:
	LDI R31, HIGH(TABLE * 2)
	LDI R30, LOW(TABLE * 2)
	ADD R30, R24
	LPM R16, Z
	OUT PORTA, R16
	RCALL DELAY
	CPI R25, 1
	BREQ LOOP           ; Si se cambió modo, salir a LOOP
	INC R24
	CPI R24, 10
	BRNE CUENTA_0_9_LOOP
	RJMP LOOP

; ---------------- Modo A-F ----------------
CUENTA_A_F:
	LDI R24, 10
CUENTA_A_F_LOOP:
	LDI R31, HIGH(TABLE * 2)
	LDI R30, LOW(TABLE * 2)
	ADD R30, R24
	LPM R16, Z
	OUT PORTA, R16
	RCALL DELAY
	CPI R25, 1
	BREQ LOOP           ; Si se cambió modo, salir a LOOP
	INC R24
	CPI R24, 16
	BRNE CUENTA_A_F_LOOP
	RJMP LOOP

; ---------------- Subrutina de retardo ----------------
DELAY:
	LDI R18, 9
	LDI R19, 30
	LDI R20, 229
L1: DEC R20
	BRNE L1
	DEC R19
	BRNE L1
	DEC R18
	BRNE L1
	RET

; ---------------- Interrupción INT0 ----------------
INT0_ISR:
	CPI R28, 1
	BREQ CAMBIA_A_F
	LDI R28, 1
	LDI R25, 1          ; Señala que hay que cambiar modo
	RETI
CAMBIA_A_F:
	LDI R28, 0
	LDI R25, 1          ; Señala que hay que cambiar modo
	RETI

// ------------ Segmento de Datos Constantes -------------
.org 0x0200        ; Tabla de segmentos (lejos del código principal)
TABLE:
; lógica negativa 7 segmentos para 0–9 y A–F
.DB 0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8
.DB 0x80, 0x98, 0x88, 0x83, 0xC6, 0xA1, 0x86, 0x8E
