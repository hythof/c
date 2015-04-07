openmp:
	@gcc -g $@.c                    && ./a.out && objdump -S a.out >   serial.asm; rm a.out
	@gcc -g -fopenmp -D OPENMP $@.c && ./a.out && objdump -S a.out > parallel.asm; rm a.out
