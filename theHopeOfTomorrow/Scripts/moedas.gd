extends Area2D

var chao = Vector2(1207,901)
var velocidade =Vector2 (-500, 0)
var preMain = preload("res://Cenas/Player.tscn")

func _ready():
	randomize()
	$sprite.play("efeito")

func _physics_process(delta):
	set_position(position + velocidade * delta)


func _on_moedas_body_entered(body):
	$fx.play()
	$sprite.visible = false
	collision_mask = 0
	$queue_timer.start()
	get_tree().call_group("ContarMoedas" , "coin_coleted")





func _on_queue_timer_timeout():
	queue_free()




 




