#include <stdio.h>
#include <stdlib.h>

long long int call;

int tarai(int* stack) {
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
        stack[3] = x - 1;
        stack[4] = y;
        stack[5] = z;
        int x2 = tarai(stack + 3);

        stack[3] = y - 1;
        stack[4] = z;
        stack[5] = x;
        int y2 = tarai(stack + 3);

        stack[3] = z - 1;
        stack[4] = x;
        stack[5] = y;
        int z2 = tarai(stack + 3);

        stack[3] = x2;
        stack[4] = y2;
        stack[5] = z2;
        return tarai(stack + 3);
    }
}

int main() {
    call = 0;
    int* stack = malloc(2 * 1024 * 1024);
    stack[0] = 15;
    stack[1] = 8;
    stack[2] = 0;
    printf("return %d\n", tarai(stack));
    printf("call %lld\n", call);
    return 0;
}
