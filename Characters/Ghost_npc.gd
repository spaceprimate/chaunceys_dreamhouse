extends Area2D

onready var player_vars = get_node("/root/PlayerVariables")


func _ready():
	get_node("../bed_potion").visible = false

func _input(event):
	
	if event.is_action_pressed("ui_pick") and len(get_overlapping_bodies()) > 0:
		print(len(get_overlapping_bodies()))
		find_and_use_dialog()
		
func find_and_use_dialog():
	
	var dialog_player = get_node_or_null("DialogPlayer")
	
	#f player_vars.ghost_status == 0:		
	#player_vars.ghost_status = 1
	
	#elif  player_vars.ghost_status == 1:
	#	dialog_player = get_node_or_null("DialogPlayer2")
	#	player_vars.ghost_status = 2
	
	if dialog_player:
		#ialog_player.dialog_files_id = player_vars.ghost_status
		
		if player_vars.ghost_status == 0:
			dialog_player.set_file_id(0)
			dialog_player.play()
			player_vars.ghost_status = 1
		elif player_vars.ghost_status == 1:
			dialog_player.set_file_id(1)
			dialog_player.play()
		elif player_vars.ghost_status == 2:
			dialog_player.set_file_id(2)
			dialog_player.play()
			get_node("../bed_potion").visible = true
			self.visible = false
		
		
	else:
		print("couldn't find player")
