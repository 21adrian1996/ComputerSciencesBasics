#include <stdio.h>

int max(int, int, int);
int maxShort(int, int, int);

int main() {
    int number;
    int number2;
    int number3;
    printf("First number: ");
    scanf("%d", &number);
    printf("Second number: ");
    scanf("%d", &number2);
    printf("Third number: ");
    scanf("%d", &number3);
    printf("Max is: %d", maxShort(number, number2, number3));
    return 0;
}
int max(int number, int number2, int number3){
    if(number > number2 && number > number3){
        return number;
    } else if(number2 > number && number2 > number3){
        return number2;
    }
    return number3;
}
int maxShort(int a, int b, int c){
    (a>b)?(a>c)?a:(b>c)?b:c:(b>c)?b:c;
}