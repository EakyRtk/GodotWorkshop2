class_name HitBox extends Area2D

signal hit_something

@export var damage : int = 1

func _ready() -> void:
    area_entered.connect(func(area: Node2D): if area is HurtBox: hit_something.emit())
