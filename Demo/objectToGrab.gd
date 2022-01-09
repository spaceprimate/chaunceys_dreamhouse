extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var picked = false

func _physics_process(delta):
	if picked == true:
		self.position = get_node("../Player/Position2D").global_position
		
		
func _input(event):
	if Input.is_action_just_pressed("ui_pick"):
		var bodies = $Area2D.get_overlapping_bodies()
		for body in bodies:
			if body.name == "Player" and get_node("../Player").canPick == true:
				picked = true
				get_node("../Player").canPick = false
				
	if Input.is_action_just_pressed("ui_drop") and picked == true:
		picked = false
		get_node("../Player").canPick = true
		if get_node("../Player").animated_sprite.flip_h == false:
			apply_impulse(Vector2(), Vector2(20, -10))
		else:
			apply_impulse(Vector2(), Vector2(-20, -10))
	
	if Input.is_action_just_pressed("ui_throw") and picked == true: #should this be false??
		picked = false
		get_node("../Player").canPick = true
		if get_node("../Player").animated_sprite.flip_h == false:
			apply_impulse(Vector2(), Vector2(90, -60))
		else:
			apply_impulse(Vector2(), Vector2(-90, -60))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	pass # Replace with function body.
