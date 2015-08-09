#include <stdio.h>

extern int add(int, int);

int main() {
    int ret = add(3, 4);
    printf("%d\n", ret);
    return 0;
}
