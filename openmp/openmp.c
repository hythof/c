#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define COUNT 100 * 1024 * 1024

int main(int argc, char *argv[]) {
    unsigned long long sum = 0;
    int *xs = (int *)malloc(sizeof(int) * COUNT);
    int i;
    clock_t start;

    start = clock();
#if OPENMP
#pragma omp parallel for reduction(+:sum)
#endif
    for(i=0; i<COUNT; ++i) {
        xs[i] = i;
        sum += i;
    }

    int msec = clock() - start;
#if OPENMP
    printf("parallel sum = %ld : msec %d\n", sum, msec);
#else
    printf("  serial sum = %ld : msec %d\n", sum, msec);
#endif
    return 0;
}
