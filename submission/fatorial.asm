@ /0000
LD N ; ac <= n  000
JZ /0f00 ; termina o programa se n = 0 || 002
SC /0300 ; 004
HM /0a00 ; 006


@ /0300
; JP /004 
MM AUX ; i = ac = 4 || i = AC = 3 || i = ac = 2 
ML RES ; AC = AC*RES = 4 || AC = 3*4 || AC = 4*3*2
MM RES ; RES <= AC || RES = 4 || res = 12 || 24 
LD AUX ; AC = i = 4 || ac = 3 || ac = 2
SB CTE ; AC = AC - 1 = 3 || ac = 2 || ac = 1
JZ /030e
JP /0300
RS /0300 ; 030e

; @ /0400
; RS /0300

@ /0f00 ; f00
HM /0a00

@ /0100
N K /0004
RES K /0001
AUX K /0001
CTE K /0001
