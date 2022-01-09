extends Area2D

# code from: https://www.youtube.com/watch?v=AxymjihpUi4
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export(String) var target_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _input(event):
	if event.is_action_pressed("ui_pick"):
		if !target_scene: # is null
			print("no scene in this door")
		if get_overlapping_bodies().size() > 0:
			print("next level called tho")
			next_level()

func next_level():
	#var ERR = get_tree().change_scene_to(target_scene)
	
	
	get_tree().change_scene(target_scene)
	
	
	#if ERR != OK:
	#	print("somehting failed in the dorr scene")
