
a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000400430 <_init>:
  400430:	48 83 ec 08          	sub    $0x8,%rsp
  400434:	e8 97 02 00 00       	callq  4006d0 <call_gmon_start>
  400439:	48 83 c4 08          	add    $0x8,%rsp
  40043d:	c3                   	retq   

Disassembly of section .plt:

0000000000400440 <clock@plt-0x10>:
  400440:	ff 35 62 07 20 00    	pushq  0x200762(%rip)        # 600ba8 <_GLOBAL_OFFSET_TABLE_+0x8>
  400446:	ff 25 64 07 20 00    	jmpq   *0x200764(%rip)        # 600bb0 <_GLOBAL_OFFSET_TABLE_+0x10>
  40044c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400450 <clock@plt>:
  400450:	ff 25 62 07 20 00    	jmpq   *0x200762(%rip)        # 600bb8 <_GLOBAL_OFFSET_TABLE_+0x18>
  400456:	68 00 00 00 00       	pushq  $0x0
  40045b:	e9 e0 ff ff ff       	jmpq   400440 <_init+0x10>

0000000000400460 <printf@plt>:
  400460:	ff 25 5a 07 20 00    	jmpq   *0x20075a(%rip)        # 600bc0 <_GLOBAL_OFFSET_TABLE_+0x20>
  400466:	68 01 00 00 00       	pushq  $0x1
  40046b:	e9 d0 ff ff ff       	jmpq   400440 <_init+0x10>

0000000000400470 <__libc_start_main@plt>:
  400470:	ff 25 52 07 20 00    	jmpq   *0x200752(%rip)        # 600bc8 <_GLOBAL_OFFSET_TABLE_+0x28>
  400476:	68 02 00 00 00       	pushq  $0x2
  40047b:	e9 c0 ff ff ff       	jmpq   400440 <_init+0x10>

0000000000400480 <malloc@plt>:
  400480:	ff 25 4a 07 20 00    	jmpq   *0x20074a(%rip)        # 600bd0 <_GLOBAL_OFFSET_TABLE_+0x30>
  400486:	68 03 00 00 00       	pushq  $0x3
  40048b:	e9 b0 ff ff ff       	jmpq   400440 <_init+0x10>

Disassembly of section .text:

0000000000400490 <main>:
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  400490:	41 56                	push   %r14
  400492:	41 55                	push   %r13
  400494:	41 54                	push   %r12
  400496:	55                   	push   %rbp
  400497:	53                   	push   %rbx
  400498:	48 83 ec 20          	sub    $0x20,%rsp
    clock_t start = clock();
  40049c:	e8 af ff ff ff       	callq  400450 <clock@plt>
    long int sum = 0;
    int *x = malloc(sizeof(int) * COUNT);
  4004a1:	bf 00 84 d7 17       	mov    $0x17d78400,%edi

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
    clock_t start = clock();
  4004a6:	48 89 c5             	mov    %rax,%rbp
    long int sum = 0;
    int *x = malloc(sizeof(int) * COUNT);
  4004a9:	e8 d2 ff ff ff       	callq  400480 <malloc@plt>
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  4004ae:	49 89 c3             	mov    %rax,%r11
  4004b1:	41 83 e3 0f          	and    $0xf,%r11d
  4004b5:	49 c1 eb 02          	shr    $0x2,%r11
  4004b9:	49 f7 db             	neg    %r11
  4004bc:	45 89 d8             	mov    %r11d,%r8d
  4004bf:	41 83 e0 03          	and    $0x3,%r8d
  4004c3:	41 0f 94 c5          	sete   %r13b
  4004c7:	0f 84 b9 01 00 00    	je     400686 <main+0x1f6>
  4004cd:	48 89 c1             	mov    %rax,%rcx
  4004d0:	31 d2                	xor    %edx,%edx
  4004d2:	be 00 e1 f5 05       	mov    $0x5f5e100,%esi
  4004d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  4004de:	00 00 

#if _OPENMP
#pragma omp for nowait
#endif
    for(int i=0; i<COUNT; ++i) {
        x[i] = i;
  4004e0:	89 11                	mov    %edx,(%rcx)
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  4004e2:	89 f3                	mov    %esi,%ebx
    int *x = malloc(sizeof(int) * COUNT);

#if _OPENMP
#pragma omp for nowait
#endif
    for(int i=0; i<COUNT; ++i) {
  4004e4:	83 c2 01             	add    $0x1,%edx
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  4004e7:	29 d3                	sub    %edx,%ebx
  4004e9:	48 83 c1 04          	add    $0x4,%rcx
  4004ed:	41 39 d0             	cmp    %edx,%r8d
  4004f0:	77 ee                	ja     4004e0 <main+0x50>
  4004f2:	41 ba 00 e1 f5 05    	mov    $0x5f5e100,%r10d
  4004f8:	41 83 e3 03          	and    $0x3,%r11d
  4004fc:	45 29 c2             	sub    %r8d,%r10d
  4004ff:	44 89 d7             	mov    %r10d,%edi
  400502:	c1 ef 02             	shr    $0x2,%edi
  400505:	44 8d 0c bd 00 00 00 	lea    0x0(,%rdi,4),%r9d
  40050c:	00 
  40050d:	45 85 c9             	test   %r9d,%r9d
  400510:	41 0f 94 c4          	sete   %r12b
  400514:	74 70                	je     400586 <main+0xf6>
  400516:	8d 4a 01             	lea    0x1(%rdx),%ecx
  400519:	89 54 24 0c          	mov    %edx,0xc(%rsp)
  40051d:	4a 8d 34 98          	lea    (%rax,%r11,4),%rsi
  400521:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
  400525:	8d 4a 02             	lea    0x2(%rdx),%ecx
  400528:	66 0f 6e 54 24 10    	movd   0x10(%rsp),%xmm2
  40052e:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
  400532:	8d 4a 03             	lea    0x3(%rdx),%ecx
  400535:	66 0f 6e 4c 24 18    	movd   0x18(%rsp),%xmm1
  40053b:	89 4c 24 1c          	mov    %ecx,0x1c(%rsp)
  40053f:	31 c9                	xor    %ecx,%ecx
  400541:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
  400547:	66 0f 62 c8          	punpckldq %xmm0,%xmm1
  40054b:	66 0f 6e 44 24 0c    	movd   0xc(%rsp),%xmm0
  400551:	66 0f 62 c2          	punpckldq %xmm2,%xmm0
  400555:	66 0f 6c c1          	punpcklqdq %xmm1,%xmm0
  400559:	66 0f 6f 0d 2f 03 00 	movdqa 0x32f(%rip),%xmm1        # 400890 <_IO_stdin_used+0x30>
  400560:	00 
  400561:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400568:	83 c1 01             	add    $0x1,%ecx

#if _OPENMP
#pragma omp for nowait
#endif
    for(int i=0; i<COUNT; ++i) {
        x[i] = i;
  40056b:	66 0f 7f 06          	movdqa %xmm0,(%rsi)
  40056f:	66 0f fe c1          	paddd  %xmm1,%xmm0
  400573:	48 83 c6 10          	add    $0x10,%rsi
  400577:	39 f9                	cmp    %edi,%ecx
  400579:	72 ed                	jb     400568 <main+0xd8>
  40057b:	44 01 ca             	add    %r9d,%edx
  40057e:	44 29 cb             	sub    %r9d,%ebx
  400581:	45 39 ca             	cmp    %r9d,%r10d
  400584:	74 17                	je     40059d <main+0x10d>
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  400586:	48 63 ca             	movslq %edx,%rcx
  400589:	01 d3                	add    %edx,%ebx
  40058b:	48 8d 0c 88          	lea    (%rax,%rcx,4),%rcx
  40058f:	90                   	nop

#if _OPENMP
#pragma omp for nowait
#endif
    for(int i=0; i<COUNT; ++i) {
        x[i] = i;
  400590:	89 11                	mov    %edx,(%rcx)
    int *x = malloc(sizeof(int) * COUNT);

#if _OPENMP
#pragma omp for nowait
#endif
    for(int i=0; i<COUNT; ++i) {
  400592:	83 c2 01             	add    $0x1,%edx
  400595:	48 83 c1 04          	add    $0x4,%rcx
  400599:	39 da                	cmp    %ebx,%edx
  40059b:	75 f3                	jne    400590 <main+0x100>
  40059d:	45 84 ed             	test   %r13b,%r13b
  4005a0:	0f 85 ec 00 00 00    	jne    400692 <main+0x202>
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  4005a6:	48 89 c1             	mov    %rax,%rcx
  4005a9:	31 d2                	xor    %edx,%edx
  4005ab:	31 db                	xor    %ebx,%ebx
  4005ad:	41 be 00 e1 f5 05    	mov    $0x5f5e100,%r14d
  4005b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
  4005b8:	48 63 31             	movslq (%rcx),%rsi
    }

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
  4005bb:	83 c2 01             	add    $0x1,%edx
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  4005be:	45 89 f5             	mov    %r14d,%r13d
  4005c1:	41 29 d5             	sub    %edx,%r13d
  4005c4:	48 83 c1 04          	add    $0x4,%rcx

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
  4005c8:	48 01 f3             	add    %rsi,%rbx
  4005cb:	44 39 c2             	cmp    %r8d,%edx
  4005ce:	72 e8                	jb     4005b8 <main+0x128>
  4005d0:	45 84 e4             	test   %r12b,%r12b
  4005d3:	75 61                	jne    400636 <main+0x1a6>
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  4005d5:	66 0f ef c0          	pxor   %xmm0,%xmm0
  4005d9:	4a 8d 34 98          	lea    (%rax,%r11,4),%rsi

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
  4005dd:	66 0f ef e4          	pxor   %xmm4,%xmm4
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  4005e1:	31 c9                	xor    %ecx,%ecx
  4005e3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
  4005e8:	66 0f 6f 0e          	movdqa (%rsi),%xmm1
  4005ec:	83 c1 01             	add    $0x1,%ecx
  4005ef:	66 0f 6f d4          	movdqa %xmm4,%xmm2
  4005f3:	48 83 c6 10          	add    $0x10,%rsi
  4005f7:	66 0f 6f d9          	movdqa %xmm1,%xmm3
  4005fb:	39 f9                	cmp    %edi,%ecx
  4005fd:	66 0f 66 d1          	pcmpgtd %xmm1,%xmm2
  400601:	66 0f 62 da          	punpckldq %xmm2,%xmm3
  400605:	66 0f 6a ca          	punpckhdq %xmm2,%xmm1
  400609:	66 0f d4 c3          	paddq  %xmm3,%xmm0
  40060d:	66 0f d4 c1          	paddq  %xmm1,%xmm0
  400611:	72 d5                	jb     4005e8 <main+0x158>
  400613:	66 0f 6f c8          	movdqa %xmm0,%xmm1
  400617:	44 01 ca             	add    %r9d,%edx
  40061a:	45 29 cd             	sub    %r9d,%r13d
  40061d:	66 0f 73 d9 08       	psrldq $0x8,%xmm1
  400622:	66 0f d4 c1          	paddq  %xmm1,%xmm0
  400626:	66 0f d6 44 24 10    	movq   %xmm0,0x10(%rsp)
  40062c:	48 03 5c 24 10       	add    0x10(%rsp),%rbx
  400631:	45 39 ca             	cmp    %r9d,%r10d
  400634:	74 29                	je     40065f <main+0x1cf>
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  400636:	48 63 d2             	movslq %edx,%rdx
  400639:	41 83 ed 01          	sub    $0x1,%r13d
  40063d:	48 8d 0c 90          	lea    (%rax,%rdx,4),%rcx
  400641:	4c 01 ea             	add    %r13,%rdx
  400644:	48 8d 54 90 04       	lea    0x4(%rax,%rdx,4),%rdx
  400649:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
  400650:	48 63 01             	movslq (%rcx),%rax
  400653:	48 83 c1 04          	add    $0x4,%rcx
  400657:	48 01 c3             	add    %rax,%rbx
    }

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
  40065a:	48 39 d1             	cmp    %rdx,%rcx
  40065d:	75 f1                	jne    400650 <main+0x1c0>
        sum += x[i];
    }
    int msec = clock() - start;
  40065f:	e8 ec fd ff ff       	callq  400450 <clock@plt>
  400664:	89 c2                	mov    %eax,%edx

#if _OPENMP
    printf("parallel sum = %ld : msec %d cpu=%d\n", sum, msec, omp_get_num_procs());
#else
    printf("  serial sum = %ld : msec %d\n", sum, msec);
  400666:	48 89 de             	mov    %rbx,%rsi
  400669:	bf 64 08 40 00       	mov    $0x400864,%edi
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
    }
    int msec = clock() - start;
  40066e:	29 ea                	sub    %ebp,%edx

#if _OPENMP
    printf("parallel sum = %ld : msec %d cpu=%d\n", sum, msec, omp_get_num_procs());
#else
    printf("  serial sum = %ld : msec %d\n", sum, msec);
  400670:	31 c0                	xor    %eax,%eax
  400672:	e8 e9 fd ff ff       	callq  400460 <printf@plt>
#endif
    return 0;
}
  400677:	48 83 c4 20          	add    $0x20,%rsp
  40067b:	31 c0                	xor    %eax,%eax
  40067d:	5b                   	pop    %rbx
  40067e:	5d                   	pop    %rbp
  40067f:	41 5c                	pop    %r12
  400681:	41 5d                	pop    %r13
  400683:	41 5e                	pop    %r14
  400685:	c3                   	retq   
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  400686:	bb 00 e1 f5 05       	mov    $0x5f5e100,%ebx
    int *x = malloc(sizeof(int) * COUNT);

#if _OPENMP
#pragma omp for nowait
#endif
    for(int i=0; i<COUNT; ++i) {
  40068b:	31 d2                	xor    %edx,%edx
  40068d:	e9 60 fe ff ff       	jmpq   4004f2 <main+0x62>
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  400692:	41 bd 00 e1 f5 05    	mov    $0x5f5e100,%r13d
  400698:	31 d2                	xor    %edx,%edx
  40069a:	31 db                	xor    %ebx,%ebx
  40069c:	e9 2f ff ff ff       	jmpq   4005d0 <main+0x140>
  4006a1:	90                   	nop
  4006a2:	90                   	nop
  4006a3:	90                   	nop

00000000004006a4 <_start>:
  4006a4:	31 ed                	xor    %ebp,%ebp
  4006a6:	49 89 d1             	mov    %rdx,%r9
  4006a9:	5e                   	pop    %rsi
  4006aa:	48 89 e2             	mov    %rsp,%rdx
  4006ad:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4006b1:	50                   	push   %rax
  4006b2:	54                   	push   %rsp
  4006b3:	49 c7 c0 b0 07 40 00 	mov    $0x4007b0,%r8
  4006ba:	48 c7 c1 c0 07 40 00 	mov    $0x4007c0,%rcx
  4006c1:	48 c7 c7 90 04 40 00 	mov    $0x400490,%rdi
  4006c8:	e8 a3 fd ff ff       	callq  400470 <__libc_start_main@plt>
  4006cd:	f4                   	hlt    
  4006ce:	90                   	nop
  4006cf:	90                   	nop

00000000004006d0 <call_gmon_start>:
  4006d0:	48 83 ec 08          	sub    $0x8,%rsp
  4006d4:	48 8b 05 bd 04 20 00 	mov    0x2004bd(%rip),%rax        # 600b98 <_DYNAMIC+0x1e0>
  4006db:	48 85 c0             	test   %rax,%rax
  4006de:	74 02                	je     4006e2 <call_gmon_start+0x12>
  4006e0:	ff d0                	callq  *%rax
  4006e2:	48 83 c4 08          	add    $0x8,%rsp
  4006e6:	c3                   	retq   
  4006e7:	90                   	nop
  4006e8:	90                   	nop
  4006e9:	90                   	nop
  4006ea:	90                   	nop
  4006eb:	90                   	nop
  4006ec:	90                   	nop
  4006ed:	90                   	nop
  4006ee:	90                   	nop
  4006ef:	90                   	nop

00000000004006f0 <deregister_tm_clones>:
  4006f0:	b8 ef 0b 60 00       	mov    $0x600bef,%eax
  4006f5:	55                   	push   %rbp
  4006f6:	48 2d e8 0b 60 00    	sub    $0x600be8,%rax
  4006fc:	48 83 f8 0e          	cmp    $0xe,%rax
  400700:	48 89 e5             	mov    %rsp,%rbp
  400703:	77 02                	ja     400707 <deregister_tm_clones+0x17>
  400705:	5d                   	pop    %rbp
  400706:	c3                   	retq   
  400707:	b8 00 00 00 00       	mov    $0x0,%eax
  40070c:	48 85 c0             	test   %rax,%rax
  40070f:	74 f4                	je     400705 <deregister_tm_clones+0x15>
  400711:	5d                   	pop    %rbp
  400712:	bf e8 0b 60 00       	mov    $0x600be8,%edi
  400717:	ff e0                	jmpq   *%rax
  400719:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400720 <register_tm_clones>:
  400720:	b8 e8 0b 60 00       	mov    $0x600be8,%eax
  400725:	55                   	push   %rbp
  400726:	48 2d e8 0b 60 00    	sub    $0x600be8,%rax
  40072c:	48 c1 f8 03          	sar    $0x3,%rax
  400730:	48 89 e5             	mov    %rsp,%rbp
  400733:	48 89 c2             	mov    %rax,%rdx
  400736:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40073a:	48 01 d0             	add    %rdx,%rax
  40073d:	48 89 c6             	mov    %rax,%rsi
  400740:	48 d1 fe             	sar    %rsi
  400743:	75 02                	jne    400747 <register_tm_clones+0x27>
  400745:	5d                   	pop    %rbp
  400746:	c3                   	retq   
  400747:	ba 00 00 00 00       	mov    $0x0,%edx
  40074c:	48 85 d2             	test   %rdx,%rdx
  40074f:	74 f4                	je     400745 <register_tm_clones+0x25>
  400751:	5d                   	pop    %rbp
  400752:	bf e8 0b 60 00       	mov    $0x600be8,%edi
  400757:	ff e2                	jmpq   *%rdx
  400759:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400760 <__do_global_dtors_aux>:
  400760:	80 3d 81 04 20 00 00 	cmpb   $0x0,0x200481(%rip)        # 600be8 <__bss_start>
  400767:	75 11                	jne    40077a <__do_global_dtors_aux+0x1a>
  400769:	55                   	push   %rbp
  40076a:	48 89 e5             	mov    %rsp,%rbp
  40076d:	e8 7e ff ff ff       	callq  4006f0 <deregister_tm_clones>
  400772:	5d                   	pop    %rbp
  400773:	c6 05 6e 04 20 00 01 	movb   $0x1,0x20046e(%rip)        # 600be8 <__bss_start>
  40077a:	f3 c3                	repz retq 
  40077c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400780 <frame_dummy>:
  400780:	48 83 3d 28 02 20 00 	cmpq   $0x0,0x200228(%rip)        # 6009b0 <__JCR_END__>
  400787:	00 
  400788:	74 1b                	je     4007a5 <frame_dummy+0x25>
  40078a:	b8 00 00 00 00       	mov    $0x0,%eax
  40078f:	48 85 c0             	test   %rax,%rax
  400792:	74 11                	je     4007a5 <frame_dummy+0x25>
  400794:	55                   	push   %rbp
  400795:	bf b0 09 60 00       	mov    $0x6009b0,%edi
  40079a:	48 89 e5             	mov    %rsp,%rbp
  40079d:	ff d0                	callq  *%rax
  40079f:	5d                   	pop    %rbp
  4007a0:	e9 7b ff ff ff       	jmpq   400720 <register_tm_clones>
  4007a5:	e9 76 ff ff ff       	jmpq   400720 <register_tm_clones>
  4007aa:	90                   	nop
  4007ab:	90                   	nop
  4007ac:	90                   	nop
  4007ad:	90                   	nop
  4007ae:	90                   	nop
  4007af:	90                   	nop

00000000004007b0 <__libc_csu_fini>:
  4007b0:	f3 c3                	repz retq 
  4007b2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  4007b9:	1f 84 00 00 00 00 00 

00000000004007c0 <__libc_csu_init>:
  4007c0:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  4007c5:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  4007ca:	48 8d 2d d7 01 20 00 	lea    0x2001d7(%rip),%rbp        # 6009a8 <__init_array_end>
  4007d1:	4c 8d 25 c8 01 20 00 	lea    0x2001c8(%rip),%r12        # 6009a0 <__frame_dummy_init_array_entry>
  4007d8:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  4007dd:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  4007e2:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  4007e7:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  4007ec:	48 83 ec 38          	sub    $0x38,%rsp
  4007f0:	4c 29 e5             	sub    %r12,%rbp
  4007f3:	41 89 fd             	mov    %edi,%r13d
  4007f6:	49 89 f6             	mov    %rsi,%r14
  4007f9:	48 c1 fd 03          	sar    $0x3,%rbp
  4007fd:	49 89 d7             	mov    %rdx,%r15
  400800:	e8 2b fc ff ff       	callq  400430 <_init>
  400805:	48 85 ed             	test   %rbp,%rbp
  400808:	74 1c                	je     400826 <__libc_csu_init+0x66>
  40080a:	31 db                	xor    %ebx,%ebx
  40080c:	0f 1f 40 00          	nopl   0x0(%rax)
  400810:	4c 89 fa             	mov    %r15,%rdx
  400813:	4c 89 f6             	mov    %r14,%rsi
  400816:	44 89 ef             	mov    %r13d,%edi
  400819:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40081d:	48 83 c3 01          	add    $0x1,%rbx
  400821:	48 39 eb             	cmp    %rbp,%rbx
  400824:	72 ea                	jb     400810 <__libc_csu_init+0x50>
  400826:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  40082b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  400830:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  400835:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  40083a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  40083f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  400844:	48 83 c4 38          	add    $0x38,%rsp
  400848:	c3                   	retq   
  400849:	90                   	nop
  40084a:	90                   	nop
  40084b:	90                   	nop

Disassembly of section .fini:

000000000040084c <_fini>:
  40084c:	48 83 ec 08          	sub    $0x8,%rsp
  400850:	48 83 c4 08          	add    $0x8,%rsp
  400854:	c3                   	retq   
