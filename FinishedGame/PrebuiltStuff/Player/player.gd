class_name Player extends Node2D
signal player_hit(n_hp: int)

@onready var mermi_spawner : Marker2D = $ShootingMarker
@onready var hurt_box : HurtBox = $HurtBox

const MERMI : PackedScene = preload("res://FinishedGame/PrebuiltStuff/Player/bullet.tscn")

var hp : int = 3:
	set(val):
		hp = val
		if hp <= 0:
			hp = 0
			SignalBus.player_health_change.emit(hp)
			#get_tree().change_scene_to_file("res://yeni-proje/yeni_menu.tscn")
			get_tree().call_deferred("reload_current_scene")

@export var speed : float = 500.0

func _ready() -> void:
	hurt_box.took_hit.connect(_player_took_damage)
	

func _player_took_damage(damage: int) -> void:
	hp -= damage

func _process(delta: float) -> void:
	if Input.is_action_pressed("up"):
		position.y -= speed * delta
	if Input.is_action_pressed("down"):
		position.y += speed * delta

	if position.y > 1080:
		position.y = 10
	if position.y < 0:
		position.y = 1070
	
	if Input.is_action_just_pressed("shoot"):
		var yeni_bir_mermi := MERMI.instantiate()
		mermi_spawner.add_child(yeni_bir_mermi)
		yeni_bir_mermi.top_level = true
		yeni_bir_mermi.position = mermi_spawner.global_position

func _area_entered(area: Area2D) -> void:
	hp -= 1
	print(hp)
	player_hit.emit(hp)
	area.get_parent().queue_free()
	
