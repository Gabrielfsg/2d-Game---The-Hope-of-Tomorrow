extends Node

const pre_coins = preload("res://Cenas/moedas.tscn")
var intervalo = 3

func _ready():
	set_process(true)



func _process(delta):
	if intervalo > 0:
		intervalo -= delta
	else:
		intervalo = rand_range(0.7,1.7)
		var coinns = pre_coins.instance()
		coinns.set_position(Vector2(1846, rand_range(698,135)))
		get_owner().add_child(coinns)
