//This program is designed to read in a input of numbers
//and store them in an array.
//It computes the sum and outputs it.

/* Copyright (C) 2020  Megan Honda
This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>. */

//Author: Megan Honda
//Date Created: September 10, 2020
//Date Finished: September 22, 2020
//Last Updated: September 22, 2020

//Files Used:   main.c
//              manager.asm
//              input_array.asm
//              display_array.cpp
//              sum.asm
//              atol.asm
//              validate-decimal-digits.cpp
//              r.sh

//FilePurpose: Calls the function to manage array input function
//             and the sum function. This part
//             of the program is written in C language.

#include <stdio.h>
#include <stdint.h>

long int manager();

int main(void) {
  printf("Welcome to Array of Integers.\n");
  printf("Brought to you by Megan Honda.\n\n");
  long int answer = manager();
  printf("Main recieved sum of %ld.\n", answer);
  printf("Thank you for using this program.\n");

  return 0;
}
