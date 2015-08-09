// minimum value product
#include <stdio.h>
#include <stdlib.h>

#define trace(...) do{ printf(__VA_ARGS__); printf("\n"); } while(0)
#define push(type, value) do{ \
        if(vm->stack + sizeof(type) <= vm->stack_end) { \
            *(type*)(vm->stack) = value; \
            vm->stack += sizeof(type); \
        } else { \
            size_t used = vm->stack - vm->stack_top; \
            size_t new_size = (vm->stack_end - vm->stack_top) * 2; \
            vm->stack_top = (char *)realloc(vm->stack_top, new_size); \
            vm->stack = vm->stack_top + used; \
            vm->stack_end = vm->stack + new_size; \
            trace("resize stack used=%zd new_size=%zd", used, new_size); \
        } \
    } while(0)
#define pop(type) *(type*)(vm->stack -= sizeof(type))

typedef struct v_vm {
    char* stack;
    char* stack_top;
    char* stack_end;
    void (*call)(struct v_vm*);
} v_vm;

void v_add(v_vm *vm) {
    int b = pop(int);
    int a = pop(int);
    trace("in add(%d, %d)", a, b);
    int ret = a + b;
    trace("out add %d", ret);
    push(int, ret);
    vm->call = NULL;
}

void v_main(v_vm* vm) {
    trace("in main");
    push(int, 4);
    push(int, 3);
    vm->call = v_add;
}

int main(int argc, char* argv[]) {
    v_vm vm;
    int stack_size = 1024;
    vm.stack = malloc(stack_size);
    vm.stack_top = vm.stack;
    vm.stack_end = vm.stack + stack_size;
    vm.call = v_main;
    do {
        (*vm.call)(&vm);
        trace("- do coroutine");
    } while(vm.call != NULL);
    return 0;
}
