#!/bin/bash

#Program: Array of Integers
#Author: Megan Honda

#Delete un-needed files
rm *.o
rm *.out


#Assembling 'manager.asm'
nasm -f elf64 -l manager.lis -o manager.o manager.asm

#Assembling 'input_array.asm'
nasm -f elf64 -l input_array.lis -o input_array.o input_array.asm

#Assembling 'sum.asm'
nasm -f elf64 -l sum.lis -o sum.o sum.asm

#Compiling 'display_array.cpp'
g++ -c -Wall -m64 -fno-pie -no-pie -o display_array.o display_array.cpp -std=c++17

#Compiling 'main.c'
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c17

#Compiling 'validate-decimal-digits.cpp'
g++ -c -m64 -Wall -fno-pie -no-pie -o digits.o validate-decimal-digits.cpp -std=c++17

#Assembling 'atol.asm'
nasm -f elf64 -o atol.o atol.asm

#Link the files
g++ -m64 -fno-pie -no-pie -o ArrayOfInts.out -std=c17 manager.o main.o input_array.o display_array.o sum.o digits.o atol.o

#Run the program
./ArrayOfInts.out
