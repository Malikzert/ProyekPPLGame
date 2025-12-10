extends Control

@export var max_hearts: int = 5
@onready var hearts_container = $HeartsContainer

var heart_full = preload("res://stage 3/assets/Healtpoint/Heart-Full.png")
var heart_empty = preload("res://stage 3/assets/Healtpoint/Heart-Empty.png")

func _ready():
	print("HealthUI ready, container:", $HeartsContainer)

func update_hearts(current_hp: int):
	print("Printing_Heart_1")
	for child in hearts_container.get_children():
		child.queue_free()

	for i in range(max_hearts):
		print("Printinggg Hearttt")
		var heart = TextureRect.new()
		heart.texture = heart_full if i < current_hp else heart_empty
		heart.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		hearts_container.add_child(heart)
