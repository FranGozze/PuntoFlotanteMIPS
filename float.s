# Puede chequear los resultados en https://www.h-schmidt.net/FloatConverter/IEEE754.html
#
# Segmento de datos
.data
    Ingrese:     .asciiz "Ingrese el numero real: " 
    Mantisa:     .asciiz "La mantisa es: "
    Expo:        .asciiz "El exponente es: "
    nuevaLinea:  .asciiz "\n"

# Segmento de codigo 
.text
.globl main
main:
            li $v0, 4
            la $a0, Ingrese
            syscall
            
            li $v0, 6                   # Lee el float y lo pone en f0
            syscall 
            mfc1 $t0, $f0
  
            andi $t1, $t0, 0xFF800000   # Hago and al nro para sacar el exponente (01111111100000000000000000000000)

            andi $t2, $t0, 0x7FFFFF     # Hago and al nro para sacar la mantisa (00000000111111111111111111111111)

            srl $t1, $t1, 23            # Desplazo el exponente 23 lugares a la derecha
            andi $t3, $t1, 0x80         # Hago un and para ver el signo del exponente y posteriormente moverlo
            sll $t3, $t3, 8             # Desplazo el signo del exponente al final del nro
            andi $t1, $t1, 0xFF         # Elimino el signo

            li $v0, 4
            la $a0, nuevaLinea
            syscall
            la $a0, Mantisa         
            syscall

            li $v0, 1
            move $a0, $t2
            syscall

            li $v0,4
            la $a0, nuevaLinea
            syscall
            la $a0, Expo
            syscall

            li $v0, 1
            move $a0, $t1
            syscall


            # Salida el programa
            li $v0, 10
            syscall


