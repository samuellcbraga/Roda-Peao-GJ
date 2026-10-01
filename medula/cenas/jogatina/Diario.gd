extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_focus_next"):
		_on_diario_botao_pressed()

func _on_diario_botao_pressed() -> void:
	if self.position.y != 0:
		$AnimationPlayer.play("desce")
	else: $AnimationPlayer.play("sobe")
