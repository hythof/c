#include <stdio.h>
#include <stdlib.h>

int* stack;
long long int call;

int tarai() {
    int x = stack[0];
    int y = stack[1];
    int z = stack[2];

    ++call;
    if(x <= y)
    {
        return y;
    }
    else
    {
        stack[0] = x - 1;
        stack[1] = y;
        stack[2] = z;
        int x2 = tarai();

        stack[0] = y - 1;
        stack[1] = z;
        stack[2] = x;
        int y2 = tarai();

        stack[0] = z - 1;
        stack[1] = x;
        stack[2] = y;
        int z2 = tarai();

        stack[0] = x2;
        stack[1] = y2;
        stack[2] = z2;
        return tarai();
    }
}

int main() {
    call = 0;
    stack = malloc(2 * 1024 * 1024);
    stack[0] = 15;
    stack[1] = 8;
    stack[2] = 0;
    printf("return %d\n", tarai());
    printf("call %lld\n", call);
    return 0;
}
