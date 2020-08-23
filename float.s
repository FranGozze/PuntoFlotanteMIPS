        .data
Ingrese:   .asciiz "Ingrese el numero real: " 
Mantiza:   .asciiz "La mantiza es: "
Expo:   .asciiz "El exponente es: "

    .text #zona de instrucciones
main:       li $v0, 4
            la $a0, Ingrese
            syscall
            
            li $v0,6                    #Lee el float y lo pone en f0
            syscall 
            move $t0, $f0               #Mueve el float a t0

            andi $t1, $t0, 7F000000     #le hago and al nro para sacar el exponente(01111111000000000000000000000000)

            andi $t2, $t0, 00FFFFFF     #le hago and al nro para sacar la mantiza(00000000111111111111111111111111)

            sra $t1, $t1, 24

            li $v0,4
            la $a0, Mantiza
            syscall
            
            move $a0, $t2
            li $v0, 1
            syscall              


            li $v0,4
            la $a0, Expo
            syscall

            move $a0, $t1
            li $v0, 1
            syscall              


            li $v0, 10      #termino el programa
            syscall
