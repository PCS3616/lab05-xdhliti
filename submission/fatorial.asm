SC /200 ; 004
HM =0 ; 006

@ /100
N K =4
RES K =1
AUX K =1
FAT K =1
CTE K =1

@ /200
LD N ; ac <= n  000
JZ /210
MM AUX ; i = ac = 4 || i = AC = 3 || i = ac = 2 
ML FAT ; AC = AC*RES = 4 || AC = 3*4 || AC = 4*3*2
MM FAT ; RES <= AC || RES = 4 || res = 12 || 24 
LD AUX ; AC = i = 4 || ac = 3 || ac = 2
SB CTE ; AC = AC - 1 = 3 || ac = 2 || ac = 1
JP /202
LD FAT
MM RES ; res <= fat 006
RS /200 


