#include <stdio.h>

int fibo(int);

int main() {
    int number;
    printf("N: ");
    scanf("%d", &number);
    int result = fibo(number);
    printf("Fibo is %d", result);
    return 0;
}
int fibo(int n){
    if(n == 0 || n == 1){
        return n;
    }
    return fibo(n-1) + fibo(n-2);
}