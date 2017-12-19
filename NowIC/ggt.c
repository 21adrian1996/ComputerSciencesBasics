#include <stdio.h>

int ggt(int, int);

void main(){
    int a;
    int b;
    printf("Input a: ");
    scanf("%d", &a);
    printf("Input b: ");
    scanf("%d", &b);
    printf("GGT is: %d", ggt(a,b));
}

int ggt(int a, int b){
    int rest = a % b;
    if(rest == 0) {
        return b;
    }
    ggt(b, rest);
}