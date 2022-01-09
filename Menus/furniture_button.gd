extends Button

export(String) var furniture_type


onready var player_vars = get_node("/root/PlayerVariables")


enum{
	UNKNOWN,
	KNOWN,
	BUILT
}

func _ready():
	if player_vars[furniture_type] == UNKNOWN:
		self.visible = false
	elif player_vars[furniture_type] == BUILT:
		self.visible = false
	elif player_vars[furniture_type] == KNOWN:
		self.visible = true
		
	



