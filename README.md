# 👻 AVR ATMega8515 Exercises
Assembly exercises for AVR ATMega8515

## ✌️ Team
- Martín Isaí Nuñez Villeda - [tzisai](https://github.com/tzisai)
- Vanessa Reteguín Arcadia - [vcardui](https://github.com/vcardui)
- Alexis Alberto Zúñiga Alonso - [coding-cluster](https://github.com/tzisai)

## 🎯 Programs Objectives

1. Record the program and build the circuit to test the transfer from port PB to port PA.
2. Build the circuit to test the "KIT Program" (moving lights from Knight Rider car)
3. Write a program that displays the count from 0 to F cyclically on a 7-segment display (Inverse Logic is suggested).
4. Write a program that cyclically counts from 0 to 99 (use two ports as outputs).
5. A program that cyclically reads one bit from one port. If it equals 1, it will display the count from 0 to 9 on a 7-segment display. Otherwise, it will display the letters A to F.
6. A program that reads two binary numbers (on two different ports) and places the larger of the two on a third port.
7. Program that reads two binary numbers (on two different ports) and outputs the sum of both to a third port (the output will blink if the sum overflows, that is, if the sum cannot be represented in 8 bits).
8. Program that connects four 7-segment displays to a single port, each displaying the same value.

(Original instructions in Spanish)

1. Grabar el programa y construir el circuito para probar la transferencia del puerto PB al Puerto PA.
2. Construir el circuito para probar el "Programa KIT".
3. Escribir un programa que despliegue en un Display de 7 segmentos el conteo de O a F de forma cíclica (Se sugiere que sea con Lógica Inversa).
4. Escribir programa que cuente de manera cíclica del 0 al 99 (utilizar 2 puertos
como salidas).
5. Programa que lea UN BIT de forma cíclica de UN PUERTO y si vale 1, entonces mostrará el conteo de 0 a 9 en un display de 7 segmentos, en caso contrario
mostrará las letras de la A a la F.
6. Programa que lea 2 números en binario (en dos puertos diferentes) y coloque el mayor de los dos en un tercer puerto.
7. Programa que lea 2 números en binario (en dos puertos diferentes) y coloque la suma de ambos en un tercer puerto (la salida parpadeará si la suma se desborda, es decir, si la suma no se puede representar en 8 bits).
8. Programa que en un solo puerto conecte 4 Displays de 7 segmentos mostrando
el mismo valor.

### Working project demo

### 2_Kit_Program_Test
https://github.com/user-attachments/assets/f3bc58a0-f047-435d-a620-c9752039a84d

### 3_7SegmentsDisplay_Cycle_0_to_F
https://github.com/user-attachments/assets/f50bd2c1-0b61-4ca9-a0d2-baa1aa9b8b86

### 4_0_to_99_Counter
https://github.com/user-attachments/assets/53097d35-165c-42ec-9bfd-720d62abd2e2

### 5_Conditional_7SegmentsDisplay_Cycle_0_to_9_or_A_to_F_demo
https://github.com/user-attachments/assets/973d70a7-1a8d-430f-8e22-2be9bdaa1a7d

### 8_Binary_to_decimal_in_7SegmentsDisplay
https://github.com/user-attachments/assets/11d9c830-22f4-4feb-987a-b69671b84932

### 9_Connecting_4_7SegmentsDisplays_different_values
https://github.com/user-attachments/assets/adf60789-c5a3-44d9-a0d3-4bc49f1d25af

## 🙌 Project Personal Milestones

- The main challenge was itself learning assembly due to the fact that we are very used to high-level languages such as C++, Python and Java.
- Understood that it is crucial to keep in mind hardware details when working with low level languages. Limited memory space made us get creative and look for new approaches for storing and handling data.
- Implementing tables, mainly on 0 to 99 Counter, made workflow so much smoother and easy to handle. Specially due to the less than 15 available registers.
- Experience often beats working solutions. One of our teammate’s uncle very kindly advised us how to reduce code and optimize storage. His large low-level languages background was crucial in spotting solutions and challenged us opening up our minds to new approaches. Asking for help once in a while is ok too.
- Nevertheless, taking in count our novelty into the paradigm and finals week pressure, some programs were proudly done poorly. Sometimes is more important something is just done than having empty hands.
- Regarding teamwork, we learned that it is important to revaluate how much time we estimate something will take us as well to avoid distractions that may be holding us up from completing the task; despite working on other due projects.

## 💡 Inspiration for creating this project

This is our “Computational Organization” last term projects (the equivalent of an exam). Each one seems to be more challenging than the previous one, but we went through it.
