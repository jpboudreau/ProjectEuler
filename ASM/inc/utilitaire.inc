%ifndef UTILITAIRE_INC_INCLUS
	%define UTILITAIRE_INC_INCLUS
	; Fichier qui contient les utilitaires
	; Suit les call convention
	section .data
		pourcentD: db '%d', 10, 0

	; Affiche un simple entier passé dans esi
	AfficherEntier:
	push rbp 
	mov rbp, rsp 

	mov edi, pourcentD
	mov eax, 0
	call printf

	mov rsp, rbp 
	pop rbp 
	ret 0

%endif