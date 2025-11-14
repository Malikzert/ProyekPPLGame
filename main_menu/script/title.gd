extends Label

var start_pos: Vector2
var target_pos: Vector2
var duration := 1.0  # durasi animasi dalam detik
var elapsed := 0.0
var animating := true

func _ready():
	# simpan posisi akhir (target)
	target_pos = position
	
	# mulai sedikit lebih tinggi dan transparan
	start_pos = position - Vector2(0, 30)
	position = start_pos
	modulate.a = 0.0  # alpha 0 = transparan
	
	# mulai animasi
	set_process(true)

func _process(delta):
	if animating:
		elapsed += delta
		var t = clamp(elapsed / duration, 0, 1)
		
		# Interpolasi posisi dan transparansi (smooth)
		position = start_pos.lerp(target_pos, t)
		modulate.a = lerp(0.0, 1.0, t)
		
		# Hentikan setelah selesai
		if t >= 1.0:
			animating = false
			set_process(false)
