;name = QIUYUAN YIN
;email = z5003845@unsw.edu.au
;date = 06/08/2014
;version number =1.0
;populating a table 
.include "m64def.inc"
.def x = r31 
.def y = r30
.def z = r29
.def length = r28
.def area = r27
.def volume =r26
.def c = r25
.def con = r24

.macro getLength 			;caculate the length of  x y z
	add @2,@1
	add @0,@2
	mul con,con
	mul r0,@0
	mov length,r0
.endmacro

.macro getArea
	mul @0,@1
	mov temp,r0
	mul @1,@2
	add temp,r0
	mul @0,@2
	add temp,r0
	mul temp,con
	mov area,r0
.endmacro

.macro getVolume
    mul @0,@1
	mul @2,r0
	mov volume,r0
.endmacro
ldi con,$2              ;initialize con= 2
cpi c,$114				;conpare c with the ascii code of 'L'(114)
breq l 					;if c=l ,then go to label L
cpi c,$101				;conpare c with the ascii code of 'A'(101)
breq a 					;if c=a ,then go to label A
cpi c,$126 				;conpare c with the ascii code of 'V'(126)
breq V 					;if c=v ,then go to label V
brne DEFAULT			;else go to label DEFAULT
L: 						;calculate 4*x+4*y+4*z and store the result in length
	getLength x,y,z 

	;add z,y
	;add x,z
	;mul con,con
	;mul r0,x
	;mov length,r0
	ldi volume,$0
	ldi area,$0
	rjmp END

A: 						;calculate 2*x*y+2*x*z+2*y*z and store the result in area
	;mul x,y
	;mov temp,r0
	;mul y,z
	;add temp,r0
	;mul x,z
	;add temp,r0
	;mul temp,con
	;mov area,r0
	getArea x,y,z
	ldi volume,$0
	ldi length,$0
	rjmp END

V： 						;calculate x*y*z and store the result in volume
	getVolume x,y,z
	;mul x,y
	;mul z,r0
	;mov volume,r0
	ldi	area,$0
	ldi length,$0
	rjmp END
DEFAULT 				;set the value of 3 variables to 0
	ldi length,$0
	ldi volume,$0
	ldi area,$0
END: