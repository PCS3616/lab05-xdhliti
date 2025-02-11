@ /000
LD N ; ac <= n  000
JZ /f00 ; termina o programa se n = 0 002
SC /300 ; 004
HM /a00 ; 006

@ /100
N K /004
RES K /001
CTE K /001
AUX K /001


@ /300
JP /004 
MM AUX ; i = ac = 4 || i = AC = 3 || i = ac = 2 
ML RES ; AC = AC*RES = 4 || AC = 3*4 || AC = 4*3*2
MM RES ; RES <= AC || RES = 4 || res = 12 || 24 
LD AUX ; AC = i = 4 || ac = 3 || ac = 2
SB CTE ; AC = AC - 1 = 3 || ac = 2 || ac = 1
JZ /400 
JP /300

@ /400
RS /300

@ /f00 ; f00
HM /a00
