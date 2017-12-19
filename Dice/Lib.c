// filename: Lic.c

#include <stdlib.h>
#include "Lib.h"

/* Returns an integer in the range [0, n).*/
int randInt(int n) {
  if ((n - 1) == RAND_MAX) return rand();
  else {
    long end = RAND_MAX / n;
    end *= n;
    int r;
    while ((r = rand()) >= end);
    return r % n;
  }
}

DiceNbr randomDice(){return 1+randInt(six-one+1);}

