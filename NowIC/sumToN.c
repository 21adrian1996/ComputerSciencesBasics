#include <stdio.h>


int main() {
    int number;
    printf("N: ");
    scanf("%d", &number);
    int result = 0;
    for (int i = 0; i <= number; ++i) {
        result += i;
    }
    printf("Sum is %d", result);
    return 0;
}