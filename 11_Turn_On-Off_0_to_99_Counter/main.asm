// +----------------------------------------------------------------------------+
// | Author.......: Martin Nunez <raisainu@outlook.com>
// | Author.......: Vanessa Reteguín <vanessa@reteguín.com>
// | First release: May 29th, 2025
// | Last update..: June 4th, 2025
// | WhatIs.......: Turn On-Off 0 to 99_Counter - Main
// +----------------------------------------------------------------------------+

// ------------ Resources / Documentation involved -------------

// ------------ Objective -------------
// Programa que cuenta de 0 a 99 y activa y desactiva una salida de CA cada 10 segundos. 0-10 Apagado, 11-20 Encendida, ... Apagada,

.include "m8515def.inc"

; Configurar stack pointer
LDI R16, HIGH(RAMEND)
OUT SPH, R16
LDI R16, LOW(RAMEND)
OUT SPL, R16

; Configurar puertos A y B como salida
LDI R16, 0xFF
OUT DDRA, R16
OUT DDRB, R16

; Inicializar tabla en Z
LDI R30, LOW(TABLE * 2)
LDI R31, HIGH(TABLE * 2)

CLR R24    ; Contador principal (0–99)
CLR R21    ; Estado (0=contando, 1=pausa)
CLR R22    ; Contador de estado

LOOP:
    ; Copiar contador a R25 para manipular
    MOV R25, R24

    ; Separar decenas y unidades
    LDI R26, 10       ; divisor
    CLR R27           ; decenas
DIV_LOOP:
    SUB R25, R26
    BRCS DIV_DONE     ; si R25 < 10, terminó
    INC R27           ; decenas++
    RJMP DIV_LOOP
DIV_DONE:
    ADD R25, R26      ; R25 ahora contiene unidades

    ; Obtener unidades
    LDI R30, LOW(TABLE * 2)
    LDI R31, HIGH(TABLE * 2)
    ADD R30, R25
    LPM R16, Z
    OUT PORTA, R16

    ; Obtener decenas
    LDI R30, LOW(TABLE * 2)
    LDI R31, HIGH(TABLE * 2)
    ADD R30, R27
    LPM R17, Z
    OUT PORTB, R17

    ; Esperar
    RCALL DELAY

    ; Lógica para estado (prendido/apagado)
    CPI R21, 0
    BRNE PAUSED_STATE

COUNTING_STATE:
    INC R22
    CPI R22, 10
    BRLO INCREMENT
    LDI R21, 1       ; Pausar
    CLR R22
    RJMP CHECK_LIMIT

INCREMENT:
    INC R24

PAUSED_STATE:
    INC R22
    CPI R22, 10
    BRLO CHECK_LIMIT
    LDI R21, 0       ; Continuar cuenta
    CLR R22

CHECK_LIMIT:
    CPI R24, 100
    BRLO LOOP
    CLR R24
    RJMP LOOP

    ; Incrementar contador y reiniciar si llega a 100
    INC R24
    CPI R24, 100
    BRNE LOOP
    CLR R24
    RJMP LOOP

; ------------------ Subrutinas ------------------

DELAY:
  ldi  r18, 9
    ldi  r19, 30
    ldi  r20, 229
L1: dec  r20
    brne L1
    dec  r19
    brne L1
    dec  r18
    brne L1
    RET

; ------------------ Tabla 7 segmentos ------------------
TABLE:
.DB 0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x98
