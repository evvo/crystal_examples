#include <stdio.h>

int sum_numbers (int number1, int number2) {
    return number1 + number2;
}

int subtract_numbers (int number1, int number2) {
    return number1 - number2;
}

void print_array_items (int values[5]) {
    printf("Numbers: \n");
    for(int i = 0; i < 5; ++i) {
        printf("%d\n", values[i]);
    }
}