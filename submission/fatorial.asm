@ /0000
SC /0200 ; 004
LD FAT
MM RES ; res <= fat 006
HM /0a00 ; 006

@ /0100
N K /0004
RES K /0001
AUX K /0001
FAT K /0001
CTE K /0001

@ /0200
LD N ; ac <= n  000
JZ /020e
MM AUX ; i = ac = 4 || i = AC = 3 || i = ac = 2 
ML FAT ; AC = AC*RES = 4 || AC = 3*4 || AC = 4*3*2
MM FAT ; RES <= AC || RES = 4 || res = 12 || 24 
LD AUX ; AC = i = 4 || ac = 3 || ac = 2
SB CTE ; AC = AC - 1 = 3 || ac = 2 || ac = 1
JP /0202
RS /0200 ; 030e

; @ /0400
; RS /0300

@ /0f00 ; f00
HM /0a00


