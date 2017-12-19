#include <stdio.h>

int main(int argc, char **argv){
    printf("Number of arguments is: %s\n", argc);
    int c=0;
    while(c<argc){
        c++;
    }
    return 0;
}