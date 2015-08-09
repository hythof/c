.global add
add:
push   %rbp
mov    %rsp,%rbp
mov    %edi,-0x4(%rbp)
mov    %esi,-0x8(%rbp)
mov    -0x8(%rbp),%eax
mov    -0x4(%rbp),%edx
add    %edx,%eax
pop    %rbp
retq   
