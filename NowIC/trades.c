#include <stdio.h>
#include <stdlib.h>

#define MAX_STRING_SIZE 30
#define MAX_SHARES 2

typedef struct share{
    char symbol[MAX_STRING_SIZE];
    char valor[MAX_STRING_SIZE];
    float value, oldValue;
    float difference; // value-oldValue
}Share;

Share shares[MAX_SHARES];

void fillShareArray(Share* sa);
void printShareArray(Share* sa);
Share getShare();
void printShare(Share* s);
void addNewShare(Share *shA);

int main(int argc, char *argv[]) {
    fillShareArray(shares);
    printShareArray(shares);
    return 0;
}

void fillShareArray(Share* sa) {
    for(int i=0; i < MAX_SHARES; i++) {
        addNewShare(sa++);
    }
}

void printShareArray(Share* sa) {
    for(int i = 0; i < MAX_SHARES ; i++) {
        printShare(sa++);
    }
}

Share getShare() {
    Share* s = (Share*) malloc(sizeof(Share));
    printf("Enter symbol: ");
    scanf("%s", s->symbol);
    printf("Enter valor: ");
    scanf("%s", s->valor);
    printf("Enter value: ");
    scanf("%f", &s->value);
    printf("Enter old value: ");
    scanf("%f", &s->oldValue);
    s->difference = (*s).value - (*s).oldValue;
    return *s;
}
void printShare(Share* s) {
    printf("Symbol: %s\n", (*s).symbol);
    printf("Valor: %s\n", (*s).valor);
    printf("Value: %f\n", (*s).value);
    printf("OldValue: %f\n", (*s).oldValue);
    printf("Difference: %f\n", (*s).difference);
}
void addNewShare(Share *shA){
    Share s = getShare();
    *shA = s;
}