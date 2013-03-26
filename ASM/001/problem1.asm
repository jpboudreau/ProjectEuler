%include "../inc/utilitaire.inc"

section .data
	maxNum:  equ 1000                ; Le chiffre maximal à ne pas dépassé
	pourcentS: db '%d', 10, 0

section .bss
	total:   resb    255           ; Le total sera gardé ici.
	i:		resb 	255 

section .text
	extern printf
	global main

main:
	mov dword [i],0
	mov dword [total], 0

boucle:
	cmp dword [i], maxNum
	jge fin 
	
	xor edx, edx
	mov eax, [i]
	mov ecx, 3
	div ecx
	
	cmp edx, 0
	je ajouter

	xor edx, edx
	mov eax, [i]
	mov ecx, 5
	div ecx
	
	cmp edx,0
	jne avant
	
ajouter:

	mov eax, [total]	; total += i
	add eax, [i]
	mov [total], eax
	
avant:
	inc dword [i]
	jmp boucle

fin:
	mov esi, [total]
	call afficherEntier
	;mov edi, pourcentS
	;mov eax, 0
	;call printf
	
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h