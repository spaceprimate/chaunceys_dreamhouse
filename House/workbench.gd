extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _input(event):	
	if event.is_action_pressed("ui_pick") and len(get_overlapping_bodies()) > 0:
		get_node("../build_container/build_menu").visible = true
		get_node("../build_container/build_menu").turn_off_the_player()
		get_node("../build_container/build_menu/buttons/close_button").grab_focus()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
