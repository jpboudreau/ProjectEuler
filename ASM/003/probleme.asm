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

	mov eax, 17
	call EstNombrePremier

	mov esi, eax
	call AfficherEntier
	
	int 80h
	
	mov eax,1
	mov ebx,0
	int 80h


; Si un nombre entier, la valeur sera dans eax
EstNombrePremier:
	push rcx


	;xor edx, edx
	;mov eax, [i]
	;mov ecx, 3
	;div ecx
	
	;cmp edx, 0
	;je ajouter

	mov ecx, 2; i = 0

	boucleNombrePremier:
		cmp ecx, eax
		jge estPremier

		push rax

		; On divise eax par i
		;mov ecx, eax
		xor edx, edx
		div ecx

		pop rax

		cmp edx, 0
		je estPasPremier

		inc ecx
		jmp boucleNombrePremier

	estPremier:
		mov eax, 1
		jmp finBoucleNombrePremier

	estPasPremier:
		mov eax, 0

	finBoucleNombrePremier:

	pop rcx
	ret