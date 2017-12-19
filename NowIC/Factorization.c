#include <stdio.h>

void factorize(int);
int main() {
    int number;
    while(number != 0){
        printf("\nWrite a number: ");
        scanf("%d", &number);
        printf("Factor: ");
        factorize(number);
    }
}

void factorize(int n){
    if(n == 0 || n == 1){
        printf("Is not a prim: %d", n);
        return;
    }
    if(n < 0){
        printf("%d * ", -1);
        n = n * (-1);
    }
    static int divisor = 2;
    if(n == divisor){
        printf("%d", divisor);
        return;
    }
    if(n%divisor == 0){
        printf("%d * ", divisor);
        n = n / divisor;
    } else {
        divisor++;
    }
    factorize(n);

}