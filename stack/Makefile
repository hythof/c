all:
	make full
	make less
	make less2

full:
	@gcc -g -O3 -Wall -std=gnu99 -o $@.out $@.c
	objdump -d $@.out > $@.txt
	/usr/bin/time -p ./$@.out

less:
	@gcc -g -O3 -Wall -std=gnu99 -o $@.out $@.c
	objdump -d $@.out > $@.txt
	/usr/bin/time -p ./$@.out

less2:
	@gcc -g -O3 -Wall -std=gnu99 -o $@.out $@.c
	objdump -d $@.out > $@.txt
	/usr/bin/time -p ./$@.out
