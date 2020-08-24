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
  
            andi $t1, $t0, 0x7F800000   # Hago and al nro para sacar el exponente (01111111100000000000000000000000)

            andi $t2, $t0, 0x00FFFFFF   # Hago and al nro para sacar la mantisa (00000000111111111111111111111111)

            srl $t1, $t1, 23            # Desplazo el exponente 23 lugares a la derecha
            andi $t3, $t1, 0x80         # Hago un and para ver el signo del exponente y posteriormente moverlo
            sll $t3, $t3, 24            # Desplazo el signo del exponente al final del nro
            andi $t1, $t1, 0x7F         # Elimino el signo
            or $t1, $t1, $t3

            li $v0, 4
            la $a0, nuevaLinea
            syscall
            la $a0, Mantisa         
            syscall

            move $a0, $t2
            li $v0, 1
            syscall              

            li $v0,4
            la $a0, nuevaLinea
            syscall
            la $a0, Expo
            syscall

            move $a0, $t1
            li $v0, 1
            syscall              

            li $v0,4
            la $a0, nuevaLinea
            syscall
            syscall
            li $v0, 1
            move $a0, $t0
            syscall


            # Salida el programa
            li $v0, 10
            syscall





