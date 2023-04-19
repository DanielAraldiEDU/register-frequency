# Disciplina: Arquitetura e Organizacao de Computadores
# Atividade: Avaliacao 01  Programacao em Linguagem de Montagem
# Programa 01
# Grupo: - Daniel Sansao Araldi
# - Rafael Mota Alves


.data
	# VetorAulas inicializado com o valor 0xFFFFFFFF (-1 em decimal).
  VetorAulas: .word 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF, 0xFFFFFFFF
	
	numeroAulaMensagem: .asciz "Entre com o número da aula (de 0 a 15): "
  numeroAlunoMensagem: .asciz "Entre com o número do aluno (de 0 a 31): "
  registroMensagem: .asciz "Entre com o tipo do registro (presença = 1; ausência = 0): "
  
  quebraLinha: .asciz "\n"
	
	valorInvalido: .asciz "Valor inválido, digite novamente: "
	valorRegistroInvalido: .asciz "Valor de registro inválido, digite novamente\n"
	
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
  	
  	addi t4, zero, 32
  	addi t5, zero, 0
  	addi t6, zero, 1
    la s2, VetorAulas
  	
  	verificadorPresenca:
  		# Imprime "Entre com o tipo do registro (presença = 1; ausência = 0): "
  		addi a7, zero, 4
			la a0, registroMensagem
  		ecall
  		
  		addi a7, zero, 5
	  	ecall
	  	
	  	add s3, zero, a0
  		
  		beq s3, t5, ausencia
  		beq s3, t6, presenca
  		
  		addi a7, zero, 4
	    la a0, valorRegistroInvalido
	    ecall
	    
	    jal verificadorPresenca
	    
	    ausencia:
	    	bge t5, t4, endAusencia
	    		beq t5, s1, marcaAusencia
	    		
	    		jal endMarcaAusencia
	    		
		    	marcaAusencia: 
		    		slli t3, s1, 2
						add s3, s2, t3
						lw a0, 0(s3)
						
						andi s4, a0, 1
						
						slli t3, s1, 2
						add s3, s2, t3
						sw s4, 0(s3)
					endMarcaAusencia: 
					
	    		addi t5, t5, 1
	    		
	    		jal ausencia
	    endAusencia:
	    
	    addi t5, zero, 0
	    
	    presenca:
	    	bge t5, t4, endPresenca
	    		beq t5, s1, marcaPresenca
	    		
	    		jal endMarcaPresenca
	    		
		    	marcaPresenca: 
		    		slli t3, s1, 2
						add s3, s2, t3
						lw a0, 0(s3)
						
						addi s4, a0, 1
						
						slli t3, s1, 2
						add s3, s2, t3
						sw s4, 0(s3)
					endMarcaPresenca: 
					
	    		addi t5, t5, 1
	    		
	    		jal presenca
	    endPresenca:
	    
  	endVerificadorPresenca:
  	
  	addi t5, zero, 0
  	
  	showForB: 
		bge t5, t4, endShowForB
			addi a7, zero, 4
			la a0, quebraLinha
			ecall
			
			slli t1, t5, 2
			add s3, s2, t1
			lw a0, 0(s3)
			
			addi a7, zero, 1
			ecall 
			
			addi t5, t5, 1
		
			jal showForB
	endShowForB:
  
  	jal loopInfinito
