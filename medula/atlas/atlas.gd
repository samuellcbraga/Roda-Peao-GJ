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
		
	

var tempoPassado = 30 #começa de 18h30, isso são os minutos a partir de 18h30

var personagens := {
	'barman': {
		'nome': 'Barman',
		'poses': {'idle': preload('res://medula/personagens/pessoas/barman/barman_portrait.png')},
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
		'poses': {'idle': preload('res://medula/personagens/pessoas/enzo/enzo_portrait.png')},
		'speech': preload('res://medula/personagens/pessoas/enzo/bla.mp3'),
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
		'poses': {'idle': preload('res://medula/personagens/pessoas/universitarios/uni_portrait.png')},
		'speech': preload('res://medula/personagens/pessoas/universitarios/bla.mp3'),
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
				{'texto': 'auu auuu auuuuu'}
			]
		}
	},
	
	'biu': {
		'nome': 'Seu Biu Pingão',
		'poses': {'idle': preload('res://medula/personagens/interativos/bebum/idle.jpg')},
		'speech': preload('res://medula/personagens/interativos/bebum/bla.mp3'),
		'horario': [0, 6767],
		'conversas': {
			'inicio': [
				{'texto': 'Ep.... Epa!!!... Boa... Boa nooo...i-..te! Só- Só mais essa e eu vou embora!'}
			]
		}
	},
	
		'amigoes': {
		'nome': 'Amigos da obra',
		'poses': {'idle': preload('res://medula/personagens/mesas/amigos/mesa-amigos_placeholder.png')},
		'speech': preload('res://medula/personagens/pessoas/meninas/bla.mp3'),
		'horario': [0, 6767],
		'faseConversa': 0,
		'conversas': {
			'inicio': [
				{'texto': 'E aí, comparça! Como andam as coisas?', 'opcoes': [
					{'texto': 'Tudo em cima.', 'vai_para': 'tut2'},
				]},
			],
			'tut2': [
				{'texto': 'E a esposa? Como ficou sua vinda hoje?', 'opcoes': [
					{'texto': 'Finalmente gostou de eu vir, animada com a fofoca.', 'vai_para': 'tut3'},
				]},
			],
			'tut3': [
				{'texto': 'Haha, grande Jana! Com certeza está perguntando isso para falar com a minha esposa.', 'opcoes': [
					{'texto': 'É. Problema é que eu não entendo desse negócio de fofocar.', 'vai_para': 'tut4'},
				]},
			],
			'tut4': [
				{'texto': 'Pois não se preocupe! Vou te ensinar rapidinho. Hoje o bar ‘tá cheio.'},
				{'texto': 'Primeiro, cê tem que olhar pra todos os cantos do bar e ver quem tá por aí além do Garçom. Tenta dar uma olhadinha pros lados...'},
			],
		},
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
	
	}
# toda escolha com 'id' que o jogador fizer fica aqui, ex: {'disse_tonelada': true}
var escolhas := {}

func formatarTempoPassado():
	var horas = 18
	var minutos = 30
	
	horas += round(tempoPassado / 60)
	minutos += tempoPassado % 60
	if minutos > 59:
		horas += 1
		minutos -= 60
	
	
	return str(horas)+'h'+str("%02d" % minutos)

func escolhasAleatoriasPalavrasChaves():
	pass # colocar aqui pra gerar palavras chaves aleatorias

var palavrasChaves = {
	'sujeitos': ['Janaína', 'Zé Butico'],
	'acoes': ['se jogou do quinto andar', 'engravidou de Fátima']
}

var sfx = {
	'whoosh': preload("res://medula/sfx/whoosh.mp3"),
	'tick': preload("res://medula/sfx/tick.mp3"),
	
}


func registrarEscolha(id: String) -> void:
	if id != '':
		escolhas[id] = true

func escolheu(id: String) -> bool:
	return escolhas.get(id, false)
