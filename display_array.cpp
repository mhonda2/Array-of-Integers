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

//FilePurpose: This function displays the contents of array.
//             This part of the program is written in C++ language.

#include <iostream>
#include <cstring>
using namespace std;
extern "C" void display_array(long int nums[], long int size);

void display_array(long int nums[], long int size)
{
  cout << "Here's the numbers you entered:\n";
  for (int i = 0; i < size; ++i)
  {
    printf("%ld ", nums[i]);
  }
  cout << "\n\n";

}
