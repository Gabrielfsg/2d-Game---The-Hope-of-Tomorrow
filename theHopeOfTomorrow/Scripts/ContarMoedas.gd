extends Node2D

var moedas = 0

func _ready():
	add_to_group("ContarMoedas")



func coin_coleted():
	moedas+=1
	update_label()

func update_label():
	$moedas.text = str(moedas)