.model small
.stack 100h         ; Tama?o de la pila

.data
    mensaje_mayor db "El primer numero es mayor$", 0
    mensaje_menor db "El segundo numero es mayor$", 0

.code
start:
    mov ax, @data   ; Inicializa el segmento de datos
    mov ds, ax

    ; Asignamos valores a los registros para compararlos
    mov ax, 10          ; Primer n?mero (sin signo, 16 bits)
    mov bx, 5           ; Segundo n?mero (sin signo, 16 bits)

    ; Comparamos los dos valores
    cmp ax, bx         ; Compara ax y bx
    ja es_mayor        ; Si ax > bx (sin signo), salta a la etiqueta 'es_mayor'

    ; Si no es mayor, contin?a aqu?
    lea dx, mensaje_menor ; Cargar el mensaje en el registro DX
    mov ah, 09h          ; Llamada a DOS para mostrar cadena
    int 21h              ; Interrupci?n para imprimir el mensaje
    jmp fin_programa      ; Salta al final del programa

es_mayor:
    ; Si ax es mayor que bx, ejecuta esto
    lea dx, mensaje_mayor ; Cargar el mensaje en el registro DX
    mov ah, 09h          ; Llamada a DOS para mostrar cadena
    int 21h              ; Interrupci?n para imprimir el mensaje

fin_programa:
    mov ax, 4C00h        ; Terminar el programa
    int 21h              ; Interrupci?n para salir

END start
