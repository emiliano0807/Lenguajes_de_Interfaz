.model small;Se asigna tama?o de memoria
.stack;modelo de pila
.data;inicio de datos

.code;inicio de c?digo
main proc;Inicia procesi principal
mov cx,9
ciclo:

mov ah,02
mov dx,cx
add dx,30h
int 21h

loop ciclo

mov ax,4c00h;Salir del programa
int 21h
main endp;Termina El Procedimiento
end main