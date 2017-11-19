#include <stdlib.h> // for rand(), RAND_MAX
#include <stdio.h>
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