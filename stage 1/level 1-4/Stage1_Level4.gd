# stage 1/level 1-4/level_1_4.gd
extends Node2D

func _ready():
	print("Stage 1-4 (Burning Savanna) loaded by Hanin")
	setup_environment()

func setup_environment():
	# Background: tanah gersang
	var bg = ColorRect.new()
	bg.color = Color(0.6, 0.3, 0.1)  # coklat kering
	bg.size = get_viewport_rect().size
	add_child(bg)
	
	# Titik api
	var fire = Sprite2D.new()
	fire.color = Color(1, 0.4, 0)  # oranye
	fire.custom_minimum_size = Vector2(40, 40)
	fire.position = Vector2(400, 300)
	fire.name = "Fire"
	add_child(fire)
	
	# Tanah subur (tempat menanam benih)
	var soil = ColorRect.new()
	soil.color = Color(0.2, 0.6, 0.2, 0.5)  # hijau transparan
	soil.size = Vector2(60, 20)
	soil.position = Vector2(500, 350)
	soil.name = "SoilZone"
	add_child(soil)

# Fungsi ini akan dipanggil saat pemain tekan tombol "tanam"
func plant_seed_at(pos: Vector2):
	print("Benih ditanam di: ", pos)
	
	# Cek apakah posisi dekat tanah subur
	for child in get_children():
		if child.name == "SoilZone":
			var soil_pos = child.position
			if pos.distance_to(soil_pos) < 30:
				spawn_tree(soil_pos)
				child.queue_free()  # hapus tanah subur setelah ditanam
				extinguish_fire_near(soil_pos)
				return
	
	print("Tidak ada tanah subur di sini!")

func spawn_tree(pos: Vector2):
	var tree = Sprite2D.new()
	tree.color = Color(0.1, 0.8, 0.1)  # hijau cerah
	tree.custom_minimum_size = Vector2(30, 60)
	tree.position = pos
	tree.name = "GrownTree"
	add_child(tree)
	print("Pohon tumbuh!")

func extinguish_fire_near(center: Vector2):
	var radius = 100
	for child in get_children():
		if child.name == "Fire":
			if child.position.distance_to(center) < radius:
				child.queue_free()
				print("Api padam!")
