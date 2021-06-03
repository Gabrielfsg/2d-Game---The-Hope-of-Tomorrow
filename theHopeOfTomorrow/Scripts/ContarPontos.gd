extends Node2D

var score_label = 0
func _ready():
	add_to_group("ContarPontos")
	

func ponto_coletado():
	score_label+=10
	update_label()


func update_label():
	$score_label.text = str(score_label)