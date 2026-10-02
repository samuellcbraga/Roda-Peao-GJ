extends ColorRect

var palavraChaveDiarioInstancia = preload("res://medula/cenas/jogatina/componentes/diario/PalavraChave.tscn")

func recarregarDiario():
	for palavrachave in atlas.palavrasChaves.sujeitos:
		var InstanciaPalavraChave = palavraChaveDiarioInstancia.instantiate()
		InstanciaPalavraChave.text = palavrachave
		$DiarioBook/Sujeitos.add_child(InstanciaPalavraChave)
	for palavrachave in atlas.palavrasChaves.acoes:
		var InstanciaPalavraChave = palavraChaveDiarioInstancia.instantiate()
		InstanciaPalavraChave.text = palavrachave
		$DiarioBook/Acoes.add_child(InstanciaPalavraChave)

func apagarDiario():
	for children in $DiarioBook/Sujeitos.get_children():
		children.queue_free()
	for children in $DiarioBook/Acoes.get_children():
		children.queue_free()
	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
	




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_focus_next"):
		_on_diario_botao_pressed()

func _on_diario_botao_pressed() -> void:
	if self.position.y != 0:
		$AnimationPlayer.play("desce")
		recarregarDiario()
		
	else:
		$AnimationPlayer.play("sobe")
		apagarDiario()
