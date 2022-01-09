extends ColorRect


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


onready var tween_out = get_node("Tween")

export var transition_duration = 2.00
export var transition_type = 1 # TRANS_SINE

func fade_out():
	# tween music volume down to 0
	tween_out.interpolate_property(self, "modulate", Color(1,1,1,0), Color(1,1,1,1), 2.0, transition_duration, transition_type, Tween.EASE_IN)
	tween_out.start()
	
	# when the tween ends, the music will be stopped

# fade in goes faster
func fade_in():
	tween_out.interpolate_property(self, "modulate", Color(1,1,1,1), Color(1,1,1,0), 2.0, transition_duration, transition_type, Tween.EASE_IN)
	tween_out.start()
