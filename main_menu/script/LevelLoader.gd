extends Node

var loading_scene := preload("res://main_menu/scenes/LoadingScreen.tscn")

func load_level_with_loading(path: String):
	var loader = loading_scene.instantiate()
	loader.next_scene_path = path
	get_tree().root.add_child(loader)
