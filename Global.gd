extends Node

var node_creation_parent = null
var player = null

var points = 0
var highscore = 0

func instance_node(node, location, parent):
	var node_instance = node.instantiate()
	parent.add_child(node_instance)
	node_instance.global_position = location
	return node_instance

func save():
	var save_dict = {
		"highscore": highscore
	}
	return JSON.stringify(save_dict)
	
func save_game():
	var save_file = FileAccess.open_encrypted_with_pass("user://savegame.save", FileAccess.WRITE, "enc")
	var saving = save()
	save_file.store_line(saving)
	save_file.close()

func load_game():
	var save_file =  FileAccess.open_encrypted_with_pass("user://savegame.save", FileAccess.READ, "enc")
	if save_file != null:
		var current_line = JSON.parse_string((save_file.get_line()))
		highscore = current_line["highscore"]
		save_file.close()
	else:
		print("Save file does not exist")
