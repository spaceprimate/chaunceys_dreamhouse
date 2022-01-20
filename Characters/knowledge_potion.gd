extends Area2D


onready var player_vars = get_node("/root/PlayerVariables")
export var potion_type = "bed"

enum{
	UNKNOWN,
	KNOWN,
	BUILT
}

func _ready():
	# if the player has already learned this potion, hide it when the scene loads
	if player_vars[potion_type] == KNOWN || player_vars[potion_type] == BUILT:
		self.visible = false
	return
	
	


func _input(event):
	
	if event.is_action_pressed("ui_pick") and len(get_overlapping_bodies()) > 0:
		print(len(get_overlapping_bodies()))
		find_and_use_dialog()
		
		
		
		player_vars[potion_type] = KNOWN
		
		
		
		
		
func find_and_use_dialog():
	
	var dialog_player = get_node_or_null("DialogPlayer")
	
	
	if dialog_player:
		dialog_player.dialog_files_id = 0
		dialog_player.play()
		self.visible = false
	else:
		print("couldn't find player")
