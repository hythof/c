
a.out:     file format elf64-x86-64


Disassembly of section .init:

0000000000400650 <_init>:
  400650:	48 83 ec 08          	sub    $0x8,%rsp
  400654:	e8 c3 00 00 00       	callq  40071c <call_gmon_start>
  400659:	48 83 c4 08          	add    $0x8,%rsp
  40065d:	c3                   	retq   

Disassembly of section .plt:

0000000000400660 <GOMP_parallel_start@plt-0x10>:
  400660:	ff 35 e2 06 20 00    	pushq  0x2006e2(%rip)        # 600d48 <_GLOBAL_OFFSET_TABLE_+0x8>
  400666:	ff 25 e4 06 20 00    	jmpq   *0x2006e4(%rip)        # 600d50 <_GLOBAL_OFFSET_TABLE_+0x10>
  40066c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400670 <GOMP_parallel_start@plt>:
  400670:	ff 25 e2 06 20 00    	jmpq   *0x2006e2(%rip)        # 600d58 <_GLOBAL_OFFSET_TABLE_+0x18>
  400676:	68 00 00 00 00       	pushq  $0x0
  40067b:	e9 e0 ff ff ff       	jmpq   400660 <_init+0x10>

0000000000400680 <clock@plt>:
  400680:	ff 25 da 06 20 00    	jmpq   *0x2006da(%rip)        # 600d60 <_GLOBAL_OFFSET_TABLE_+0x20>
  400686:	68 01 00 00 00       	pushq  $0x1
  40068b:	e9 d0 ff ff ff       	jmpq   400660 <_init+0x10>

0000000000400690 <GOMP_parallel_end@plt>:
  400690:	ff 25 d2 06 20 00    	jmpq   *0x2006d2(%rip)        # 600d68 <_GLOBAL_OFFSET_TABLE_+0x28>
  400696:	68 02 00 00 00       	pushq  $0x2
  40069b:	e9 c0 ff ff ff       	jmpq   400660 <_init+0x10>

00000000004006a0 <omp_get_thread_num@plt>:
  4006a0:	ff 25 ca 06 20 00    	jmpq   *0x2006ca(%rip)        # 600d70 <_GLOBAL_OFFSET_TABLE_+0x30>
  4006a6:	68 03 00 00 00       	pushq  $0x3
  4006ab:	e9 b0 ff ff ff       	jmpq   400660 <_init+0x10>

00000000004006b0 <printf@plt>:
  4006b0:	ff 25 c2 06 20 00    	jmpq   *0x2006c2(%rip)        # 600d78 <_GLOBAL_OFFSET_TABLE_+0x38>
  4006b6:	68 04 00 00 00       	pushq  $0x4
  4006bb:	e9 a0 ff ff ff       	jmpq   400660 <_init+0x10>

00000000004006c0 <__libc_start_main@plt>:
  4006c0:	ff 25 ba 06 20 00    	jmpq   *0x2006ba(%rip)        # 600d80 <_GLOBAL_OFFSET_TABLE_+0x40>
  4006c6:	68 05 00 00 00       	pushq  $0x5
  4006cb:	e9 90 ff ff ff       	jmpq   400660 <_init+0x10>

00000000004006d0 <omp_get_num_threads@plt>:
  4006d0:	ff 25 b2 06 20 00    	jmpq   *0x2006b2(%rip)        # 600d88 <_GLOBAL_OFFSET_TABLE_+0x48>
  4006d6:	68 06 00 00 00       	pushq  $0x6
  4006db:	e9 80 ff ff ff       	jmpq   400660 <_init+0x10>

00000000004006e0 <malloc@plt>:
  4006e0:	ff 25 aa 06 20 00    	jmpq   *0x2006aa(%rip)        # 600d90 <_GLOBAL_OFFSET_TABLE_+0x50>
  4006e6:	68 07 00 00 00       	pushq  $0x7
  4006eb:	e9 70 ff ff ff       	jmpq   400660 <_init+0x10>

Disassembly of section .text:

00000000004006f0 <_start>:
  4006f0:	31 ed                	xor    %ebp,%ebp
  4006f2:	49 89 d1             	mov    %rdx,%r9
  4006f5:	5e                   	pop    %rsi
  4006f6:	48 89 e2             	mov    %rsp,%rdx
  4006f9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  4006fd:	50                   	push   %rax
  4006fe:	54                   	push   %rsp
  4006ff:	49 c7 c0 50 09 40 00 	mov    $0x400950,%r8
  400706:	48 c7 c1 60 09 40 00 	mov    $0x400960,%rcx
  40070d:	48 c7 c7 fc 07 40 00 	mov    $0x4007fc,%rdi
  400714:	e8 a7 ff ff ff       	callq  4006c0 <__libc_start_main@plt>
  400719:	f4                   	hlt    
  40071a:	90                   	nop
  40071b:	90                   	nop

000000000040071c <call_gmon_start>:
  40071c:	48 83 ec 08          	sub    $0x8,%rsp
  400720:	48 8b 05 11 06 20 00 	mov    0x200611(%rip),%rax        # 600d38 <_DYNAMIC+0x200>
  400727:	48 85 c0             	test   %rax,%rax
  40072a:	74 02                	je     40072e <call_gmon_start+0x12>
  40072c:	ff d0                	callq  *%rax
  40072e:	48 83 c4 08          	add    $0x8,%rsp
  400732:	c3                   	retq   
  400733:	90                   	nop
  400734:	90                   	nop
  400735:	90                   	nop
  400736:	90                   	nop
  400737:	90                   	nop
  400738:	90                   	nop
  400739:	90                   	nop
  40073a:	90                   	nop
  40073b:	90                   	nop
  40073c:	90                   	nop
  40073d:	90                   	nop
  40073e:	90                   	nop
  40073f:	90                   	nop

0000000000400740 <deregister_tm_clones>:
  400740:	b8 af 0d 60 00       	mov    $0x600daf,%eax
  400745:	55                   	push   %rbp
  400746:	48 2d a8 0d 60 00    	sub    $0x600da8,%rax
  40074c:	48 83 f8 0e          	cmp    $0xe,%rax
  400750:	48 89 e5             	mov    %rsp,%rbp
  400753:	77 02                	ja     400757 <deregister_tm_clones+0x17>
  400755:	5d                   	pop    %rbp
  400756:	c3                   	retq   
  400757:	b8 00 00 00 00       	mov    $0x0,%eax
  40075c:	48 85 c0             	test   %rax,%rax
  40075f:	74 f4                	je     400755 <deregister_tm_clones+0x15>
  400761:	5d                   	pop    %rbp
  400762:	bf a8 0d 60 00       	mov    $0x600da8,%edi
  400767:	ff e0                	jmpq   *%rax
  400769:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000400770 <register_tm_clones>:
  400770:	b8 a8 0d 60 00       	mov    $0x600da8,%eax
  400775:	55                   	push   %rbp
  400776:	48 2d a8 0d 60 00    	sub    $0x600da8,%rax
  40077c:	48 c1 f8 03          	sar    $0x3,%rax
  400780:	48 89 e5             	mov    %rsp,%rbp
  400783:	48 89 c2             	mov    %rax,%rdx
  400786:	48 c1 ea 3f          	shr    $0x3f,%rdx
  40078a:	48 01 d0             	add    %rdx,%rax
  40078d:	48 89 c6             	mov    %rax,%rsi
  400790:	48 d1 fe             	sar    %rsi
  400793:	75 02                	jne    400797 <register_tm_clones+0x27>
  400795:	5d                   	pop    %rbp
  400796:	c3                   	retq   
  400797:	ba 00 00 00 00       	mov    $0x0,%edx
  40079c:	48 85 d2             	test   %rdx,%rdx
  40079f:	74 f4                	je     400795 <register_tm_clones+0x25>
  4007a1:	5d                   	pop    %rbp
  4007a2:	bf a8 0d 60 00       	mov    $0x600da8,%edi
  4007a7:	ff e2                	jmpq   *%rdx
  4007a9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004007b0 <__do_global_dtors_aux>:
  4007b0:	80 3d f1 05 20 00 00 	cmpb   $0x0,0x2005f1(%rip)        # 600da8 <__bss_start>
  4007b7:	75 11                	jne    4007ca <__do_global_dtors_aux+0x1a>
  4007b9:	55                   	push   %rbp
  4007ba:	48 89 e5             	mov    %rsp,%rbp
  4007bd:	e8 7e ff ff ff       	callq  400740 <deregister_tm_clones>
  4007c2:	5d                   	pop    %rbp
  4007c3:	c6 05 de 05 20 00 01 	movb   $0x1,0x2005de(%rip)        # 600da8 <__bss_start>
  4007ca:	f3 c3                	repz retq 
  4007cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004007d0 <frame_dummy>:
  4007d0:	48 83 3d 58 03 20 00 	cmpq   $0x0,0x200358(%rip)        # 600b30 <__JCR_END__>
  4007d7:	00 
  4007d8:	74 1b                	je     4007f5 <frame_dummy+0x25>
  4007da:	b8 00 00 00 00       	mov    $0x0,%eax
  4007df:	48 85 c0             	test   %rax,%rax
  4007e2:	74 11                	je     4007f5 <frame_dummy+0x25>
  4007e4:	55                   	push   %rbp
  4007e5:	bf 30 0b 60 00       	mov    $0x600b30,%edi
  4007ea:	48 89 e5             	mov    %rsp,%rbp
  4007ed:	ff d0                	callq  *%rax
  4007ef:	5d                   	pop    %rbp
  4007f0:	e9 7b ff ff ff       	jmpq   400770 <register_tm_clones>
  4007f5:	e9 76 ff ff ff       	jmpq   400770 <register_tm_clones>
  4007fa:	90                   	nop
  4007fb:	90                   	nop

00000000004007fc <main>:
#include <stdlib.h>
#include <time.h>

#define COUNT 100 * 1024 * 1024

int main(int argc, char *argv[]) {
  4007fc:	55                   	push   %rbp
  4007fd:	48 89 e5             	mov    %rsp,%rbp
  400800:	48 83 ec 40          	sub    $0x40,%rsp
  400804:	89 7d cc             	mov    %edi,-0x34(%rbp)
  400807:	48 89 75 c0          	mov    %rsi,-0x40(%rbp)
    unsigned long long sum = 0;
  40080b:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
  400812:	00 
    int *xs = (int *)malloc(sizeof(int) * COUNT);
  400813:	bf 00 00 00 19       	mov    $0x19000000,%edi
  400818:	e8 c3 fe ff ff       	callq  4006e0 <malloc@plt>
  40081d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    int i;
    clock_t start;

    start = clock();
  400821:	e8 5a fe ff ff       	callq  400680 <clock@plt>
  400826:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
#if OPENMP
#pragma omp parallel for reduction(+:sum)
  40082a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40082e:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
  400832:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
  400836:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  40083a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  40083e:	ba 00 00 00 00       	mov    $0x0,%edx
  400843:	48 89 c6             	mov    %rax,%rsi
  400846:	bf a5 08 40 00       	mov    $0x4008a5,%edi
  40084b:	e8 20 fe ff ff       	callq  400670 <GOMP_parallel_start@plt>
  400850:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  400854:	48 89 c7             	mov    %rax,%rdi
  400857:	e8 49 00 00 00       	callq  4008a5 <main._omp_fn.0>
  40085c:	e8 2f fe ff ff       	callq  400690 <GOMP_parallel_end@plt>
  400861:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  400865:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  400869:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  40086d:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
    for(i=0; i<COUNT; ++i) {
        xs[i] = i;
        sum += i;
    }

    int msec = clock() - start;
  400871:	e8 0a fe ff ff       	callq  400680 <clock@plt>
  400876:	89 c2                	mov    %eax,%edx
  400878:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  40087c:	89 d1                	mov    %edx,%ecx
  40087e:	29 c1                	sub    %eax,%ecx
  400880:	89 c8                	mov    %ecx,%eax
  400882:	89 45 e4             	mov    %eax,-0x1c(%rbp)
#if OPENMP
    printf("parallel sum = %ld : msec %d\n", sum, msec);
  400885:	8b 55 e4             	mov    -0x1c(%rbp),%edx
  400888:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  40088c:	48 89 c6             	mov    %rax,%rsi
  40088f:	bf fc 09 40 00       	mov    $0x4009fc,%edi
  400894:	b8 00 00 00 00       	mov    $0x0,%eax
  400899:	e8 12 fe ff ff       	callq  4006b0 <printf@plt>
#else
    printf("  serial sum = %ld : msec %d\n", sum, msec);
#endif
    return 0;
  40089e:	b8 00 00 00 00       	mov    $0x0,%eax
}
  4008a3:	c9                   	leaveq 
  4008a4:	c3                   	retq   

00000000004008a5 <main._omp_fn.0>:
    int i;
    clock_t start;

    start = clock();
#if OPENMP
#pragma omp parallel for reduction(+:sum)
  4008a5:	55                   	push   %rbp
  4008a6:	48 89 e5             	mov    %rsp,%rbp
  4008a9:	53                   	push   %rbx
  4008aa:	48 83 ec 28          	sub    $0x28,%rsp
  4008ae:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  4008b2:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  4008b9:	00 
  4008ba:	e8 11 fe ff ff       	callq  4006d0 <omp_get_num_threads@plt>
  4008bf:	89 c3                	mov    %eax,%ebx
  4008c1:	e8 da fd ff ff       	callq  4006a0 <omp_get_thread_num@plt>
  4008c6:	89 c6                	mov    %eax,%esi
  4008c8:	b8 00 00 40 06       	mov    $0x6400000,%eax
  4008cd:	89 c2                	mov    %eax,%edx
  4008cf:	c1 fa 1f             	sar    $0x1f,%edx
  4008d2:	f7 fb                	idiv   %ebx
  4008d4:	89 c1                	mov    %eax,%ecx
  4008d6:	b8 00 00 40 06       	mov    $0x6400000,%eax
  4008db:	89 c2                	mov    %eax,%edx
  4008dd:	c1 fa 1f             	sar    $0x1f,%edx
  4008e0:	f7 fb                	idiv   %ebx
  4008e2:	89 d0                	mov    %edx,%eax
  4008e4:	39 c6                	cmp    %eax,%esi
  4008e6:	7c 51                	jl     400939 <main._omp_fn.0+0x94>
  4008e8:	89 ca                	mov    %ecx,%edx
  4008ea:	0f af d6             	imul   %esi,%edx
  4008ed:	01 d0                	add    %edx,%eax
  4008ef:	8d 14 08             	lea    (%rax,%rcx,1),%edx
  4008f2:	39 d0                	cmp    %edx,%eax
  4008f4:	7d 31                	jge    400927 <main._omp_fn.0+0x82>
  4008f6:	89 45 e4             	mov    %eax,-0x1c(%rbp)
#endif
    for(i=0; i<COUNT; ++i) {
        xs[i] = i;
  4008f9:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  4008fc:	48 98                	cltq   
  4008fe:	48 8d 0c 85 00 00 00 	lea    0x0(,%rax,4),%rcx
  400905:	00 
  400906:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40090a:	48 8b 00             	mov    (%rax),%rax
  40090d:	48 01 c1             	add    %rax,%rcx
  400910:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  400913:	89 01                	mov    %eax,(%rcx)
        sum += i;
  400915:	8b 45 e4             	mov    -0x1c(%rbp),%eax
  400918:	48 98                	cltq   
  40091a:	48 01 45 e8          	add    %rax,-0x18(%rbp)
  40091e:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
  400922:	39 55 e4             	cmp    %edx,-0x1c(%rbp)
  400925:	7c d2                	jl     4008f9 <main._omp_fn.0+0x54>
    int i;
    clock_t start;

    start = clock();
#if OPENMP
#pragma omp parallel for reduction(+:sum)
  400927:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  40092b:	48 8d 50 08          	lea    0x8(%rax),%rdx
  40092f:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  400933:	f0 48 01 02          	lock add %rax,(%rdx)
  400937:	eb 0a                	jmp    400943 <main._omp_fn.0+0x9e>
  400939:	b8 00 00 00 00       	mov    $0x0,%eax
  40093e:	83 c1 01             	add    $0x1,%ecx
  400941:	eb a5                	jmp    4008e8 <main._omp_fn.0+0x43>
  400943:	48 83 c4 28          	add    $0x28,%rsp
  400947:	5b                   	pop    %rbx
  400948:	5d                   	pop    %rbp
  400949:	c3                   	retq   
  40094a:	90                   	nop
  40094b:	90                   	nop
  40094c:	90                   	nop
  40094d:	90                   	nop
  40094e:	90                   	nop
  40094f:	90                   	nop

0000000000400950 <__libc_csu_fini>:
  400950:	f3 c3                	repz retq 
  400952:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  400959:	1f 84 00 00 00 00 00 

0000000000400960 <__libc_csu_init>:
  400960:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  400965:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  40096a:	48 8d 2d b7 01 20 00 	lea    0x2001b7(%rip),%rbp        # 600b28 <__init_array_end>
  400971:	4c 8d 25 a8 01 20 00 	lea    0x2001a8(%rip),%r12        # 600b20 <__frame_dummy_init_array_entry>
  400978:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  40097d:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  400982:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  400987:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  40098c:	48 83 ec 38          	sub    $0x38,%rsp
  400990:	4c 29 e5             	sub    %r12,%rbp
  400993:	41 89 fd             	mov    %edi,%r13d
  400996:	49 89 f6             	mov    %rsi,%r14
  400999:	48 c1 fd 03          	sar    $0x3,%rbp
  40099d:	49 89 d7             	mov    %rdx,%r15
  4009a0:	e8 ab fc ff ff       	callq  400650 <_init>
  4009a5:	48 85 ed             	test   %rbp,%rbp
  4009a8:	74 1c                	je     4009c6 <__libc_csu_init+0x66>
  4009aa:	31 db                	xor    %ebx,%ebx
  4009ac:	0f 1f 40 00          	nopl   0x0(%rax)
  4009b0:	4c 89 fa             	mov    %r15,%rdx
  4009b3:	4c 89 f6             	mov    %r14,%rsi
  4009b6:	44 89 ef             	mov    %r13d,%edi
  4009b9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  4009bd:	48 83 c3 01          	add    $0x1,%rbx
  4009c1:	48 39 eb             	cmp    %rbp,%rbx
  4009c4:	72 ea                	jb     4009b0 <__libc_csu_init+0x50>
  4009c6:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  4009cb:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  4009d0:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  4009d5:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  4009da:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  4009df:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  4009e4:	48 83 c4 38          	add    $0x38,%rsp
  4009e8:	c3                   	retq   
  4009e9:	90                   	nop
  4009ea:	90                   	nop
  4009eb:	90                   	nop

Disassembly of section .fini:

00000000004009ec <_fini>:
  4009ec:	48 83 ec 08          	sub    $0x8,%rsp
  4009f0:	48 83 c4 08          	add    $0x8,%rsp
  4009f4:	c3                   	retq   
