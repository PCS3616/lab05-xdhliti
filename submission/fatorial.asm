LD N ; ac = n
JZ ZERO ; termina o programa se n = 0
SC SUBROTINA ;
HM /0101 

ZERO:
  HM /a00

SUBROTINA:
  MM i
  ML RES
  MM RES
  LD i
  SB CTE
  JZ FIM_SB
  JP SUBROTINA
FIM_SB:
  RS SUBROTINA


@ /0100
N K /0005
RES K /0001
CTE K /0001
i K /0001
