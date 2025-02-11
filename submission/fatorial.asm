@ /000
LD N ; ac <= n  000
JZ /006
SC /200 ; 004
HM =0 ; 006

@ /100
N K =4
RES K =1
AUX K =1
CTE K =1

@ /200
JP /000
MM AUX  
ML RES 
MM RES  
LD AUX 
SB CTE 
JZ /400
JP /202


@ /400
RS /200


