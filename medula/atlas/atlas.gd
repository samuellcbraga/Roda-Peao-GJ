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

var personagens := {
	'fulanadetal': {
		'nome': 'Fulana de Tal',
		'retrato': preload("res://medula/personagens/pessoas/fulanadetal/fulanadetal-idle.png"),
		'horario': [50, 60], # entrada, saida, em minutos de jogo
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

	'amigo': {
		'nome': 'Tiringa',
		'retrato': preload("res://medula/personagens/pessoas/amigo/Amigo1.png"),
		'horario': [50, 60],
		'conversas': {
			'inicio': [
				{'texto': 'Oi eu sou o tiringa'},
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

var tempoPassado = 0 #começa de 18h30, isso são os minutos

func registrarEscolha(id: String) -> void:
	if id != '':
		escolhas[id] = true

func escolheu(id: String) -> bool:
	return escolhas.get(id, false)
