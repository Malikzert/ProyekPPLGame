extends Button

func _on_button_menu_pressed() -> void:
	# Reset status global agar intro level muncul lagi nanti
	Global3.is_retry = false 
	
	# Ganti path ini sesuai nama file menu kamu
	get_tree().change_scene_to_file("res://main_menu/scenes/MainMenu.tscn")


func _on_pressed() -> void:
	_on_button_menu_pressed() # Replace with function body.
