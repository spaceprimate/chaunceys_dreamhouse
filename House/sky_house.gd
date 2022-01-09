extends RigidBody2D

onready var player_vars = get_node("/root/PlayerVariables")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#get_node("../house_static").visible = false
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if(player_vars.house_visible == false):
		get_node("../house_found_player").play()
		get_node("../house_static").visible = true
		player_vars.house_visible = true
		
		#get_node("../sign_house_dream").visible = true
		#get_node("../sign_house_prev").visible = false
		
		
		#yield(get_tree().create_timer(2), "timeout")
		$house_timer.start()
		#self.visible = false
		#pass # Replace with function body.



func _on_Timer_timeout():
	#self.visible = false
	#self.position = Vector2(-5000)
	get_parent().remove_child(self)
