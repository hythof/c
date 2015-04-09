openmp:
	@gcc -g -O3 -Wall -std=gnu99          $@.c && ./a.out && objdump -S a.out >   serial.asm; rm a.out
	@gcc -g -O3 -Wall -std=gnu99 -fopenmp $@.c && ./a.out && objdump -S a.out > parallel.asm; rm a.out
