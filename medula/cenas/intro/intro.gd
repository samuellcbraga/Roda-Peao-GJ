extends Control

var etapas = [
	{"texto": "Uma fofoca das brabas, \npelos rumores que ouviu na obra,", "modo": "substituir"},
	{"texto": "com direito a chifre, gravidez, roga de praga, \nquase morte e sabe-se lá o que mais.", "modo": "substituir"},
	{"texto": "Todo mundo só fazia perguntar:", "modo": "substituir"},
	{"texto": "Mas com quem?", "modo": "substituir"},
	{"texto": "Filho de quem?", "modo": "adicionar"},
	{"texto": "Quem foi corno?", "modo": "adicionar"},
	{"texto": "Mas no meio do serviço, \nninguém tinha resposta pra dar.", "modo": "substituir"},
	{"texto": "Janaína ia ficar doidinha pelos detalhes, \nprecisava saber de tudo,", "modo": "substituir"},
	{"texto": "pra na manhã seguinte ela contar pra Lurdinha,", "modo": "substituir"},
	{"texto": "que ia contar pra Ivaneide,", "modo": "adicionar"},
	{"texto": "que ia contar pra Maria Socorro,", "modo": "adicionar"},
	{"texto": "que ia contar pra Dona Selma,", "modo": "substituir"},
	{"texto": "que ia contar pro resto do mundo (e mais).", "modo": "adicionar"},
	{"texto": "Janaína precisava saber antes de Dona Selma, \nsenão já ia ser notícia velha,", "modo": "substituir"},
	{"texto": "e com o máximo de detalhes possíveis, \nporque fofoca boa é fofoca bem contada.", "modo": "adicionar"},
	{"texto": "Você mal esperava pra contar pra ela...", "modo": "substituir"},
	{"texto": "O Bar da Roda ia estar cheio. \nO público é diverso: ", "modo": "substituir"},
	{"texto": "Colegas cansados querendo tomar uma geladinha, \nos trabalhadores de paletó e gravata,", "modo": "adicionar"},
	{"texto": "Os universitários da noite matando aula \ne quem mais quisesse aparecer.", "modo": "substituir"},
	{"texto": "Alguém deve saber dos detalhes da fofoca, \ncom certeza.", "modo": "substituir"},
	{"texto": "O horário combinado com Janaína é Dez e Meia, \nhora que acaba a novela das nove.", "modo": "substituir"},
	{"texto": "Nem um minuto a mais, ou ela se preocupa \ne já começa a pensar em briga, tiro e assalto.", "modo": "substituir"},
	{"texto": "Você se encaminha para o bar \ncom uma única missão:", "modo": "substituir"},
	{"texto": "Descobrir o máximo que conseguir dessa forte fofoca, \ntornando-a mais firme que nunca.", "modo": "adicionar"},
]

var indice := 0

func _on_botao_intro_pressed():
	if indice >= etapas.size():
		get_tree().change_scene_to_file("res://medula/cenas/jogatina/Jogatina.tscn")
		return
	var etapa = etapas[indice]
	if etapa["modo"] == "adicionar":
		$Texto.text += "\n\n" + etapa["texto"]
	elif etapa["modo"] == "substituir":
		$Texto.text = etapa["texto"]
	indice += 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
