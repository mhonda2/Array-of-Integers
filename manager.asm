;This program is designed to read in a input of numbers
;and store them in an array.
;It computes the sum and outputs it.
;==============================================================================
;Copyright (C) 2020  Megan Honda
;This program is free software: you can redistribute it and/or modify
;it under the terms of the GNU General Public License as published by
;the Free Software Foundation, either version 3 of the License, or
;(at your option) any later version.
;This program is distributed in the hope that it will be useful,
;but WITHOUT ANY WARRANTY; without even the implied warranty of
;MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;GNU General Public License for more details.
;You should have received a copy of the GNU General Public License
;along with this program.  If not, see <https://www.gnu.org/licenses/>.
;==============================================================================
;Author: Megan Honda
;Date Created: September 10, 2020
;Date Finished: September 22, 2020
;Last Updated: September 24, 2020

;FilePurpose: Manages the different functions that input, sum, and
;             output the array. This part
;             of the program is written in X86 language.


;External functions to be called
extern printf
extern input_array
extern display_array
extern sum

global manager

arraysize equ 20

segment .data              ;Initialize data

introduce db "This function will calculate the sum of numbers.", 10, 0
showSum db "The sum of all the integers is %ld.", 10, 0
farewell db "Returning the sum back to main.", 10, 10, 0
stringFormat db "%s", 0
longIntFormat db "%ld", 0

segment .bss               ;Uninitialized data
ints resq arraysize

segment .text              ;Instructions for executing
manager:

;Back up general purpose registers
push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
push rbx
pushf

;Output introduce message
mov qword rax, 0
mov qword rdi, stringFormat
mov qword rsi, introduce
call printf

;Call input_array
mov qword rax, 0
mov qword rdi, ints
mov qword rsi, arraysize
call input_array

;Store number of elements in array
mov qword r14, rax

;Call display_array
mov qword rax, 0
mov qword rdi, ints
mov qword rsi, r14
call display_array

;Call sum
mov qword rax, 0
mov qword rdi, ints
mov qword rsi, r14
call sum

;Save the sum
mov qword r15, rax

;Output the sum
mov qword rax, 0
mov qword rdi, showSum
mov qword rsi, r15
call printf

;Output farewell message
mov qword rax, 0
mov qword rdi, stringFormat
mov qword rsi, farewell
call printf

;Prepare to send back sum
mov qword rax, r15

;Restore general registers
popf
pop rbx
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rcx
pop rdx
pop rsi
pop rdi
pop rbp

;Return sum back to Main
ret
