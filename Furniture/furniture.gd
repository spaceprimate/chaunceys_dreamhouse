extends "res://Demo/objectToGrab.gd"

onready var player_vars = get_node("/root/PlayerVariables")

export(String) var furniture_type
enum{
	UNKNOWN,
	KNOWN,
	BUILT
}

func _ready():
	if player_vars[furniture_type] == UNKNOWN:
		self.visible = false
	elif player_vars[furniture_type] == KNOWN:
		self.visible = false
	elif player_vars[furniture_type] == BUILT:
		self.visible = true
		
	#$Label.text = player_vars[furniture_type]
	#$Label.text = "test"
#export var starting_location







func _on_table_button_pressed(name):
	if name == furniture_type:
		self.visible = true
		player_vars[furniture_type] = BUILT
		
