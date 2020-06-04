#autor: Aleksa Rajkovic INDEX ra167-2019

.section .text
#unsigned int hash(unsigned int a, unsigned int b, unsigned int code);
.globl hash

hash:
	pushl %ebp
	movl %esp,%ebp
	pushl %edi
	pushl %esi	#cuvanje registra koji moraju biti nepromenjeni
	pushl %ebx
	pushl %ecx
	pushl %edx
	
	subl $4,%esp 
	movl $1,-4(%ebp)
	
	xorl %edx,%edx
	movl 16(%ebp),%eax	#code
	movl $4,%edi #deli kod sa 4 i ostatak upisuje u %edx a zatim uvecava ostatak za 1
	divl %edi
	incl %edx
	
	movl 8(%ebp),%eax 	#a
	movl 12(%ebp),%ebx	#b

while:
	cmpl $0,%edx
	je end
	decl %edx
	xorl %ebx,%eax #radi xorl i cuva u eax
	movl -4(%ebp),%ecx
	roll %cl,%ebx
	
	#movl $0b00000000000000000000000011111111,%ecx #maska za a
	movl %ebx,%ecx #duplira b u ecx
	rorl $8,%ecx
	roll $8,%eax
	andb %ecx,%eax
	rorl $8,%eax
	#andl %ecx,%esi
	#roll $8,%esi
	#roll $8,%ecx
	#roll $8,%eax
	#andl %ecx,%eax
	#addl %esi,%eax
	#rorl $4,%eax
	
	movl %eax,%ecx #duplira a u ecx
	rorl $16,%ecx
	orb %ecx,%ebx
	#movl $0b00000000000011110000000000000000,%ecx #maska za b
	#movl %eax,%esi #duplira a u esi
	#rorl $8,%esi
	#andl %ecx,%esi
	#orl %
	incl -4(%ebp)
	jmp while
	
	
finito:
end:
	popl %edx
	popl %ecx
	popl %ebx
	popl %esi
	popl %edi
	movl %ebp,%esp
	popl %ebp
	ret
