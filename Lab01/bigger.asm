;name = QIUYUAN YIN
;email = z5003845@unsw.edu.au
;date = 06/08/2014
;version number =1.0
;calculating the greatest common divisor of two numbers
; a>b?a-b:b-a
.include "m64def.inc"
.def a = r16
.def b = r17

LOOP:
    cp a,b                      ;compare a and b
	breq LOOP					;if(a=b) then compare again
	brlo less					;if(a<b) then go to  less label
	brge greater				;if a>b ,then go to greater label
greater:	
	sub  a,b 					; a=a-b
	mov  b,a 					; copy a to b
	rjmp END 					; jump to END label
less: 		
	sub b,a 					; b=b-a
	mov a,b 					; copy b to a
	rjmp END 					; jump to END label
END: 
	rjmp END 