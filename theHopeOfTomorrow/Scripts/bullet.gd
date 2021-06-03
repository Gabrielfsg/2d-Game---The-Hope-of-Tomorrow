extends Area2D

const SPEED = 800
var velocidade = Vector2()

func _ready():
	add_to_group("bullet")
	set_process(true)
	pass
	

func _physics_process(delta):
		velocidade.x = SPEED * delta
		translate(velocidade)
		#if get_global_position().x > 1020:
			#queue_free()



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_bullet_area_entered(area):
	if "Enemy" in area.name:
		area.dead()
		queue_free()



func _on_bullet_body_entered(body):
	if "Enemy" in body.name:
		body.dead()
		queue_free()

