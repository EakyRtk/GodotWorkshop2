extends Control

func _ready() -> void:
    $VisibleOnScreenNotifier2D.screen_entered.connect(%ShowreelVideo.play)
