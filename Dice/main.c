#include <stdio.h>
#include "Lib.h"
#include <time.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>

#define MAX_BETS 10
#define MAX_THREADS 100
#define DEBUG 1

typedef struct bet{
    pthread_t owner;
    DiceNbr value;
} Bet;

Bet bets[MAX_BETS];
pthread_t players[MAX_THREADS];
pthread_mutex_t locker;

void fillBetArray(Bet b[MAX_BETS], pthread_t o);
void printBetArray(Bet b[MAX_BETS]);
void* play(void* a);

int main() {
    srand(time(NULL));
    pthread_mutex_init(&locker, NULL);
    for(int i = 0; i < MAX_THREADS; i++) {
        pthread_create(&players[i], NULL, play, NULL);

        #if DEBUG
        pthread_mutex_lock(&locker);
        printf("Player[%d] created successfully!\n", (int) players[i]);
        pthread_mutex_unlock(&locker);
        #endif
    }

    for(int i = 0; i < MAX_THREADS; i++) {
        pthread_join(players[i], NULL);

        #if DEBUG
        pthread_mutex_lock(&locker);
        printf("Player[%d] joined successfully!\n", (int) players[i]);
        pthread_mutex_unlock(&locker);
        #endif
    }

    pthread_mutex_destroy(&locker);
    return 0;
}

void fillBetArray(Bet b[MAX_BETS], pthread_t o){
    for(int i = 0; i < MAX_BETS; i++) {
        b[i].value = randomDice();
        b[i].owner = o;
    }
}

void printBetArray(Bet b[MAX_BETS]){
    for(int i = 0; i < MAX_BETS; i++) {
        printf("O:%d - V:%d\n", (int) b[i].owner, b[i].value);
    }
}

void* play(void* a){
    sleep(0.01);
    pthread_mutex_lock(&locker);
    fillBetArray(bets, pthread_self());
    printBetArray(bets);
    pthread_mutex_unlock(&locker);
}