extends Node2D

onready var player_vars = get_node("/root/PlayerVariables")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	# debug delete
	
	
	# allows player to start at last recorded position before exiting level
	# this is set by whatever scene the player enters from Level1
	if player_vars.set_player_position == true:
		$Player.position = player_vars.player_position
	
	
	# handle intro: play beginning title cards or just fade in
	if player_vars.intro_played == false:
		$intro_player.init_fade = true
		$intro_player.play()
		player_vars.intro_played = true
	else :
		get_node("fade_out/ColorRect").fade_in()
		
		
	# handle house visibility	
	if player_vars.house_visible == false:
		$house_static.visible = false
	else:
		$myHouse.visible = false

	
	pass # Replace with function body.


func enter_house():
	#var target = "res://House.tscn"
	print("enter house called")
	$audio_main.fade_out()
	#get_node("fade_out/ColorRect").visible = true
	get_node("fade_out/ColorRect").fade_out()
	get_node("scene_timer").start()






func _on_scene_timer_timeout():
	print("timer times bro")
	get_tree().change_scene("res://House.tscn")
	
	

