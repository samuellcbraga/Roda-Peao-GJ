extends Control

var olhandoPra = 'Frente'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
#
#func sfxHandler(qual):
	#


func movimentoHandler(direcao : String):
	if direcao == 'direita':
		match olhandoPra:
			'Frente':
				$Bar/Paredes/Frente.hide()
				$Bar/Paredes/Direita.show()
				olhandoPra = 'Direita'
			'Direita':
				$Bar/Paredes/Direita.hide()
				$Bar/Paredes/Tras.show()
				olhandoPra = 'Tras'
			'Tras':
				$Bar/Paredes/Tras.hide()
				$Bar/Paredes/Esquerda.show()
				olhandoPra = 'Esquerda'
			'Esquerda':
				$Bar/Paredes/Esquerda.hide()
				$Bar/Paredes/Frente.show()
				olhandoPra = 'Frente'
	elif direcao == 'esquerda':
		match olhandoPra:
			'Frente':
				$Bar/Paredes/Frente.hide()
				$Bar/Paredes/Esquerda.show()
				olhandoPra = 'Esquerda'
			'Direita':
				$Bar/Paredes/Direita.hide()
				$Bar/Paredes/Frente.show()
				olhandoPra = 'Frente'
			'Tras':
				$Bar/Paredes/Tras.hide()
				$Bar/Paredes/Direita.show()
				olhandoPra = 'Direita'
			'Esquerda':
				$Bar/Paredes/Esquerda.hide()
				$Bar/Paredes/Tras.show()
				olhandoPra = 'Tras'
		print("Movimentação! Olhando para "+olhandoPra)
		



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right"):
		_on_botao_direita_pressed()
	elif event.is_action_pressed("ui_left"):
		_on_botao_esquerda_pressed()

func _on_botao_esquerda_pressed() -> void:
	movimentoHandler('esquerda')


func _on_botao_direita_pressed() -> void:
	movimentoHandler('direita')
