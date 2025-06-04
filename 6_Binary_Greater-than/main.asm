/* 
 * Programa_Seis.asm
 * 
 * Created: 03/06/2025 09:45:02
 * 
 * Autores:
 *    - Alexis Alberto Z��iga Alonso
 *
 * Objetivo del programa:
 * Programa que lea dos n�meros en binario (en dos puertos diferentes) y coloque
 * el mayor de los dos en el tercer puerto.
 */


; ------------------------------------------------------------------------------------------------------
; NOTA IMPORTANTE:
; ------------------------------------------------------------------------------------------------------
; Los archivos de definici�n est�ndar (como el de la ATMega8515) son muy extensos, y en la mayor�a de
; casos no necesitamos ver su contenido completo. Para ello nos ayuda la directiva .NOLIST, que evitar�
; que aparezca en el archivo .LST. En cambio, el .LIST har� que el resto del c�digo s� aparezca en
; el archivo de listado (generado durante la compilaci�n).
; ------------------------------------------------------------------------------------------------------
.NOLIST
.INCLUDE <m8515def.inc>
.LIST

// { Definici�n de Registros }
.DEF Temp	 = R16			; Registro temporal y para hacer operaciones
.DEF NumeroA = R17			; Almacena el n�mero del puerto A
.DEF NumeroC = R18			; Almacena el n�mero del puerto B

.ORG	0x0000				; Vector de RESET (Limpia basura cada vez que se
							; enciende o reinicia el microcontrolador)
	RJMP INIT				; Salta al inicio

// { Rutina principal }
INIT:
	; Configuramos el Stack Pointer
	LDI Temp, LOW(RAMEND)
	OUT SPL, Temp
	LDI Temp, HIGH(RAMEND)
	OUT SPH, Temp
	
	; Configuramos los puertos de entrada y salida
	LDI Temp, 0x00		; Asignamos ceros a Temp
	OUT DDRA, Temp		; Puerto A
	OUT DDRC, Temp		; Puerto C
	OUT DDRB, Temp		; Puerto B

MAIN_LOOP:
	; Lectura de los puertos de entrada
	IN NumeroA, PINA	; Lee el estado de los pines en PORTA y lo guarda en NumeroA
	IN NumeroC, PINC	; Lee el estado de los pines en PORTC y lo guarda en NumeroC

	; Comparamos los puertos
	CP NumeroA, NumeroC
			; Si A >= C, el flag C (Carry) se pone como 0
			; Si A < C, el flag se pone como 1

	; BRSH (Branch if Same or Higher) - Salta si el NumeroA >= NumeroC (C = 0)
	BRSH A_IS_HEQ

	; Si no salta, entonces C es mayor que A
	OUT PORTB, NumeroC		; Muestra NumeroC en PORTB
	RJMP MAIN_LOOP

// { Subrutina
// | A es mayor o igual (Higher or Equal) }
A_IS_HEQ:
	OUT PORTB, NumeroA
	RJMP MAIN_LOOP