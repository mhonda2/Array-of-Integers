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

;FilePurpose: Reads in a array of numbers with a loop and
;             terminates when user enters ctrl + D. This part
;             of the program is written in X86 language.


;External functions to be called
extern printf
extern scanf
extern isinteger
extern atolong

global input_array

segment .data              ;Initialize data

promptForInts db "Please enter long integers separated by a space or enter.", 10, 0
showHowToExit db "After the last input press enter followed by ctrl+D:", 10, 0
showNumElements db "You entered a total of %ld number(s) in the array.", 10, 0
tryAgain db "This is not a valid number.", 10, 0
stringFormat db "%s", 0
longIntFormat db "%ld", 0

segment .bss               ;Uninitialized data

segment .text              ;Instructions for executing
input_array:

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
mov qword r14, rdi
mov qword r15, rsi

;Prompt user to enter the array of integers
mov qword rdi, stringFormat
mov qword rsi, promptForInts
mov qword rax, 0
call printf

;Tell user what to do after inputing all integers
mov qword rdi, stringFormat
mov qword rsi, showHowToExit
mov qword rax, 0
call printf

sub rsp, 256      ;256 bytes available on top of stack

;Set the loop counter
mov qword r13, 0

loopStart:
cmp r13, r15        ;Make sure input doesn't exceed array size
jge loopEnd

;Get integers
mov qword rax, 0
mov qword rdi, stringFormat
mov qword rsi, rsp
call scanf

;Check for loop exit
cdqe
cmp rax, -1
je loopEnd

;Check individual char for nums 0-9
mov rax, 0
mov rdi, rsp
call isinteger
mov rbx, rax

;Test for validity
cmp rbx, 0
je error

;Convert string to integer
mov rdi, rsp
call atolong
mov r12, rax

;Save integer into array
mov [r14+8*r13], r12
inc r13

jmp loopStart

loopEnd:

;Output number of elements
mov qword rdi, showNumElements
mov qword rsi, r13
mov qword rax, 0
call printf

;Return number of elements back to manager
mov qword rax, r13
jmp conclusion

error:
;Output message that input was rejected
mov rax, 0
mov rdi, stringFormat
mov rsi, tryAgain
call printf
jmp loopStart

conclusion:
;Restore general registers
add rsp, 256    ;reverse earlier sub
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

;Return
ret
