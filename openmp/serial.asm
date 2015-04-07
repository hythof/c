
a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000400430 <_init>:
  400430:	48 83 ec 08          	sub    $0x8,%rsp
  400434:	e8 83 00 00 00       	callq  4004bc <call_gmon_start>
  400439:	48 83 c4 08          	add    $0x8,%rsp
  40043d:	c3                   	retq   

Disassembly of section .plt:

0000000000400440 <clock@plt-0x10>:
  400440:	ff 35 a2 05 20 00    	pushq  0x2005a2(%rip)        # 6009e8 <_GLOBAL_OFFSET_TABLE_+0x8>
  400446:	ff 25 a4 05 20 00    	jmpq   *0x2005a4(%rip)        # 6009f0 <_GLOBAL_OFFSET_TABLE_+0x10>
  40044c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400450 <clock@plt>:
  400450:	ff 25 a2 05 20 00    	jmpq   *0x2005a2(%rip)        # 6009f8 <_GLOBAL_OFFSET_TABLE_+0x18>
  400456:	68 00 00 00 00       	pushq  $0x0
  40045b:	e9 e0 ff ff ff       	jmpq   400440 <_init+0x10>

0000000000400460 <printf@plt>:
  400460:	ff 25 9a 05 20 00    	jmpq   *0x20059a(%rip)        # 600a00 <_GLOBAL_OFFSET_TABLE_+0x20>
  400466:	68 01 00 00 00       	pushq  $0x1
  40046b:	e9 d0 ff ff ff       	jmpq   400440 <_init+0x10>

0000000000400470 <__libc_start_main@plt>:
  400470:	ff 25 92 05 20 00    	jmpq   *0x200592(%rip)        # 600a08 <_GLOBAL_OFFSET_TABLE_+0x28>
  400476:	68 02 00 00 00       	pushq  $0x2
  40047b:	e9 c0 ff ff ff       	jmpq   400440 <_init+0x10>

0000000000400480 <malloc@plt>:
  400480:	ff 25 8a 05 20 00    	jmpq   *0x20058a(%rip)        # 600a10 <_GLOBAL_OFFSET_TABLE_+0x30>
  400486:	68 03 00 00 00       	pushq  $0x3
  40048b:	e9 b0 ff ff ff       	jmpq   400440 <_init+0x10>

Disassembly of section .text:

0000000000400490 <_start>:
  400490:	31 ed                	xor    %ebp,%ebp
  400492:	49 89 d1             	mov    %rdx,%r9
  400495:	5e                   	pop    %rsi
  400496:	48 89 e2             	mov    %rsp,%rdx
  400499:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40049d:	50                   	push   %rax
  40049e:	54                   	push   %rsp
  40049f:	49 c7 c0 40 06 40 00 	mov    $0x400640,%r8
  4004a6:	48 c7 c1 50 06 40 00 	mov    $0x400650,%rcx
  4004ad:	48 c7 c7 9c 05 40 00 	mov    $0x40059c,%rdi
  4004b4:	e8 b7 ff ff ff       	callq  400470 <__libc_start_main@plt>
  4004b9:	f4                   	hlt    
  4004ba:	90                   	nop
  4004bb:	90                   	nop

00000000004004bc <call_gmon_start>:
  4004bc:	48 83 ec 08          	sub    $0x8,%rsp
  4004c0:	48 8b 05 11 05 20 00 	mov    0x200511(%rip),%rax        # 6009d8 <_DYNAMIC+0x1e0>
  4004c7:	48 85 c0             	test   %rax,%rax
  4004ca:	74 02                	je     4004ce <call_gmon_start+0x12>
  4004cc:	ff d0                	callq  *%rax
  4004ce:	48 83 c4 08          	add    $0x8,%rsp
  4004d2:	c3                   	retq   
  4004d3:	90                   	nop
  4004d4:	90                   	nop
  4004d5:	90                   	nop
  4004d6:	90                   	nop
  4004d7:	90                   	nop
  4004d8:	90                   	nop
  4004d9:	90                   	nop
  4004da:	90                   	nop
  4004db:	90                   	nop
  4004dc:	90                   	nop
  4004dd:	90                   	nop
  4004de:	90                   	nop
  4004df:	90                   	nop

00000000004004e0 <deregister_tm_clones>:
  4004e0:	b8 2f 0a 60 00       	mov    $0x600a2f,%eax
  4004e5:	55                   	push   %rbp
  4004e6:	48 2d 28 0a 60 00    	sub    $0x600a28,%rax
  4004ec:	48 83 f8 0e          	cmp    $0xe,%rax
  4004f0:	48 89 e5             	mov    %rsp,%rbp
  4004f3:	77 02                	ja     4004f7 <deregister_tm_clones+0x17>
  4004f5:	5d                   	pop    %rbp
  4004f6:	c3                   	retq   
  4004f7:	b8 00 00 00 00       	mov    $0x0,%eax
  4004fc:	48 85 c0             	test   %rax,%rax
  4004ff:	74 f4                	je     4004f5 <deregister_tm_clones+0x15>
  400501:	5d                   	pop    %rbp
  400502:	bf 28 0a 60 00       	mov    $0x600a28,%edi
  400507:	ff e0                	jmpq   *%rax
  400509:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400510 <register_tm_clones>:
  400510:	b8 28 0a 60 00       	mov    $0x600a28,%eax
  400515:	55                   	push   %rbp
  400516:	48 2d 28 0a 60 00    	sub    $0x600a28,%rax
  40051c:	48 c1 f8 03          	sar    $0x3,%rax
  400520:	48 89 e5             	mov    %rsp,%rbp
  400523:	48 89 c2             	mov    %rax,%rdx
  400526:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40052a:	48 01 d0             	add    %rdx,%rax
  40052d:	48 89 c6             	mov    %rax,%rsi
  400530:	48 d1 fe             	sar    %rsi
  400533:	75 02                	jne    400537 <register_tm_clones+0x27>
  400535:	5d                   	pop    %rbp
  400536:	c3                   	retq   
  400537:	ba 00 00 00 00       	mov    $0x0,%edx
  40053c:	48 85 d2             	test   %rdx,%rdx
  40053f:	74 f4                	je     400535 <register_tm_clones+0x25>
  400541:	5d                   	pop    %rbp
  400542:	bf 28 0a 60 00       	mov    $0x600a28,%edi
  400547:	ff e2                	jmpq   *%rdx
  400549:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400550 <__do_global_dtors_aux>:
  400550:	80 3d d1 04 20 00 00 	cmpb   $0x0,0x2004d1(%rip)        # 600a28 <__bss_start>
  400557:	75 11                	jne    40056a <__do_global_dtors_aux+0x1a>
  400559:	55                   	push   %rbp
  40055a:	48 89 e5             	mov    %rsp,%rbp
  40055d:	e8 7e ff ff ff       	callq  4004e0 <deregister_tm_clones>
  400562:	5d                   	pop    %rbp
  400563:	c6 05 be 04 20 00 01 	movb   $0x1,0x2004be(%rip)        # 600a28 <__bss_start>
  40056a:	f3 c3                	repz retq 
  40056c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400570 <frame_dummy>:
  400570:	48 83 3d 78 02 20 00 	cmpq   $0x0,0x200278(%rip)        # 6007f0 <__JCR_END__>
  400577:	00 
  400578:	74 1b                	je     400595 <frame_dummy+0x25>
  40057a:	b8 00 00 00 00       	mov    $0x0,%eax
  40057f:	48 85 c0             	test   %rax,%rax
  400582:	74 11                	je     400595 <frame_dummy+0x25>
  400584:	55                   	push   %rbp
  400585:	bf f0 07 60 00       	mov    $0x6007f0,%edi
  40058a:	48 89 e5             	mov    %rsp,%rbp
  40058d:	ff d0                	callq  *%rax
  40058f:	5d                   	pop    %rbp
  400590:	e9 7b ff ff ff       	jmpq   400510 <register_tm_clones>
  400595:	e9 76 ff ff ff       	jmpq   400510 <register_tm_clones>
  40059a:	90                   	nop
  40059b:	90                   	nop

000000000040059c <main>:
#include <stdlib.h>
#include <time.h>

#define COUNT 100 * 1024 * 1024

int main(int argc, char *argv[]) {
  40059c:	55                   	push   %rbp
  40059d:	48 89 e5             	mov    %rsp,%rbp
  4005a0:	48 83 ec 40          	sub    $0x40,%rsp
  4005a4:	89 7d cc             	mov    %edi,-0x34(%rbp)
  4005a7:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    unsigned long long sum = 0;
  4005ab:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  4005b2:	00 
    int *xs = (int *)malloc(sizeof(int) * COUNT);
  4005b3:	bf 00 00 00 19       	mov    $0x19000000,%edi
  4005b8:	e8 c3 fe ff ff       	callq  400480 <malloc@plt>
  4005bd:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    int i;
    clock_t start;

    start = clock();
  4005c1:	e8 8a fe ff ff       	callq  400450 <clock@plt>
  4005c6:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
#if OPENMP
#pragma omp parallel for reduction(+:sum)
#endif
    for(i=0; i<COUNT; ++i) {
  4005ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
  4005d1:	eb 26                	jmp    4005f9 <main+0x5d>
        xs[i] = i;
  4005d3:	8b 45 f4             	mov    -0xc(%rbp),%eax
  4005d6:	48 98                	cltq   
  4005d8:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
  4005df:	00 
  4005e0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  4005e4:	48 01 c2             	add    %rax,%rdx
  4005e7:	8b 45 f4             	mov    -0xc(%rbp),%eax
  4005ea:	89 02                	mov    %eax,(%rdx)
        sum += i;
  4005ec:	8b 45 f4             	mov    -0xc(%rbp),%eax
  4005ef:	48 98                	cltq   
  4005f1:	48 01 45 f8          	add    %rax,-0x8(%rbp)

    start = clock();
#if OPENMP
#pragma omp parallel for reduction(+:sum)
#endif
    for(i=0; i<COUNT; ++i) {
  4005f5:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
  4005f9:	81 7d f4 ff ff 3f 06 	cmpl   $0x63fffff,-0xc(%rbp)
  400600:	7e d1                	jle    4005d3 <main+0x37>
        xs[i] = i;
        sum += i;
    }

    int msec = clock() - start;
  400602:	e8 49 fe ff ff       	callq  400450 <clock@plt>
  400607:	89 c2                	mov    %eax,%edx
  400609:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  40060d:	89 d1                	mov    %edx,%ecx
  40060f:	29 c1                	sub    %eax,%ecx
  400611:	89 c8                	mov    %ecx,%eax
  400613:	89 45 dc             	mov    %eax,-0x24(%rbp)
#if OPENMP
    printf("parallel sum = %ld : msec %d\n", sum, msec);
#else
    printf("  serial sum = %ld : msec %d\n", sum, msec);
  400616:	8b 55 dc             	mov    -0x24(%rbp),%edx
  400619:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40061d:	48 89 c6             	mov    %rax,%rsi
  400620:	bf ec 06 40 00       	mov    $0x4006ec,%edi
  400625:	b8 00 00 00 00       	mov    $0x0,%eax
  40062a:	e8 31 fe ff ff       	callq  400460 <printf@plt>
#endif
    return 0;
  40062f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  400634:	c9                   	leaveq 
  400635:	c3                   	retq   
  400636:	90                   	nop
  400637:	90                   	nop
  400638:	90                   	nop
  400639:	90                   	nop
  40063a:	90                   	nop
  40063b:	90                   	nop
  40063c:	90                   	nop
  40063d:	90                   	nop
  40063e:	90                   	nop
  40063f:	90                   	nop

0000000000400640 <__libc_csu_fini>:
  400640:	f3 c3                	repz retq 
  400642:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  400649:	1f 84 00 00 00 00 00 

0000000000400650 <__libc_csu_init>:
  400650:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  400655:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  40065a:	48 8d 2d 87 01 20 00 	lea    0x200187(%rip),%rbp        # 6007e8 <__init_array_end>
  400661:	4c 8d 25 78 01 20 00 	lea    0x200178(%rip),%r12        # 6007e0 <__frame_dummy_init_array_entry>
  400668:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  40066d:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  400672:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  400677:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  40067c:	48 83 ec 38          	sub    $0x38,%rsp
  400680:	4c 29 e5             	sub    %r12,%rbp
  400683:	41 89 fd             	mov    %edi,%r13d
  400686:	49 89 f6             	mov    %rsi,%r14
  400689:	48 c1 fd 03          	sar    $0x3,%rbp
  40068d:	49 89 d7             	mov    %rdx,%r15
  400690:	e8 9b fd ff ff       	callq  400430 <_init>
  400695:	48 85 ed             	test   %rbp,%rbp
  400698:	74 1c                	je     4006b6 <__libc_csu_init+0x66>
  40069a:	31 db                	xor    %ebx,%ebx
  40069c:	0f 1f 40 00          	nopl   0x0(%rax)
  4006a0:	4c 89 fa             	mov    %r15,%rdx
  4006a3:	4c 89 f6             	mov    %r14,%rsi
  4006a6:	44 89 ef             	mov    %r13d,%edi
  4006a9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4006ad:	48 83 c3 01          	add    $0x1,%rbx
  4006b1:	48 39 eb             	cmp    %rbp,%rbx
  4006b4:	72 ea                	jb     4006a0 <__libc_csu_init+0x50>
  4006b6:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  4006bb:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  4006c0:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  4006c5:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  4006ca:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  4006cf:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  4006d4:	48 83 c4 38          	add    $0x38,%rsp
  4006d8:	c3                   	retq   
  4006d9:	90                   	nop
  4006da:	90                   	nop
  4006db:	90                   	nop

Disassembly of section .fini:

00000000004006dc <_fini>:
  4006dc:	48 83 ec 08          	sub    $0x8,%rsp
  4006e0:	48 83 c4 08          	add    $0x8,%rsp
  4006e4:	c3                   	retq   
