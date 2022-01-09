extends Node2D

onready var player_vars = get_node("/root/PlayerVariables")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

enum {
	UNKNOWN,
	KNOWN,
	BUILT
}
# Called when the node enters the scene tree for the first time.
func _ready():
	
	if player_vars.deck == BUILT:
		show_deck()
	else:
		hide_deck()
		
	if player_vars.fire == BUILT:
		show_fireplace()
	else:
		hide_fireplace()
		
	if player_vars.window == BUILT:
		show_window()
	else:
		hide_window()
		
	player_vars.player_position = player_vars.house_position
	
	get_node("fade_out/ColorRect").fade_in()
	
	return


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func show_deck():
	player_vars.deck = BUILT
	get_node("base_area2d_supplement").visible = false
	get_node("base_area2d_supplement").collision_layer = 16
	get_node("base_area2d_supplement").collision_mask = 16
	
	get_node("deck_area").visible = true
	
	pass
	
	
func hide_deck():
	get_node("base_area2d_supplement").visible = true
	get_node("deck_area").visible = false
	get_node("deck_area/floor").collision_layer = 16
	
	
func show_fireplace():
	player_vars.fire = BUILT
	get_node("fireplace_scene").visible = true
	
func hide_fireplace():
	get_node("fireplace_scene").visible = false
	
	
func show_window():
	player_vars.window = BUILT
	get_node("wallpaper").visible = false
	get_node("wallpaper_windows").visible = true
	
func hide_window():
	get_node("wallpaper").visible = true
	get_node("wallpaper_windows").visible = false
	
	
	
func _on_deck_bed_button2_pressed():
	show_deck()


func _on_fireplace_bed_button3_pressed():
	show_fireplace()


func _on_window_bed_button4_pressed():
	show_window()






func enter_world():
	#var target = "res://House.tscn"
	print("enter world  called")
	$audio_main.fade_out()
	#get_node("fade_out/ColorRect").visible = true
	get_node("fade_out/ColorRect").fade_out()
	get_node("scene_timer").start()






func _on_scene_timasdfer_timeout():
	print("timer times bro")
	get_tree().change_scene("res://House.tscn")


func _on_scene_timer_timeout():
	print("timer times bro")
	get_tree().change_scene("res://Level1.tscn")
