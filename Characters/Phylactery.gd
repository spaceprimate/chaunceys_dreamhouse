extends Area2D


onready var player_vars = get_node("/root/PlayerVariables")

func _input(event):
	
	if event.is_action_pressed("ui_pick") and len(get_overlapping_bodies()) > 0:
		print(len(get_overlapping_bodies()))
		find_and_use_dialog()
		
		
		
		
func find_and_use_dialog():
	
	var dialog_player = get_node_or_null("DialogPlayer")
	
	
	if dialog_player:
		
		if player_vars.ghost_status == 1:
			dialog_player.dialog_files_id = 0
			player_vars.max_jumps = 2
			player_vars.ghost_status = 2
			get_node("../Player").set_max_jumps(2)
			dialog_player.play()
		elif player_vars.ghost_status == 0:
			dialog_player.dialog_files_id = 1
			dialog_player.play()
	else:
		print("couldn't find player")
