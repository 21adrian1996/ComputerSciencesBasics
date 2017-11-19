#include <stdio.h>

int fibo(int);

int main() {
    int number;
    printf("Size: ");
    scanf("%d", &number);
    for (int i = 1; i <= number; ++i) {
        for(int j = 1; j <= i; ++j){
            printf("%d ", fibo(j));
        }
        printf("\n");
    }
    return 0;
}

int fibo(int n){
    if(n == 0 || n == 1){
        return n;
    }
    return fibo(n-1) + fibo(n-2);
}