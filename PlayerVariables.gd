extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var char_name = "boots"

export(Vector2) var start_position = Vector2(-470, -1109)
export(Vector2) var house_position = Vector2(877, -403)

export(Vector2) var player_position = start_position
export var set_player_position = true

export var house_visible = false	

export var intro_played = false


# ghost state
# start at:					   0
# if ghost has been spoken to: 1
# if ghost quest completed:    2
export var ghost_status = 0

# start at 1
export var max_jumps = 1


# planning to use these for furniture eventually.
enum {
	UNKNOWN,
	KNOWN,
	BUILT
}



# items
export var bed = UNKNOWN
export var table = UNKNOWN
export var bath = UNKNOWN
export var window = UNKNOWN
export var deck = UNKNOWN
export var fire = UNKNOWN
export var idol = UNKNOWN

# Called when the node enters the scene tree for the first time.
func _ready():
	# testing ---------------------------
	ghost_status = 0
	house_visible = false
	max_jumps = 1
	set_player_position = true
	return

