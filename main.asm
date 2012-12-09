;; donnees initialisees
segment	.data
	msg0	db	"Lancement du programme", 10, 0
	msg1	db	"Fin du programme", 10, 0
	msg2	db	"POW(2,2)=%f",10,0
	msg_ret	db	"RET=%d",10,0
	msg_err	db	"Library Call - ERROR",10,0
	title	db	"SDL_GL_Window - Assembly Language Project",0

;; donnees non-initialisees
segment .bss
	screen	resq	1
	
;; section de code
segment .text
	extern	sleep
	extern	SDL_Init, SDL_SetVideoMode, SDL_Quit, SDL_GL_SwapBuffers, SDL_WM_SetCaption
	extern	glClear, glBegin, glEnd, glVertex3d, glColor3d, glFlush
	
	global	_start

;; fonction principale
_start:
	;; message debut
	mov	rdi, 1d
	mov	rsi, msg0
	mov	rdx, 23d
	mov	rax, 1d
	syscall
	
init:	
	;; init fenetre
	mov	rdi, 0x00000020
	call	SDL_Init

	;; ouverture
	mov	rdi, 800d
	mov	rsi, 600d
	mov	rdx, 32d
	mov	rcx, 0x40000002
	call	SDL_SetVideoMode
	mov	[screen], rax

	cmp	rax, 0d
	jnz	config

	;; ERROR
	mov	rdi, 1d
	mov	rsi, msg_err
	mov	rdx, 21d
	mov	rax, 1d
	syscall
	jmp	exit

config:
	;; configuration	
	mov	rdi, title
	mov	rsi, 0d
	call	SDL_WM_SetCaption

	mov	rdi, 0x00004000
	call	glClear

	;; dessin
	mov	rdi, 255d
	mov	rsi, 0d
	mov	rdx, 0d
	call	glColor3d
	
	mov	rdi, 0x0001
	call	glBegin

	mov	rdi, 0d
	mov	rsi, 0d
	mov	rdx, 0d
	call	glVertex3d

	mov	rdi, 0d
	mov	rsi, 10d
	mov	rdx, 0d
	call	glVertex3d
	
	call	glEnd

	;; rafraichissement
	call	glFlush
	call	SDL_GL_SwapBuffers

	;; attente
	mov	rdi, 5d
	call	sleep

	;; fermeture
	call	SDL_Quit

	;; message fin
	mov	rdi, 1
	mov	rsi, msg1
	mov	rdx, 17
	mov	rax, 1
	syscall

exit:	
	;; fin programme
	xor	rdi, rdi
	mov	rax, 60
	syscall