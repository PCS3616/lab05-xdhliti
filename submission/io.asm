@ /000
GD /000 ; pega o valor do input do teclado
SB ascii ; subtrai 3030
MM x ; salva em x o valor
GD /000 ; espaco
GD /000 ; pega o valor do input do outro digito
SB ascii ; subtrai 3030
MM y ; salva em y
AD x ; x + y
MM res ; guarda x + y em res 
; ex: 0x2AB vezes 0x010 = shfit de quatro bits = 0xAB0 
; entao é preciso shiftar 8 bits pra isolar o menos significativo 
ML shiftL8b ; shifta pra esq
SB sub ; subtrai a00
JN monitor ; se AC - a00 < 0 entao o dig menos significativo é menor que a e ele vai pro fim
LD res ; AC = res = x + y
SB subA  ; AC = AC - 00a
AD shiftL8b ; AC = AC + 100
MM res ; salva res
monitor LD res ; da load no res
AD ascii ; somam 3030
PD /100 ; mostra no monitor 
HM /c00 ; termina o programa 



@ /500
x k /0000
y k /0000
res k /0000
ascii k /3030
sub k /a00
subA k /00a
shiftL8b k /100



