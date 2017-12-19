#include <stdio.h>
#include "Lib.h"
#include <time.h>
#include <stdlib.h>

#define MAX_BETS 10

typedef struct bet{
    int owner;
    DiceNbr value;
} Bet;

Bet bets[MAX_BETS];

void fillBetArray(Bet b[MAX_BETS], int o);
void printBetArray(Bet b[MAX_BETS]);

int main() {
    srand(time(NULL));

    fillBetArray(bets, 0);
    printBetArray(bets);
    return 0;
}

void fillBetArray(Bet b[MAX_BETS], int o){
    for(int i = 0; i < MAX_BETS; i++) {
        b[i].value = randomDice();
        b[i].owner = o;
    }
}

void printBetArray(Bet b[MAX_BETS]){
    for(int i = 0; i < MAX_BETS; i++) {
        printf("O:%d - V:%d\n", b[i].owner, b[i].value);
    }
}