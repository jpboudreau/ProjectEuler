%include "../inc/utilitaire.inc"

section .data
	maxNum:  equ 4000000                ; Le chiffre maximal à ne pas dépassé

section .bss
	total:   resb    255           ; Le total sera gardé ici.
	i:		resb 	255 
	premier:	resb	255
	deuxieme:	resb	255

section .text
	extern printf
	global main

main:
	mov dword [i],0
	mov dword [total], 2 ; le premier 2 est pair
	mov dword [premier], 1
	mov dword [deuxieme], 2

boucle:
	mov eax, [premier]
	add eax, [deuxieme]
	mov [i], eax
	mov ecx, [deuxieme]
	mov [deuxieme], eax
	mov [premier], ecx
	
	; Est-on pair? (multiple de 2)
	xor edx, edx
	mov eax, [i]
	mov ecx, 2
	div ecx
	
	cmp edx, 0
	jne estPasPair

	; On est pair
	; On l'ajoute au total
	mov eax, [total]	; total += i
	add eax, [i]
	mov [total], eax


estPasPair:
	; Est-on rendu en haut de maxNum ?
	cmp dword [i], maxNum
	jle boucle 
	
;avant:
;	inc dword [i]
;	jmp boucle

fin:
	mov esi, [total]
	call afficherEntier
	
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h