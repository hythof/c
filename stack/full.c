#include <stdio.h>

long long int call;

int tarai(int x, int y, int z) {
    ++call;
    if(x <= y)
    {
        return y;
    }
    else
    {
        int x2 = tarai(x - 1, y, z);
        int y2 = tarai(y - 1, z, x);
        int z2 = tarai(z - 1, x, y);
        return tarai(x2, y2, z2);
    }
}

int main() {
    call = 0;
    printf("return %d\n", tarai(15, 8, 0));
    printf("call %lld\n", call);
    return 0;
}
