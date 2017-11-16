#include <stdio.h>

int toN(int);

int main() {
    int number;
    printf("N: ");
    scanf("%d", &number);
    int result = toN(number);
    printf("Sum is %d", result);
    return 0;
}
int toN(int n){
    if(n == 0){
        return 0;
    }
    return n + toN(n-1);
}