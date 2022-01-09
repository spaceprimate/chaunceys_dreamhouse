extends Area2D




func _input(event):
	
	if event.is_action_pressed("ui_pick") and len(get_overlapping_bodies()) > 0:
		print(len(get_overlapping_bodies()))
		find_and_use_dialog()
		
func find_and_use_dialog():
	
	var dialog_player = get_node_or_null("DialogPlayer")
	
	
	if dialog_player:
		dialog_player.dialog_files_id = 0
		dialog_player.play()
	else:
		print("couldn't find player")
