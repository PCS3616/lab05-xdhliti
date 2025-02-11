@ /000
SC /200 ; vai pra subrot
HM /004 ; termina o programa



@ /200
JP /000
LD mem
AD two
AD x ; AC = 9<mem> (concateno a mem com a instru equivalente a gaurdar MM mem)
MM /500
LD i ; AC = i 
ML two ; AC = 2*AC
AD one ; AC += 1
AD aux ; AC = AC + aux
MM aux ; aux = AC = 2i + 1
LD i 
AD one ; AC = (AC = 1) + 1
MM i ; i = AC
SB n ; AC = AC - n = AC - 63
JZ /400 ; se i == n = 63
JP /202 ; volta para o inicio do for 

@ /400
RS /200

@ /500
k /0000

@ /100
k /000


@ /300
i k /000
aux k /000
aux2 k /000
mem k /100 ; ponteiro que comeca em 0100
one k =1 ;pra somar 
two k =2 ;pra multiplicar
n k =63
base k /0100
x k /9000



