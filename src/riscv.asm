.data
	# VetorAulas inicializado com o valor 0xFFFFFFFF (1 em decimal).
  VetorAulas: .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
	
	numeroAulaMensagem: .asciz "Entre com o número da aula (de 0 a 15): "
  numeroAlunoMensagem: .asciz "Entre com o número do aluno (de 0 a 31): "
  registroMensagem: .asciz "Entre com o tipo do registro (presença = 1; ausência = 0): "
	
	valorInvalido: .asciz "Valor inválido, digite novamente: "
	
.text
	
	# Adicionando a t5 e t6 valores relacionados as condicionais.
	loopInfinito:
        addi t5, zero, 0
      	addi t6, zero, 16
     
        verificadorAulas:
        	addi a7, zero, 4
          la a0, numeroAulaMensagem
          ecall
          
          addi a7, zero, 5
          ecall
      
          add s0, zero, a0
      
          jal endDigitoInvalidoAulas
    
        digitoInvalidoAulas:
          # Imprime "Valor inválido, digite novamente: ".
          addi a7, zero, 4
          la a0, valorInvalido
          ecall
        
          jal verificadorAulas
        endDigitoInvalidoAulas:
          # Pula para a label digitoInvalido se valor informado for menor que 0 ou maior e igual a 16.
          blt s0, t5, digitoInvalidoAulas
          bge s0, t6, digitoInvalidoAulas
      endVerificadorAulas:
  	
  	addi t5, zero, 0
  	addi t6, zero, 32
  	
  	verificadorAlunos:
  		
  		addi a7, zero, 4
      la a0, numeroAlunoMensagem
      ecall
      
	  	addi a7, zero, 5
	  	ecall
	  
	  	add s1, zero, a0
	  
	  	jal endDigitoInvalidoAlunos
    
    	digitoInvalidoAlunos:
    		# Imprime "Valor inválido, digite novamente: "
    		addi a7, zero, 4
	    	la a0, valorInvalido
	    	ecall
	    
	    	jal verificadorAlunos
    	endDigitoInvalidoAlunos:
    		# Vai para digitoInvalido se o valor inserido for menor que 0 ou maior que 31.
  			blt s1, t5, digitoInvalidoAlunos
	  		bge s1, t6, digitoInvalidoAlunos
  	endVerificadorAlunos:

  	
  	
  	# Imprime "Entre com o tipo do registro (presença = 1; ausência = 0): "
  	#addi a7, zero, 4
		#la a0, registroMensagem
  	#ecall
  
  	jal loopInfinito
	
		
	
