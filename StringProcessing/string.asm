.386
.MODEL FLAT
.DATA
	RESSTR DB ?

.CODE
	_DELDOTS PROC		
		PUSH EBP
		MOV EBP, ESP 
		SUB ESP, 4
		MOV [EBP - 4], OFFSET RESSTR

		MOV EDI, [EBP - 4]
		MOV EAX, [EBP - 4]
		MOV ESI, [EBP + 8]

L:		MOV BL, [ESI]
		CMP BL, '.'
		JE FALSE
		MOV [EDI], BL
		INC EDI
FALSE:	INC ESI
		CMP BL, 0
		JNE L

		MOV ESP, EBP
		POP EBP
		RET
	_DELDOTS ENDP
END


