TITLE Intro Cadenas

;DESCRPICIÓN 
;Objetivo:  
;
; Autore(s):
;         García Ruiz Alejandro H.


; Semestre: 8vo Semestre ISC 
;FIN DESCRPICIÓN

INCLUDE Irvine32.inc  

INCLUDE MACROS.inc

.data
; Área de Declaración de Variables

;                           INDICE
palabras_20 db "PERRO",0    ; 0
			db "GATO-",0    ; 6
			db "OSO--",0    ; 12
			db "AZ---",0    ; 18
			db "FOCO-",0	; 24	 
			db "PAPAS",0    ; 30
			db "LAPIZ",0    ; 36

espacio_20 db "-",0

palabraSeleccionada_20 db 15 dup("0") 

contador_20 dword 0

palabraEscondida_20 db 15 dup(0)   ; "....."  .. es un punto por cada letra a descrubir

.code

	main20 PROC	
		;Lógica del Programa				
			
			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;;FALTA AÑADIR UN MÉTODO PARA LA SELECCIÓN DE LA PALABRA POR EL USUARIO/ALEATORIO



			;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
			;;;; COPIA UNA PALABRA DEL ARREGLO A UNA VARIABLE AUXILIAR
			;;   NO CONSIDERA GUIONES AL COPIAR LA PALABRA
			
			mov esi, offset palabras_20  ;ARREGLO DE PALABRAS
			add esi, 30     ; relacionado al indice de la palabra seleccionada

			mov edi, offset palabraSeleccionada_20 ;VARIABLE AUXILIAR

			mov ecx, 6  ; considerar el máximo numero de caracteres que puede tener la palabra

			ciclo:				

				mov ebx, edi  ;respaldo del valor de edi, para posteriormente realizar 
							  ;la comparacion de la cadena y ver si el caracter actual es un guion o no
				
				mov edi, offset espacio_20
				cmpsb  ;compara esi con edi , para saber si el caracter actual es guion				

				jz detener   ;si es cero, es decir, si es guion, entonces se pasa a detener, 
							 ;porque significa que ya no existen caracteres que copiar
							 ;en caso contrario, se copia el caracter actual a "palabra_seleccionada"


				;No es cerio, es decir, el caracter actual no es un guion, es una letra:

				inc contador_20   ;incrementa en 1
				
				dec esi
				dec edi
							
				mov edi, ebx  ;recuperar el valor de edi
				mov eax, edi
				
				movsb ;copiar el valor 
				loop ciclo

				dec contador_20

			detener:

			

		exit	

		
	
	main20 ENDP
	
	END main20