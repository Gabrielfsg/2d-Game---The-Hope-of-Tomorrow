extends CanvasLayer

signal start_game

#var pre_play = preload("res://Cenas/main.tscn")
#var next_level = pre_play.instance()
var new_scene
var current_scene

func _ready():
	$som.play()
	pass

func mostra_msg(text):
	$mensagem.text = text
	$mensagem.show()
	$tempo.start()

#func game_over():
	#mostra_msg("Game Over")
	#yield($tempo, "timeout")
	#get_tree().paused == true
	#$btn_play.show()
	#$mensagem.text = "The \n HOPE OF \n TOMORROW"
	#$mensagem.show()

#func atualizar_score(score):
	#$LBscore.text= str(score)


#func _on_btn_play_pressed():
#	$btn_play.hide()
#	$mensagem.hide()
#	mostra_msg("Prepare-se")
#	get_tree().get_root().add_child(next_level)
#	emit_signal("start_game")
#	$bt_ponto.hide()




func _on_tempo_timeout():
	$mensagem.hide()


func _on_bt_ponto_pressed():
	#$Janela/janela_scoreBoard.visible=true
	$bt_ponto.visible = false
	$btn_play.visible = false
	$mensagem.visible = false
	pass


func _on_btn_lock_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_btn_play_released():
	mostra_msg("Prepare-se")
	get_tree().change_scene("res://Cenas/main.tscn")
	


func _on_bt_ponto_released():
	pass # Replace with function body.


func _on_btnClose_released():
	$lbl_Score.visible = true
	$table_score.visible = true
	$btn_play.visible = true
	$btn_quit.visible = true
	$mensagem.visible =true
	$Janela_sobre/janela_sobre.visible = false
	$btnsobre.visible=true



func _on_btn_quit_pressed():
	get_tree().quit()


func _on_btn_sobre_pressed():
	$Janela_sobre/janela_sobre.visible = true
	$lbl_Score.visible = false
	$table_score.visible = false
	$btn_play.visible = false
	$btn_quit.visible = false
	$mensagem.visible =false
	$btnsobre.visible = false


