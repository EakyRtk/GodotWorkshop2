extends Node2D

@export var hp : int = 1:
	set(val):
		hp = val
		if hp <= 0:
			hp = 0
			queue_free()

@export var speed : float = 100

@onready var hurt_box : HurtBox = $HurtBox

func _ready() -> void:
	hurt_box.exception_list.append($HitBox)
	hurt_box.took_hit.connect(_meteor_took_hit)    
	$Sprite2D.rotate(randf_range(0, 1))
	$VisibleOnScreenNotifier2D.screen_exited.connect(queue_free)

func _process(delta: float) -> void:
	self.position.x -= speed * delta

func _meteor_took_hit(damage: int) -> void:
	hp -= damage
