extends KinematicBody2D


# global variables for player stored here (using a singleton that's autoloaded, PlayerVariables.gd)
onready var player_vars = get_node("/root/PlayerVariables")
# demonstrating accessing and setting global, we can probably delete this
func _ready():
	max_jumps = player_vars.max_jumps
	print("baloon pants")
	print(player_vars.char_name)
	player_vars.char_name = "regular shoes"
	print(player_vars.char_name)
	print(self.position)
	
	
	print("position: ")
	print(self.position)


# "export" makes variable viewable in the inspector. "float" sets the var type to use
export(float) var move_speed = 200
export(float) var jump_impulse = 600 # we export as diff chars may have different jump heights
export(int) var max_jumps = 1

enum STATE { IDLE, RUN, JUMP, DOUBLE_JUMP } #as an array, eg. 0,1,2. to use STATE.IDLE

onready var animated_sprite = $AnimatedSprite
onready var animation_tree = $AnimationTree #this looks in the player heirarchy for a node called AnimationTree

#signal
signal changed_state(new_state_string, new_state_id)

var velocity : Vector2

var current_state = STATE.IDLE setget set_current_state
var jumps = 0

# code for picking up and throwing objects
var canPick = true

func _physics_process(delta):
	var input = get_player_input()
	adjust_flip_direction(input)
	
	# set the velocity
	velocity = Vector2(
		input.x * move_speed,
		#cap the speed with the min function
		min(velocity.y + GameSettings.gravity, GameSettings.terminal_velocity)
	)
	
	var snap = Vector2.DOWN * 32 if !STATE.JUMP or !STATE.DOUBLE_JUMP else Vector2.ZERO
	
	velocity = move_and_slide_with_snap(velocity, snap, Vector2.UP) #we need to specify the direction of up in the game
	
	set_anim_parameters()
	
	#move_and_slide(velocity)
	#move_and_collide(velocity * delta)
	
	pick_next_state()
	
func adjust_flip_direction(input : Vector2):
	if(sign(input.x) == 1):
		
		animated_sprite.flip_h = false
	elif(sign(input.x) == -1):
		animated_sprite.flip_h = true
	#if going right, don't flip
	#if(sign(input.x) == 1):
	#	animated_sprite.flip_h = false
	#elif(sign(input.x == -1)):
	#	animated_sprite.flip_h = true
	#print(sign(input.x) == -1)	
	
	
func set_anim_parameters():
	animation_tree.set('parameters/x_sign/blend_position', sign(velocity.x))
	animation_tree.set("parameters/y_sign/blend_amount", sign(velocity.y))
	
func pick_next_state():
	if(is_on_floor()):
		jumps = 0
		
		# if jump is pressed while the character is on the ground
		if(Input.is_action_just_pressed("jump") ):
			self.current_state = STATE.JUMP
		elif(abs(velocity.x) > 0):
			self.current_state = STATE.RUN
		else:
			self.current_state = STATE.IDLE
	else: 
		if(Input.is_action_just_pressed("jump") && jumps < max_jumps):
			self.current_state = STATE.DOUBLE_JUMP
		
		
func get_player_input():
	var input : Vector2
	# 2 vectors (x/y)
	
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	input.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	return input
	
func jump():
	velocity.y = -jump_impulse
	jumps += 1
	
	
# SETTERS
func set_current_state(new_state):
	match(new_state):
		STATE.JUMP:
			jump()
		STATE.DOUBLE_JUMP:
			jump()
			animation_tree.set("parameters/double_jump/active", true)
			
	
	
	current_state = new_state
	emit_signal("changed_state", STATE.keys()[new_state], new_state)



func set_active(active):
	set_physics_process(active)
	set_process(active)
	set_process_input(active)


func set_max_jumps(n):
	max_jumps = n
