@ /000
LD base
MM ptr
LD square
MM @ptr
SC /200
HM /004

@ /200 
JP /000
LD i 
ML two
AD one
AD square
MM square 
MM @ptr
LD ptr 
AD two
MM ptr
LD i
SB n
JZ /400
LD i 
AD one
MM i
JP /202

@ /400
RS /200


@ /300
n k =64
i k =0
two k =2
one k =1
final k =64
square k =0
base k /0100
ptr k =0