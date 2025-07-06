extends Camera2D

func _unhandled_input(event: InputEvent) -> void:
    if event.is_action_pressed("right"):
        self.position.x += 1920
    if event.is_action_pressed("left"):
        self.position.x -= 1920