;******************************************************************;
; Program Name: Sum Array										   ;
; Program Description: Sum each array element within a given range ;
; Program Author: Parke											   ;
; Creation Date: 04/11/2024										   ;
; Revisions: N/A												   ;
; Date Last Modified: 04/11/2024								   ;
;******************************************************************;

;*********************************************;
; 8386, flat memory model, stack size and	  ;
; ExitProcess prototype initalizations as	  ;
; well as Irvine32 library INCLUDE statements ;
;*********************************************;
.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDELIB C:\masm32\lib\Irvine32.lib
INCLUDE C:\masm32\include\Irvine32.inc

; Declared and initialized (or un-initialized) variables
.data
	j SDWORD 4				; Change these 2 vals if you want different range to add numbers in
	k SDWORD 20

.code
main PROC

	MOV ECX, k				; Loop counter
	MOV EAX, 0				; use EAX as 'sum' register
	CALL SumArray			; Call primary proc
	CALL WriteInt			; Write output to console
	CALL Crlf
	INVOKE ExitProcess, 0   ; Return 0, exit success

main ENDP					; Program exit

;********************************************************************************************************;
; Function: Sums Array elements within 'j' and 'k', including 'j' and 'k'								 ;
; Return: Sum in EAX register																			 ;
; Procedure: Ensure 'j' is not greater than 'k', add current 'j' value to EAX register and increment 'j' ;
;			 Exit PROC if j > k																			 ;
;********************************************************************************************************;
SumArray PROC

L1:
	MOV EBX, j
	CMP EBX, k
	JA L2
	ADD EAX, j
	INC j
	LOOP L1
	RET

L2:
	RET

SumArray ENDP

END main
