// +----------------------------------------------------------------------------+
// | Author.......: Vanessa Reteguín <vanessa@reteguin.com>
// | Author.......: 
// | First release: May 19th, 2025
// | Last update..: May 19th, 2025
// | WhatIs.......: Conditional 7 Segments Display Cycle: 0 to 9 or A to F  - Main
// +----------------------------------------------------------------------------+

// ------------ Resources / Documentation involved -------------
// Bit Shifting with Delays Teacher's Tutorial: https://www.youtube.com/watch?v=apbuP5SLwVA

// ------------ Objective -------------
// Programa que lea UN BIT de forma cíclica de UN PUERTO y si vale 1, entonces mostrará el conteo de 0 a 9 en un display de 7 segmentos, en caso contrario mostrará las letras de la A a la F

.INCLUDE <M8515DEF.INC>