.data
	VetorAulas: .word 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
	
	textoA: .asciz "Entre com o número da aula (de 0 a 15): "
	textoB: .asciz "Entre com o número do aluno (de 0 a 31): "
	textoC: .asciz "Entre com o tipo do registro (presença = 1; ausência = 0): "
	
	valorInvalido: .asciz "Valor inválido, digite novamente: "
	
.text
	
	#adicionando a t5 e t6 valores relacionados as condicionais.
  addi t5, zero, 0
  addi t6, zero, 15
  
	loopInfinito:
		verificador:
	  	addi a7, zero, 5
	  	ecall
	  
	  	add s11, zero, a0
	  
	  	jal endDigitoInvalido
    
    	digitoInvalido:
    		# Imprime "Valor inválido, digite novamente: "
    		addi a7, zero, 4
	    	la a0, tamanhoInvalido
	    	ecall
	    
	    	jal verificador
    	endDigitoInvalido:
    		# Vai para digitoInvalido se o input for menor que 0 ou maior que 15.
  			blt s11, t5, digitoInvalido
	  		bge s11, t6, digitoInvalido
	
  	endVerificador:
  	
  	
  	
		# Imprime "Entre com o número da aula (de 0 a 15): "
		addi a7, zero, 4
		la a0, textoA 
  	ecall
  	
  	# Imprime "Entre com o número do aluno (de 0 a 31): "
  	addi a7, zero, 4
		la a0, textoB 
  	ecall
  	
  	# Imprime "Entre com o tipo do registro (presença = 1; ausência = 0): "
  	addi a7, zero, 4
		la a0, textoC
  	ecall
	
		
	