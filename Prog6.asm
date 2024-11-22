; SUMA Y RESTA CON ENSAMBLADOR

.model small
.stack 64

.data
numero1 db 0
numero2 db 0
suma db 0
resta db 0

mensaje1 db 10,13, "Ingresa el primer numero: $"
mensaje2 db 10,13, "Ingresa el segundo numero: $"
mensaje3 db 10,13, "La suma es: $"
mensaje4 db 10,13, "La resta es: $"

.code
begin proc far
    mov ax, @data
    mov ds, ax
    
    ; Solicitar primer n?mero
    mov ah, 09h
    lea dx, mensaje1
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h        ; Convertir ASCII a n?mero
    mov numero1, al
    
    ; Solicitar segundo n?mero
    mov ah, 09h
    lea dx, mensaje2
    int 21h
    mov ah, 01h
    int 21h
    sub al, 30h        ; Convertir ASCII a n?mero
    mov numero2, al
    
    ; Realizar suma
    mov al, numero1
    add al, numero2
    mov suma, al
    
    ; Realizar resta
    mov al, numero1
    sub al, numero2
    mov resta, al
    
    ; Mostrar la suma
    mov ah, 09h
    lea dx, mensaje3
    int 21h
    mov al, suma
    add al, 30h        ; Convertir n?mero a ASCII
    mov dl, al
    mov ah, 02h
    int 21h
    
    ; Mostrar la resta
    mov ah, 09h
    lea dx, mensaje4
    int 21h
    mov al, resta
    add al, 30h        ; Convertir n?mero a ASCII
    mov dl, al
    mov ah, 02h
    int 21h
    
    ; Salir del programa
    mov ax, 4C00h
    int 21h
begin endp
end begin
