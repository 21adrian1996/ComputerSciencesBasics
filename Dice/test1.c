#include <stdio.h>
#include "Lib.h"
#include <time.h>
#include <stdlib.h>

int main() {
    srand(time(NULL));
    for(int i = 0; i < 1000; i++) printf("%d\n", randomDice());
    return 0;
}