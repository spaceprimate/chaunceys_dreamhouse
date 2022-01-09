extends CanvasLayer


export(String, FILE, "*.json") var dialog_file
export(String, FILE, "*.json") var dialog_file2
export(String, FILE, "*.json") var dialog_file3
export(String, FILE, "*.json") var dialog_file4

var dialog_files = []
var dialog_files_id = 0
var dialogs = []
var current_dialog_id = 0
var is_dialog_active = false
var init_fade = false


var ghost_dialog = []



func _ready():
	$NinePatchRect.visible = false
	if dialog_file != "":
		dialog_files.append(dialog_file)
	if dialog_file2 != "":
		dialog_files.append(dialog_file2)
	if dialog_file3 != "":
		dialog_files.append(dialog_file3)
	if dialog_file4 != "":
		dialog_files.append(dialog_file4)
	
	
func play():
	if is_dialog_active:
		return
	
	dialogs = load_dialog()
	turn_off_the_player()
	is_dialog_active = true
	$NinePatchRect.visible = true
	current_dialog_id = -1
	next_line()

func _input(event):
	if not is_dialog_active:
		return
	
	if event.is_action_pressed("ui_pick"):
		next_line()

func next_line():
	current_dialog_id += 1
	
	if current_dialog_id >= len(dialogs):
		if init_fade == true:
			get_node("../fade_out/ColorRect").fade_in()
			
		
		$Timer.start()
		#is_dialog_active = false
		$NinePatchRect.visible = false
		turn_on_the_player()
		return
		
	$NinePatchRect/Name.text = dialogs[current_dialog_id]['name']
	$NinePatchRect/Message.text = dialogs[current_dialog_id]['text']
	

	
	
	
func load_dialog():
	var file = File.new()
	print("dialog player id: ")
	print(dialog_files[dialog_files_id])
	if file.file_exists(dialog_files[dialog_files_id]):
		file.open(dialog_files[dialog_files_id], file.READ)
		return parse_json(file.get_as_text())




# pick up from here: 
# https://www.youtube.com/watch?v=EGteUAiR7P8


func _on_Timer_timeout():
	is_dialog_active = false



func turn_on_the_player():
	var player = get_tree().get_root().find_node("Player", true, false)
	if player:
		player.set_active(true)
		
func turn_off_the_player():
	var player = get_tree().get_root().find_node("Player", true, false)
	if player:
		player.set_active(false)
		
		
		
func set_file_id(id):
	dialog_files_id = id
		

