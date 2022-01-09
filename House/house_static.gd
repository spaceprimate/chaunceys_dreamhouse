extends Area2D

onready var player_vars = get_node("/root/PlayerVariables")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(String) var target_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = player_vars.house_visible
	pass # Replace with function body.





#func _input(event):
#	if event.is_action_pressed("ui_pick"):
#		if !target_scene: # is null
#			print("no scene in this door")
#		if get_overlapping_bodies().size() > 0:
#			print("next level called tho")
#			get_node("../Level1").enter_house()
#			#next_level()
#
#f#unc next_level():
	##var ERR = get_tree().change_scene_to(target_scene)
	
	
	
	
#	get_node("../scene_timer").start()
#	#self.visible = false
#	#pass # Replace with function body.



#func _on_Timer_timeout():
#	print("timer times bro")
#	get_tree().change_scene(target_scene)
