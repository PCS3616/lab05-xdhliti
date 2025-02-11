; Programa MVN para calcular os quadrados perfeitos dos 64 primeiros números
; naturais (0 a 63) utilizando a propriedade:
;   n² = (2·0+1) + (2·1+1) + ... + [2·(n-1)+1]
; Cada quadrado é armazenado como inteiro de 2 bytes a partir do endereço 0x100.
;
; Como o montador não oferece endereçamento indireto, usamos auto-modificação
; de código para alterar dinamicamente o endereço de armazenamento.

@ /000         ; Início do programa

    ; --- Inicializações ---
    LD 0          
    MM I          ; I <- 0 (contador: n atual)

    LD 0          
    MM SQUARE     ; SQUARE <- 0 (0² = 0)

    LD 1          
    MM ODD        ; ODD <- 1 (primeiro número ímpar a somar)

    LD BASE       
    MM PTR        ; PTR <- BASE (inicia em 0x100, onde começa a tabela)

    ; --- Armazena o quadrado de 0 na posição BASE ---
    LD PTR        
    SC STORE      ; Auto-modifica a instrução STORE: insere PTR no campo de endereço
    LD SQUARE     
    JP STORE      ; Executa STORE (que agora armazena SQUARE em [PTR])

LOOP:
    ; --- Incrementa o contador: I = I + 1 ---
    LD I        
    AD 1        
    MM I        

    ; --- Verifica se atingiu 64 (i.e. se I == FINAL) ---
    LD FINAL     
    SB I        
    JZ END       ; Se FINAL - I == 0, então acabaram os números

    ; --- Atualiza SQUARE: SQUARE = SQUARE + ODD ---
    LD SQUARE    
    AD ODD      
    MM SQUARE   

    ; --- Atualiza ODD: ODD = ODD + 2 ---
    LD ODD     
    AD TWO    
    MM ODD    

    ; --- Atualiza o ponteiro: PTR = PTR + 2 ---
    LD PTR    
    AD TWO   
    MM PTR    

    ; --- Auto-modifica a instrução STORE para usar o novo valor de PTR ---
    LD PTR    
    SC STORE  

    ; --- Armazena o novo SQUARE na posição apontada por PTR ---
    LD SQUARE   
    JP STORE  

    JP LOOP    ; Repete o loop

END:
    HM         ; Encerra o programa

; --- Instrução de armazenamento auto-modificável ---
; A ideia é que o campo de endereço desta instrução seja modificado por “SC STORE”
; para apontar para o destino correto.
STORE:
    MM /0000   ; Instrução modelo: após auto-modificação, o “/0000” será substituído
               ; pelo valor contido em PTR.

; --- Dados (alocados a partir de 0x300) ---
@ /300
I       K = 0         ; Contador n (inicia em 0)
SQUARE  K = 0         ; Acumulador do quadrado atual
ODD     K = 1         ; Valor do próximo número ímpar
PTR     K = 0         ; Ponteiro para a posição de armazenamento (inicia com BASE)
FINAL   K = 64        ; Quantidade de números a processar (0 a 63 → 64 valores)
TWO     K = 2         ; Constante 2
BASE    K = 0x100     ; Endereço base da tabela de quadrados
