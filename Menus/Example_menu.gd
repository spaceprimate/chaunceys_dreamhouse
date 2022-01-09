extends Control

onready var player_vars = get_node("/root/PlayerVariables")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum{
	KNOWN,
	UNKNOWN,
	BUILT
}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	player_vars["table"] == BUILT
	get_node_or_null("../../Table_H").visible = true
	
