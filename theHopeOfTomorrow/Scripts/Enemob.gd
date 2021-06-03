extends Area2D

var velocity =Vector2 (-1000, 0)
var is_dead = false
onready var game = get_node("/root/GAME")


func _ready():
	randomize()


func dead():
	is_dead = true
	velocity = Vector2(0,0)
	$AnimatedSprite.play("dead")
	$shape.disabled = true
	game.add_score(10)
	$Timer.start()
	


func _physics_process(delta):
	if is_dead == false:
		
		set_position(position + velocity * delta)
		pass
	




#func _on_Enemob_body_entered(body):
	#var pai = get_parent()
	#pai.atualiza_saude(-101)
	#self.hide()
	#self.queue_free()
	
