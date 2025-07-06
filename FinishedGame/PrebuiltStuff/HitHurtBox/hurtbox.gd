class_name HurtBox extends Area2D

signal took_hit(damage: int)

var exception_list : Array[HitBox]

func _ready() -> void:
	area_entered.connect(_area_entered)

func _area_entered(area: Node2D) -> void:
	if area is HitBox and not area in exception_list:
		took_hit.emit(area.damage)
