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
;Last Updated: October 1, 2020

;FilePurpose: This function add together all the numbers in the array.
;             This part of the program is written in X86 language.


;External functions to be called
extern printf

global sum

segment .data              ;Initialize data

segment .bss               ;Uninitialized data

segment .text              ;Instructions for executing
sum:

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

;Save array and size
mov r12, rdi
mov r13, rsi


;Add together all numbers in the array
mov qword r14, 0      ;start counter

mov qword r15, 0      ;prepare to accumulate total

loopStart:

cmp r14, r13
jg loopEnd

add r15, [r12+8*r14]

inc r14
jmp loopStart

loopEnd:

;Save sum to be returned
mov rax, r15

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

;Return back to Main
ret
