extends Control

const GAME_LEVEL : PackedScene = preload("uid://dn15ipcltyfie")

func _ready() -> void:
	%PlayButton.pressed.connect(func(): get_tree().call_deferred("change_scene_to_packed", GAME_LEVEL))
	%ExitButton.pressed.connect(get_tree().quit)
