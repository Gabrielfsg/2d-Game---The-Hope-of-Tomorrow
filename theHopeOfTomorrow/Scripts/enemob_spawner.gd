extends Node

#const pre_enemob = preload("res://Cenas/Enemob.tscn")
#var intervalo = 2

#func _ready():
	#set_process(true)
	#pass


#func _process(delta):
	
	#if intervalo > 0:
		#intervalo -= delta
	#else:
		#intervalo = rand_range(1.5,2.6)
		#var enemyob = pre_enemob.instance()
		#enemyob.set_position(Vector2(1846, rand_range(698,135)))
		#get_owner().add_child(enemyob)
