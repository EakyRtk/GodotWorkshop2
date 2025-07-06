extends Node2D

@onready var pages_counter : HBoxContainer = %PagesContainer
@onready var camera : Camera2D = $Camera
@onready var showreel_video : VideoStreamPlayer = %ShowreelVideo

const CAMERA_START_POS : float = 960

var max_page_count : int 

var page : int = 0:
	set(val):
		if val < 0: val = 0
		if val > max_page_count: val = max_page_count
		page = val
		camera.position.x = CAMERA_START_POS + page * 1920

func _ready() -> void:
	max_page_count = pages_counter.get_child_count() - 1

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("right"):
		page += 1
	if event.is_action_pressed("left"):
		page -= 1
