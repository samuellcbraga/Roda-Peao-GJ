extends CanvasLayer

# OVERLAY DE PASSAGEM DE TEMPO: escurece a tela por cima da jogatina, avança o relógio e clareia de novo
# COMO USAR (de dentro da Jogatina, por exemplo):
#   var passagem = preload("res://medula/cenas/PassagemTempo.tscn").instantiate()
#   add_child(passagem)
#   passagem.passar(30) # avança 30 minutos
# o sinal 'escureceu' dispara com a tela toda preta: bom momento pra trocar personagens, paredes e afins
# o sinal 'terminou' dispara quando a tela clareou de novo, e a cena se apaga sozinha

signal escureceu
signal terminou

@export var duracaoFade := 0.8 # segundos pra escurecer / clarear
@export var duracaoTexto := 1.5 # segundos que o horário fica na tela

func _ready() -> void:
	$Tela.modulate.a = 0.0
	$Tela/Texto.modulate.a = 0.0

func passar(minutos: int) -> void:
	var tween = create_tween()
	tween.tween_property($Tela, "modulate:a", 1.0, duracaoFade)
	await tween.finished

	atlas.tempoPassado += minutos
	$Tela/Texto.text = atlas.formatarTempoPassado()
	escureceu.emit()

	tween = create_tween()
	tween.tween_property($Tela/Texto, "modulate:a", 1.0, duracaoFade / 2)
	tween.tween_interval(duracaoTexto)
	tween.tween_property($Tela, "modulate:a", 0.0, duracaoFade)
	await tween.finished

	terminou.emit()
	queue_free()

# segura as setas e afins enquanto a tela tá escura, pra jogatina não reagir por baixo
func _input(event: InputEvent) -> void:
	get_viewport().set_input_as_handled()
