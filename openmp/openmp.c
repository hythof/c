#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
    clock_t start = clock();
    long int sum = 0;
    int *x = malloc(sizeof(int) * COUNT);

#if _OPENMP
#pragma omp for nowait
#endif
    for(int i=0; i<COUNT; ++i) {
        x[i] = i;
    }

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
    }
    int msec = clock() - start;

#if _OPENMP
    printf("parallel sum = %ld : msec %d cpu=%d\n", sum, msec, omp_get_num_procs());
#else
    printf("  serial sum = %ld : msec %d\n", sum, msec);
#endif
    return 0;
}
