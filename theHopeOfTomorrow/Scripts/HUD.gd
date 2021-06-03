extends CanvasLayer

func _ready():
	GAME.connect("score_changed" , self , "on_score_changed")
	write_score()



func on_score_changed():
	write_score()


func write_score():
	$score_label.text = str(GAME.score)
	
