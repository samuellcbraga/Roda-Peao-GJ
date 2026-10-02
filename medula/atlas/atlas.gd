extends Node

# NESSE "SCRIPT", VAI FICAR TODA A BIBLIOTECA DE FALA, DIALOGO, PERSONAGENS E AFINS
# ELE É GLOBAL, PORTANTO, QUALQUER SCRIPT DO JOGO PODE MENCIONAR ELE E RESGATAR QUALQUER VARIAVEL DAQUI,
# BASTA VOCE MENCIONAR atlas.variavelTal
#
# COMO ESCREVER UM PERSONAGEM:
# a chave (ex: 'fulanadetal') é o que vai no campo "personagem" do ObjetoInterativo
# 'conversas' guarda cada ramo do diálogo, e todo personagem começa pelo ramo 'inicio'
# cada fala é {'texto': '...'} e pode ter 'opcoes'
# cada opção pode ter:
#   'id'       -> fica salvo em atlas.escolhas quando o jogador escolhe ela
#   'vai_para' -> nome do próximo ramo. sem 'vai_para', a conversa acaba
#
# CONDIÇÕES (funcionam em qualquer fala ou opção):
#   'se': 'id'      -> só aparece se esse id já foi registrado
#   'se_nao': 'id'  -> só aparece se esse id NÃO foi registrado
# DESVIO: fala sem 'texto', só com 'vai_para' (e uma condição)
#   se a condição bater, pula pro ramo; se não, é ignorada
#   o primeiro desvio que bater ganha, então o mais específico vai primeiro
# AUTOMÁTICO: conversar com alguém registra 'falou_<chave>', ex: 'falou_fulanadetal'


#func pegadorDeRecursos(recurso, quem, pose=''): # SUA FUNÇÃO DJI SUCESSO PARA RESGATAR QUAAAAALQUER IMAGEM 1!!!	
	#match recurso:
		#'personagem_pose':
			#return "res://medula/personagens/pessoas/"+quem+"/"+pose+".png"
		
	

var personagens := {
	'barman': {
		'nome': 'Barman',
		'poses': {'idle': preload('res://medula/personagens/pessoas/barman/idle.png')},
		'speech': preload('res://medula/personagens/pessoas/barman/bla.mp3'),
		'horario': [0, 6767],
		'conversas': {
			'inicio': [
				{'texto': 'treste teste teste'}
			]
		}
	},
	
	
	'enzo': {
		'nome': 'Enzo Gabriel',
		'poses': {'idle': preload('res://medula/personagens/pessoas/enzo/idle.png')},
		'speech': preload('res://medula/personagens/pessoas/barman/bla.mp3'),
		'horario': [0, 90],
		'conversas': {
			'inicio': [
				{'texto': 'eaê, tioooo?!!'}
			]
		}
	},
	
	'engravatado': {
		'nome': 'Homem de Finanças',
		'poses': {'idle': preload('res://medula/personagens/pessoas/engravatados/idle.png')},
		'speech': preload('res://medula/personagens/pessoas/barman/bla.mp3'),
		'horario': [0, 120],
		'conversas': {
			'inicio': [
				{'texto': 'Boa noite, vossa senhoria. Desejas fofocar? uh la la'}
			]
		}
	},
	
	'universitarios': {
		'nome': 'Grupo de Universitários',
		'poses': {'idle': preload('res://medula/personagens/pessoas/universitarios/idle.png')},
		'speech': preload('res://medula/personagens/pessoas/barman/bla.mp3'),
		'horario': [30, 150],
		'conversas': {
			'inicio': [
				{'texto': 'Mulheeer, nem te conto o babaado! Eitcha, Zé veio escutar nóis...'}
			]
		}
	},
	
	'turistas': {
		'nome': 'Grupo de Universitários',
		'poses': {'idle': preload('res://medula/personagens/pessoas/turistas/idle.png')},
		'speech': preload('res://medula/personagens/pessoas/barman/bla.mp3'),
		'horario': [90, 150],
		'conversas': {
			'inicio': [
				{'texto': 'tchê e pir e brother, paixxxx, ei paizão'}
			]
		}
	},
	
	'bitu': {
		'nome': 'Bitú',
		'poses': {'idle': preload('res://medula/personagens/interativos/bitu/idle.png')},
		'speech': preload('res://medula/personagens/interativos/bitu/bla.mp3'),
		'horario': [90, 150],
		'conversas': {
			'inicio': [
				{'texto': 'tchê e pir e brother, paixxxx, ei paizão'}
			]
		}
	},
	
	'bebum': {
		'nome': 'Bebum',
		'poses': {'idle': preload('res://medula/personagens/interativos/bebum/idle.jpg')},
		'speech': preload('res://medula/personagens/interativos/bebum/bla.mp3'),
		'horario': [0, 6767],
		'conversas': {
			'inicio': [
				{'texto': 'Ep.... Epa!!!... Boa... Boa nooo...i-..te! Só- Só mais essa e eu vou embora!'}
			]
		}
	},
	
	'meninas': {
		'nome': 'Grupo de Meninas',
		'poses': {'idle': preload('res://medula/personagens/pessoas/meninas/idle.png')},
		'speech': preload('res://medula/personagens/pessoas/meninas/bla.mp3'),
		'horario': [60, 210], # entrada, saida, em minutos de jogo
		'conversas': {
			'inicio': [
				{'texto': 'Oi véio desgraçado'},
				{'texto': 'tu é peso ou tonelada?', 'opcoes': [
					{'texto': 'sou peso visse!', 'id': 'disse_peso', 'vai_para': 'peso'},
					{'texto': 'sou tonelada!', 'vai_para': 'tonelada'},
				]},
			],
			'peso': [
				{'texto': 'véi burro'},
			],
			'tonelada': [
				{'texto': 'boa véio'},
				{'texto': 'pose meu rato!'},
			],
		},
	},
	
	
	'biu': {
	'nome': 'Seu Biu Pingão',
	'poses': {'idle': preload('res://medula/personagens/pessoas/biu/idle.png')},
	'speech': preload('res://medula/personagens/pessoas/meninas/bla.mp3'),
	'horario': [0, 6767],
	'conversas': {
		'inicio': [
			{'texto': 'Oi eu sou o seu biu'},
		],
	},
	
	
	},
}

# toda escolha com 'id' que o jogador fizer fica aqui, ex: {'disse_tonelada': true}
var escolhas := {}

func escolhasAleatoriasPalavrasChaves():
	pass # colocar aqui pra gerar palavras chaves aleatorias

var palavrasChaves = {
	'sujeitos': ['Janaína', 'Zé Butico'],
	'acoes': ['se jogou do quinto andar', 'engravidou de Fátima']
}

var tempoPassado = 0 #começa de 18h30, isso são os minutos a partir de 18h30

func registrarEscolha(id: String) -> void:
	if id != '':
		escolhas[id] = true

func escolheu(id: String) -> bool:
	return escolhas.get(id, false)
