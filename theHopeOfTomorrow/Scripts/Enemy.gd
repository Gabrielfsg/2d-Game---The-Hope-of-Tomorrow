extends Area2D

#var chao = Vector2(1392,19)
var velocidade =Vector2 (-450, 0)
var is_dead = false
onready var game = get_node("/root/GAME")


func _ready():
	randomize()
	$AnimatedSprite.play()
	

func dead():
	is_dead = true
	velocidade = Vector2(0,0)
	$AnimatedSprite.play("dead")
	game.add_score(10)
	$Timer.start()
	


func _physics_process(delta):
	if is_dead == false:
		set_position(position + velocidade * delta)
		$AnimatedSprite.play("voando")
	








func _on_Timer_timeout():
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()




func _on_Enemy_body_entered(body):
	#var pai = get_parent()
	#pai.atualiza_saude(-34)
	#self.hide()
	self.queue_free()



#body.destroy()



func _on_Area2D_area_entered(area):
	queue_free()

