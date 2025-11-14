extends Control

@onready var yesbutton = $Panel/HBoxContainer/YesButton
@onready var nobutton = $Panel/HBoxContainer/NoButton

func _ready():
	# Hubungkan tombol
	yesbutton.pressed.connect(_on_yes_pressed)
	nobutton.pressed.connect(_on_no_pressed)

func _on_yes_pressed():
	get_tree().quit()  # keluar dari game

func _on_no_pressed():
	queue_free()  # tutup pop-up konfirmasi
