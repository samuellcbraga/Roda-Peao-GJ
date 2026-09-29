extends Control
func _on_BotaoDireita_pressed():
	get_tree().change_scene_to_file("res://medula/cenas/jogatina/componentes/paredes/frente.tscn")

func _on_BotaoEsquerda_pressed():
	get_tree().change_scene_to_file("res://medula/cenas/jogatina/componentes/paredes/tras.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
