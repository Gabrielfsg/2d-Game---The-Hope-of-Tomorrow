extends Sprite



func _ready():
	pass 

func printScoreboard():
	Game_const.load_scoreboard()
	
	var scoretxt = ""
	for key in Game_const.scoreBoard:
		for key2 in Game_const.scoreBoard[key]:
			
			if key =="names":
				scoretxt = str( Game_const.scoreBoard[key][key2], ": ", Game_const.scoreBoard["scores"][key2], "\n", scoretxt)
	get_node("lenome").hide()
	get_node("btn_save").hide()
	get_node("lblPontos").hide()
	get_node("lblpts").hide()
	get_node("lbltitle").set_text("Best Players:")
	get_node("lblnome").hide()
	get_node("lbl_Score").set_text("")
	print(scoretxt)
	get_node("lbl_Score").set_text(scoretxt)
	scoretxt = ""
	






func _on_btnClose_released():
	hide()


func _on_bt_ponto_released():
	show()
	printScoreboard()




func _on_btnClose_pressed():
	hide()
