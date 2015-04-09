
a.out:     file format elf64-x86-64


Disassembly of section .init:

00000000004005f8 <_init>:
  4005f8:	48 83 ec 08          	sub    $0x8,%rsp
  4005fc:	e8 27 03 00 00       	callq  400928 <call_gmon_start>
  400601:	48 83 c4 08          	add    $0x8,%rsp
  400605:	c3                   	retq   

Disassembly of section .plt:

0000000000400610 <clock@plt-0x10>:
  400610:	ff 35 f2 07 20 00    	pushq  0x2007f2(%rip)        # 600e08 <_GLOBAL_OFFSET_TABLE_+0x8>
  400616:	ff 25 f4 07 20 00    	jmpq   *0x2007f4(%rip)        # 600e10 <_GLOBAL_OFFSET_TABLE_+0x10>
  40061c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400620 <clock@plt>:
  400620:	ff 25 f2 07 20 00    	jmpq   *0x2007f2(%rip)        # 600e18 <_GLOBAL_OFFSET_TABLE_+0x18>
  400626:	68 00 00 00 00       	pushq  $0x0
  40062b:	e9 e0 ff ff ff       	jmpq   400610 <_init+0x18>

0000000000400630 <omp_get_thread_num@plt>:
  400630:	ff 25 ea 07 20 00    	jmpq   *0x2007ea(%rip)        # 600e20 <_GLOBAL_OFFSET_TABLE_+0x20>
  400636:	68 01 00 00 00       	pushq  $0x1
  40063b:	e9 d0 ff ff ff       	jmpq   400610 <_init+0x18>

0000000000400640 <printf@plt>:
  400640:	ff 25 e2 07 20 00    	jmpq   *0x2007e2(%rip)        # 600e28 <_GLOBAL_OFFSET_TABLE_+0x28>
  400646:	68 02 00 00 00       	pushq  $0x2
  40064b:	e9 c0 ff ff ff       	jmpq   400610 <_init+0x18>

0000000000400650 <__libc_start_main@plt>:
  400650:	ff 25 da 07 20 00    	jmpq   *0x2007da(%rip)        # 600e30 <_GLOBAL_OFFSET_TABLE_+0x30>
  400656:	68 03 00 00 00       	pushq  $0x3
  40065b:	e9 b0 ff ff ff       	jmpq   400610 <_init+0x18>

0000000000400660 <omp_get_num_threads@plt>:
  400660:	ff 25 d2 07 20 00    	jmpq   *0x2007d2(%rip)        # 600e38 <_GLOBAL_OFFSET_TABLE_+0x38>
  400666:	68 04 00 00 00       	pushq  $0x4
  40066b:	e9 a0 ff ff ff       	jmpq   400610 <_init+0x18>

0000000000400670 <omp_get_num_procs@plt>:
  400670:	ff 25 ca 07 20 00    	jmpq   *0x2007ca(%rip)        # 600e40 <_GLOBAL_OFFSET_TABLE_+0x40>
  400676:	68 05 00 00 00       	pushq  $0x5
  40067b:	e9 90 ff ff ff       	jmpq   400610 <_init+0x18>

0000000000400680 <malloc@plt>:
  400680:	ff 25 c2 07 20 00    	jmpq   *0x2007c2(%rip)        # 600e48 <_GLOBAL_OFFSET_TABLE_+0x48>
  400686:	68 06 00 00 00       	pushq  $0x6
  40068b:	e9 80 ff ff ff       	jmpq   400610 <_init+0x18>

Disassembly of section .text:

0000000000400690 <main>:
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  400690:	41 54                	push   %r12
  400692:	55                   	push   %rbp
  400693:	53                   	push   %rbx
  400694:	48 83 ec 20          	sub    $0x20,%rsp
    clock_t start = clock();
  400698:	e8 83 ff ff ff       	callq  400620 <clock@plt>
    long int sum = 0;
    int *x = malloc(sizeof(int) * COUNT);
  40069d:	bf 00 84 d7 17       	mov    $0x17d78400,%edi

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
    clock_t start = clock();
  4006a2:	48 89 c5             	mov    %rax,%rbp
    long int sum = 0;
    int *x = malloc(sizeof(int) * COUNT);
  4006a5:	e8 d6 ff ff ff       	callq  400680 <malloc@plt>
  4006aa:	49 89 c4             	mov    %rax,%r12

#if _OPENMP
#pragma omp for nowait
  4006ad:	e8 ae ff ff ff       	callq  400660 <omp_get_num_threads@plt>
  4006b2:	89 c3                	mov    %eax,%ebx
  4006b4:	e8 77 ff ff ff       	callq  400630 <omp_get_thread_num@plt>
  4006b9:	89 c1                	mov    %eax,%ecx
  4006bb:	b8 00 e1 f5 05       	mov    $0x5f5e100,%eax
  4006c0:	89 c2                	mov    %eax,%edx
  4006c2:	c1 fa 1f             	sar    $0x1f,%edx
  4006c5:	f7 fb                	idiv   %ebx
  4006c7:	39 d1                	cmp    %edx,%ecx
  4006c9:	7d 05                	jge    4006d0 <main+0x40>
  4006cb:	83 c0 01             	add    $0x1,%eax
  4006ce:	31 d2                	xor    %edx,%edx
  4006d0:	0f af c8             	imul   %eax,%ecx
  4006d3:	01 ca                	add    %ecx,%edx
  4006d5:	8d 34 02             	lea    (%rdx,%rax,1),%esi
  4006d8:	39 f2                	cmp    %esi,%edx
  4006da:	0f 8d f5 00 00 00    	jge    4007d5 <main+0x145>
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  4006e0:	48 63 c2             	movslq %edx,%rax
  4006e3:	41 89 f0             	mov    %esi,%r8d
  4006e6:	49 8d 3c 84          	lea    (%r12,%rax,4),%rdi
  4006ea:	41 29 d0             	sub    %edx,%r8d
  4006ed:	48 89 f9             	mov    %rdi,%rcx
  4006f0:	83 e1 0f             	and    $0xf,%ecx
  4006f3:	48 c1 e9 02          	shr    $0x2,%rcx
  4006f7:	48 f7 d9             	neg    %rcx
  4006fa:	83 e1 03             	and    $0x3,%ecx
  4006fd:	41 39 c8             	cmp    %ecx,%r8d
  400700:	41 0f 42 c8          	cmovb  %r8d,%ecx
  400704:	41 83 f8 05          	cmp    $0x5,%r8d
  400708:	41 0f 46 c8          	cmovbe %r8d,%ecx
  40070c:	85 c9                	test   %ecx,%ecx
  40070e:	74 1f                	je     40072f <main+0x9f>
  400710:	31 c0                	xor    %eax,%eax
  400712:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

#if _OPENMP
#pragma omp for nowait
#endif
    for(int i=0; i<COUNT; ++i) {
        x[i] = i;
  400718:	89 14 87             	mov    %edx,(%rdi,%rax,4)
  40071b:	48 83 c0 01          	add    $0x1,%rax
  40071f:	83 c2 01             	add    $0x1,%edx
  400722:	39 c1                	cmp    %eax,%ecx
  400724:	77 f2                	ja     400718 <main+0x88>
  400726:	41 39 c8             	cmp    %ecx,%r8d
  400729:	0f 84 a6 00 00 00    	je     4007d5 <main+0x145>
  40072f:	45 89 c2             	mov    %r8d,%r10d
  400732:	89 c8                	mov    %ecx,%eax
  400734:	41 29 ca             	sub    %ecx,%r10d
  400737:	45 89 d0             	mov    %r10d,%r8d
  40073a:	41 c1 e8 02          	shr    $0x2,%r8d
  40073e:	46 8d 0c 85 00 00 00 	lea    0x0(,%r8,4),%r9d
  400745:	00 
  400746:	45 85 c9             	test   %r9d,%r9d
  400749:	74 71                	je     4007bc <main+0x12c>
  40074b:	8d 4a 01             	lea    0x1(%rdx),%ecx
  40074e:	89 54 24 0c          	mov    %edx,0xc(%rsp)
  400752:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
  400756:	8d 4a 02             	lea    0x2(%rdx),%ecx
  400759:	66 0f 6e 54 24 10    	movd   0x10(%rsp),%xmm2
  40075f:	89 4c 24 18          	mov    %ecx,0x18(%rsp)
  400763:	8d 4a 03             	lea    0x3(%rdx),%ecx
  400766:	66 0f 6e 4c 24 18    	movd   0x18(%rsp),%xmm1
  40076c:	89 4c 24 1c          	mov    %ecx,0x1c(%rsp)
  400770:	48 8d 0c 87          	lea    (%rdi,%rax,4),%rcx
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  400774:	31 c0                	xor    %eax,%eax
  400776:	66 0f 6e 44 24 1c    	movd   0x1c(%rsp),%xmm0
  40077c:	66 0f 62 c8          	punpckldq %xmm0,%xmm1
  400780:	66 0f 6e 44 24 0c    	movd   0xc(%rsp),%xmm0
  400786:	66 0f 62 c2          	punpckldq %xmm2,%xmm0
  40078a:	66 0f 6c c1          	punpcklqdq %xmm1,%xmm0
  40078e:	66 0f 6f 0d 4a 03 00 	movdqa 0x34a(%rip),%xmm1        # 400ae0 <_IO_stdin_used+0x30>
  400795:	00 
  400796:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40079d:	00 00 00 
  4007a0:	83 c0 01             	add    $0x1,%eax

#if _OPENMP
#pragma omp for nowait
#endif
    for(int i=0; i<COUNT; ++i) {
        x[i] = i;
  4007a3:	66 0f 7f 01          	movdqa %xmm0,(%rcx)
  4007a7:	66 0f fe c1          	paddd  %xmm1,%xmm0
  4007ab:	48 83 c1 10          	add    $0x10,%rcx
  4007af:	44 39 c0             	cmp    %r8d,%eax
  4007b2:	72 ec                	jb     4007a0 <main+0x110>
  4007b4:	44 01 ca             	add    %r9d,%edx
  4007b7:	45 39 ca             	cmp    %r9d,%r10d
  4007ba:	74 19                	je     4007d5 <main+0x145>
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  4007bc:	48 63 c2             	movslq %edx,%rax
  4007bf:	49 8d 04 84          	lea    (%r12,%rax,4),%rax
  4007c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

#if _OPENMP
#pragma omp for nowait
#endif
    for(int i=0; i<COUNT; ++i) {
        x[i] = i;
  4007c8:	89 10                	mov    %edx,(%rax)
  4007ca:	83 c2 01             	add    $0x1,%edx
  4007cd:	48 83 c0 04          	add    $0x4,%rax
  4007d1:	39 d6                	cmp    %edx,%esi
  4007d3:	7f f3                	jg     4007c8 <main+0x138>
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  4007d5:	4c 89 e0             	mov    %r12,%rax
  4007d8:	83 e0 0f             	and    $0xf,%eax
  4007db:	48 c1 e8 02          	shr    $0x2,%rax
  4007df:	48 f7 d8             	neg    %rax
  4007e2:	41 89 c0             	mov    %eax,%r8d
  4007e5:	41 83 e0 03          	and    $0x3,%r8d
  4007e9:	0f 84 fe 00 00 00    	je     4008ed <main+0x25d>
  4007ef:	4c 89 e1             	mov    %r12,%rcx
  4007f2:	31 d2                	xor    %edx,%edx
  4007f4:	31 db                	xor    %ebx,%ebx
  4007f6:	41 b9 00 e1 f5 05    	mov    $0x5f5e100,%r9d
  4007fc:	0f 1f 40 00          	nopl   0x0(%rax)

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
  400800:	48 63 31             	movslq (%rcx),%rsi
    }

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
  400803:	83 c2 01             	add    $0x1,%edx
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  400806:	44 89 cf             	mov    %r9d,%edi
  400809:	29 d7                	sub    %edx,%edi
  40080b:	48 83 c1 04          	add    $0x4,%rcx

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
  40080f:	48 01 f3             	add    %rsi,%rbx
  400812:	41 39 d0             	cmp    %edx,%r8d
  400815:	77 e9                	ja     400800 <main+0x170>
  400817:	41 ba 00 e1 f5 05    	mov    $0x5f5e100,%r10d
  40081d:	83 e0 03             	and    $0x3,%eax
  400820:	45 29 c2             	sub    %r8d,%r10d
  400823:	45 89 d0             	mov    %r10d,%r8d
  400826:	41 c1 e8 02          	shr    $0x2,%r8d
  40082a:	46 8d 0c 85 00 00 00 	lea    0x0(,%r8,4),%r9d
  400831:	00 
  400832:	45 85 c9             	test   %r9d,%r9d
  400835:	74 60                	je     400897 <main+0x207>
#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
    clock_t start = clock();
    long int sum = 0;
  400837:	66 0f ef c0          	pxor   %xmm0,%xmm0
  40083b:	49 8d 34 84          	lea    (%r12,%rax,4),%rsi

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
  40083f:	66 0f ef e4          	pxor   %xmm4,%xmm4
#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
    clock_t start = clock();
    long int sum = 0;
  400843:	31 c9                	xor    %ecx,%ecx
  400845:	0f 1f 00             	nopl   (%rax)

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
  400848:	66 0f 6f 0e          	movdqa (%rsi),%xmm1
  40084c:	83 c1 01             	add    $0x1,%ecx
  40084f:	66 0f 6f d4          	movdqa %xmm4,%xmm2
  400853:	48 83 c6 10          	add    $0x10,%rsi
  400857:	66 0f 6f d9          	movdqa %xmm1,%xmm3
  40085b:	44 39 c1             	cmp    %r8d,%ecx
  40085e:	66 0f 66 d1          	pcmpgtd %xmm1,%xmm2
  400862:	66 0f 62 da          	punpckldq %xmm2,%xmm3
  400866:	66 0f 6a ca          	punpckhdq %xmm2,%xmm1
  40086a:	66 0f d4 c3          	paddq  %xmm3,%xmm0
  40086e:	66 0f d4 c1          	paddq  %xmm1,%xmm0
  400872:	72 d4                	jb     400848 <main+0x1b8>
  400874:	66 0f 6f c8          	movdqa %xmm0,%xmm1
  400878:	44 01 ca             	add    %r9d,%edx
  40087b:	44 29 cf             	sub    %r9d,%edi
  40087e:	66 0f 73 d9 08       	psrldq $0x8,%xmm1
  400883:	66 0f d4 c1          	paddq  %xmm1,%xmm0
  400887:	66 0f d6 44 24 10    	movq   %xmm0,0x10(%rsp)
  40088d:	48 03 5c 24 10       	add    0x10(%rsp),%rbx
  400892:	45 39 ca             	cmp    %r9d,%r10d
  400895:	74 28                	je     4008bf <main+0x22f>
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  400897:	48 63 d2             	movslq %edx,%rdx
  40089a:	83 ef 01             	sub    $0x1,%edi
  40089d:	49 8d 0c 94          	lea    (%r12,%rdx,4),%rcx
  4008a1:	48 01 fa             	add    %rdi,%rdx
  4008a4:	49 8d 54 94 04       	lea    0x4(%r12,%rdx,4),%rdx
  4008a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
  4008b0:	48 63 01             	movslq (%rcx),%rax
  4008b3:	48 83 c1 04          	add    $0x4,%rcx
  4008b7:	48 01 c3             	add    %rax,%rbx
    }

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
  4008ba:	48 39 d1             	cmp    %rdx,%rcx
  4008bd:	75 f1                	jne    4008b0 <main+0x220>
        sum += x[i];
    }
    int msec = clock() - start;
  4008bf:	e8 5c fd ff ff       	callq  400620 <clock@plt>
  4008c4:	49 89 c4             	mov    %rax,%r12

#if _OPENMP
    printf("parallel sum = %ld : msec %d cpu=%d\n", sum, msec, omp_get_num_procs());
  4008c7:	e8 a4 fd ff ff       	callq  400670 <omp_get_num_procs@plt>
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
    }
    int msec = clock() - start;
  4008cc:	44 89 e2             	mov    %r12d,%edx

#if _OPENMP
    printf("parallel sum = %ld : msec %d cpu=%d\n", sum, msec, omp_get_num_procs());
  4008cf:	89 c1                	mov    %eax,%ecx
  4008d1:	48 89 de             	mov    %rbx,%rsi
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
        sum += x[i];
    }
    int msec = clock() - start;
  4008d4:	29 ea                	sub    %ebp,%edx

#if _OPENMP
    printf("parallel sum = %ld : msec %d cpu=%d\n", sum, msec, omp_get_num_procs());
  4008d6:	bf b8 0a 40 00       	mov    $0x400ab8,%edi
  4008db:	31 c0                	xor    %eax,%eax
  4008dd:	e8 5e fd ff ff       	callq  400640 <printf@plt>
#else
    printf("  serial sum = %ld : msec %d\n", sum, msec);
#endif
    return 0;
}
  4008e2:	48 83 c4 20          	add    $0x20,%rsp
  4008e6:	31 c0                	xor    %eax,%eax
  4008e8:	5b                   	pop    %rbx
  4008e9:	5d                   	pop    %rbp
  4008ea:	41 5c                	pop    %r12
  4008ec:	c3                   	retq   
#include <omp.h>

#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
  4008ed:	bf 00 e1 f5 05       	mov    $0x5f5e100,%edi
    }

//#if _OPENMP
//#pragma omp parallel for reduction(+:sum)
//#endif
    for(int i=0; i<COUNT; ++i) {
  4008f2:	31 d2                	xor    %edx,%edx
#define COUNT 100 * 1000 * 1000
double step;

int main(int argc, char *argv[]) {
    clock_t start = clock();
    long int sum = 0;
  4008f4:	31 db                	xor    %ebx,%ebx
  4008f6:	e9 1c ff ff ff       	jmpq   400817 <main+0x187>
  4008fb:	90                   	nop

00000000004008fc <_start>:
  4008fc:	31 ed                	xor    %ebp,%ebp
  4008fe:	49 89 d1             	mov    %rdx,%r9
  400901:	5e                   	pop    %rsi
  400902:	48 89 e2             	mov    %rsp,%rdx
  400905:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400909:	50                   	push   %rax
  40090a:	54                   	push   %rsp
  40090b:	49 c7 c0 00 0a 40 00 	mov    $0x400a00,%r8
  400912:	48 c7 c1 10 0a 40 00 	mov    $0x400a10,%rcx
  400919:	48 c7 c7 90 06 40 00 	mov    $0x400690,%rdi
  400920:	e8 2b fd ff ff       	callq  400650 <__libc_start_main@plt>
  400925:	f4                   	hlt    
  400926:	90                   	nop
  400927:	90                   	nop

0000000000400928 <call_gmon_start>:
  400928:	48 83 ec 08          	sub    $0x8,%rsp
  40092c:	48 8b 05 c5 04 20 00 	mov    0x2004c5(%rip),%rax        # 600df8 <_DYNAMIC+0x200>
  400933:	48 85 c0             	test   %rax,%rax
  400936:	74 02                	je     40093a <call_gmon_start+0x12>
  400938:	ff d0                	callq  *%rax
  40093a:	48 83 c4 08          	add    $0x8,%rsp
  40093e:	c3                   	retq   
  40093f:	90                   	nop

0000000000400940 <deregister_tm_clones>:
  400940:	b8 67 0e 60 00       	mov    $0x600e67,%eax
  400945:	55                   	push   %rbp
  400946:	48 2d 60 0e 60 00    	sub    $0x600e60,%rax
  40094c:	48 83 f8 0e          	cmp    $0xe,%rax
  400950:	48 89 e5             	mov    %rsp,%rbp
  400953:	77 02                	ja     400957 <deregister_tm_clones+0x17>
  400955:	5d                   	pop    %rbp
  400956:	c3                   	retq   
  400957:	b8 00 00 00 00       	mov    $0x0,%eax
  40095c:	48 85 c0             	test   %rax,%rax
  40095f:	74 f4                	je     400955 <deregister_tm_clones+0x15>
  400961:	5d                   	pop    %rbp
  400962:	bf 60 0e 60 00       	mov    $0x600e60,%edi
  400967:	ff e0                	jmpq   *%rax
  400969:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400970 <register_tm_clones>:
  400970:	b8 60 0e 60 00       	mov    $0x600e60,%eax
  400975:	55                   	push   %rbp
  400976:	48 2d 60 0e 60 00    	sub    $0x600e60,%rax
  40097c:	48 c1 f8 03          	sar    $0x3,%rax
  400980:	48 89 e5             	mov    %rsp,%rbp
  400983:	48 89 c2             	mov    %rax,%rdx
  400986:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40098a:	48 01 d0             	add    %rdx,%rax
  40098d:	48 89 c6             	mov    %rax,%rsi
  400990:	48 d1 fe             	sar    %rsi
  400993:	75 02                	jne    400997 <register_tm_clones+0x27>
  400995:	5d                   	pop    %rbp
  400996:	c3                   	retq   
  400997:	ba 00 00 00 00       	mov    $0x0,%edx
  40099c:	48 85 d2             	test   %rdx,%rdx
  40099f:	74 f4                	je     400995 <register_tm_clones+0x25>
  4009a1:	5d                   	pop    %rbp
  4009a2:	bf 60 0e 60 00       	mov    $0x600e60,%edi
  4009a7:	ff e2                	jmpq   *%rdx
  4009a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004009b0 <__do_global_dtors_aux>:
  4009b0:	80 3d a9 04 20 00 00 	cmpb   $0x0,0x2004a9(%rip)        # 600e60 <__bss_start>
  4009b7:	75 11                	jne    4009ca <__do_global_dtors_aux+0x1a>
  4009b9:	55                   	push   %rbp
  4009ba:	48 89 e5             	mov    %rsp,%rbp
  4009bd:	e8 7e ff ff ff       	callq  400940 <deregister_tm_clones>
  4009c2:	5d                   	pop    %rbp
  4009c3:	c6 05 96 04 20 00 01 	movb   $0x1,0x200496(%rip)        # 600e60 <__bss_start>
  4009ca:	f3 c3                	repz retq 
  4009cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004009d0 <frame_dummy>:
  4009d0:	48 83 3d 18 02 20 00 	cmpq   $0x0,0x200218(%rip)        # 600bf0 <__JCR_END__>
  4009d7:	00 
  4009d8:	74 1b                	je     4009f5 <frame_dummy+0x25>
  4009da:	b8 00 00 00 00       	mov    $0x0,%eax
  4009df:	48 85 c0             	test   %rax,%rax
  4009e2:	74 11                	je     4009f5 <frame_dummy+0x25>
  4009e4:	55                   	push   %rbp
  4009e5:	bf f0 0b 60 00       	mov    $0x600bf0,%edi
  4009ea:	48 89 e5             	mov    %rsp,%rbp
  4009ed:	ff d0                	callq  *%rax
  4009ef:	5d                   	pop    %rbp
  4009f0:	e9 7b ff ff ff       	jmpq   400970 <register_tm_clones>
  4009f5:	e9 76 ff ff ff       	jmpq   400970 <register_tm_clones>
  4009fa:	90                   	nop
  4009fb:	90                   	nop
  4009fc:	90                   	nop
  4009fd:	90                   	nop
  4009fe:	90                   	nop
  4009ff:	90                   	nop

0000000000400a00 <__libc_csu_fini>:
  400a00:	f3 c3                	repz retq 
  400a02:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  400a09:	1f 84 00 00 00 00 00 

0000000000400a10 <__libc_csu_init>:
  400a10:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  400a15:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  400a1a:	48 8d 2d c7 01 20 00 	lea    0x2001c7(%rip),%rbp        # 600be8 <__init_array_end>
  400a21:	4c 8d 25 b8 01 20 00 	lea    0x2001b8(%rip),%r12        # 600be0 <__frame_dummy_init_array_entry>
  400a28:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  400a2d:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  400a32:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  400a37:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  400a3c:	48 83 ec 38          	sub    $0x38,%rsp
  400a40:	4c 29 e5             	sub    %r12,%rbp
  400a43:	41 89 fd             	mov    %edi,%r13d
  400a46:	49 89 f6             	mov    %rsi,%r14
  400a49:	48 c1 fd 03          	sar    $0x3,%rbp
  400a4d:	49 89 d7             	mov    %rdx,%r15
  400a50:	e8 a3 fb ff ff       	callq  4005f8 <_init>
  400a55:	48 85 ed             	test   %rbp,%rbp
  400a58:	74 1c                	je     400a76 <__libc_csu_init+0x66>
  400a5a:	31 db                	xor    %ebx,%ebx
  400a5c:	0f 1f 40 00          	nopl   0x0(%rax)
  400a60:	4c 89 fa             	mov    %r15,%rdx
  400a63:	4c 89 f6             	mov    %r14,%rsi
  400a66:	44 89 ef             	mov    %r13d,%edi
  400a69:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  400a6d:	48 83 c3 01          	add    $0x1,%rbx
  400a71:	48 39 eb             	cmp    %rbp,%rbx
  400a74:	72 ea                	jb     400a60 <__libc_csu_init+0x50>
  400a76:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  400a7b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  400a80:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  400a85:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  400a8a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  400a8f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  400a94:	48 83 c4 38          	add    $0x38,%rsp
  400a98:	c3                   	retq   
  400a99:	90                   	nop
  400a9a:	90                   	nop
  400a9b:	90                   	nop

Disassembly of section .fini:

0000000000400a9c <_fini>:
  400a9c:	48 83 ec 08          	sub    $0x8,%rsp
  400aa0:	48 83 c4 08          	add    $0x8,%rsp
  400aa4:	c3                   	retq   
