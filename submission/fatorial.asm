@ /0000
LD N ; ac = n
JZ /0200 ; termina o programa se n = 0
SC /0300 ;
HM /0101 

@ /0200
  HM /a00

@ /0300
  MM i
  ML RES
  MM RES
  LD i
  SB CTE
  JZ /0400
  JP /0300
@ /0400
  RS /0300


@ /0100
N K /0005
RES K /0001
CTE K /0001
i K /0001
