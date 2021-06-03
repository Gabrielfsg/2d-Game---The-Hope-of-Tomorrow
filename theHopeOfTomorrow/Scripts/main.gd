extends Node

var saude = 100
var score = 0 setget atualizar_score
var pre_inimigo = preload("res://Cenas/Enemy.tscn")
var lp = 0
var lp2 = 0
var pre_inimob = preload("res://Cenas/Enemob.tscn")
#var pre_mn = preload("res://Cenas/Menu.tscn")
#var next_level2 = pre_mn.instance()
var pre_potion = preload("res://Cenas/Potion.tscn")



func _ready():
	score=0   
	$Start.start()
	$som1.play()
	
	
	randomize()

func novo_jogo():
	pass
  
func _process(delta):
	lp = $Player.life
	get_node("Control/saude_bar").value =lp
	if lp <= 0:
		deadman()
		#get_tree().change_scene("res://Cenas/Menu.tscn")
		#dead(score)
		pass
	
	
	lp2 =  $Player.life2
	get_node("Control/bar2").value=lp2
	if lp2 <= 0:
		#dead(score)
		deadman()
		#get_tree().change_scene("res://Cenas/Menu.tscn")
	if lp2>100:
		lp2 = 100
	




	
	
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused == false:
			get_tree().paused = true
			$Pause/bg.visible = true
			var enemies2 = get_tree().get_nodes_in_group("quants")
			for enemy in enemies2:
				enemy.visible = false
		else:
			get_tree().paused = false
			$Pause/bg.visible = false
	if Input.is_action_just_pressed("despausar"):
		get_tree().paused = false
		$Pause/bg.visible = false


func pause():
	get_tree().set_pause(!get_tree().is_paused())
	
	if get_tree().is_paused():
		get_node("Pause/bg").show()
	elif !get_tree().is_paused():
		get_node("Pause/bg").hide()

func dead(score):
	#get_tree().set_pause(!get_tree().is_paused())
	
	#if get_tree().is_paused():
		#print("porra")
	if Game_const.testScore(score):
		get_node("CanvasLayer/janela_scoreBoard").show()
		get_node("CanvasLayer/janela_scoreBoard/lblPontos").set_text(str(score))
		printScoreboard()
		$Score.stop()
		$Player.visible = false
		$TimerEne.stop()
		$Control/saude_bar.visible =false
		$Control/bar2.visible =false
		$Pause/Label.visible = false
		$Pause/bg.visible = false
		$Pause/pause.visible = false
		$lbl_Score.visible = false
		$Controls/baixo.visible =false
		$Controls/cima.visible = false
		$Controls/shot.visible = false
	var enemies = get_tree().get_nodes_in_group("quants")
	for enemy in enemies:
		enemy.queue_free()





func printScoreboard(i=0):
	Game_const.load_scoreboard()
	var scoretxt = ""
	for key in Game_const.scoreBoard:
		for key2 in Game_const.scoreBoard[key]:
			
			if key =="names":
				scoretxt = str( Game_const.scoreBoard[key][key2], ": ", Game_const.scoreBoard["scores"][key2], "\n", scoretxt)
	if i == 1:
		get_node("CanvasLayer/janela_scoreBoard/btn_save").hide()
		get_node("CanvasLayer/janela_scoreBoard/lenome").hide()
		get_node("CanvasLayer/janela_scoreBoard/lbltitle").set_text("Melhores Jogadores:")
		get_node("CanvasLayer/janela_scoreBoard/lblnome").hide()
		get_node("CanvasLayer/janela_scoreBoard/lblpts").hide()
		get_node("CanvasLayer/janela_scoreBoard/lblPontos").hide()
		
	else:
		get_node("CanvasLayer/janela_scoreBoard/lenome").show()
		get_node("CanvasLayer/janela_scoreBoard/lbltitle").set_text("TOP 3!!!")
		get_node("CanvasLayer/janela_scoreBoard/lblnome").show()
		get_node("CanvasLayer/janela_scoreBoard/lblpts").show()
		get_node("CanvasLayer/janela_scoreBoard/lblPontos").show()
		get_node("CanvasLayer/janela_scoreBoard/btn_save").show()
	get_node("CanvasLayer/janela_scoreBoard/lbl_Score").set_text("")
	get_node("CanvasLayer/janela_scoreBoard/lbl_Score").set_text(scoretxt)
	scoretxt = ""





#func game_over():
	#$Score.stop()
	#$TimerEne.stop()
	#$Huid.game_over()

func _on_Start_timeout():
	$Score.start()
	$TimerEne.start()
	$TimerPotion.start()

func _on_TimerEne_timeout():
	
	print($TimerEne.wait_time)
	var enemyG = pre_inimigo.instance()
	enemyG.set_position(Vector2(1846, rand_range(698,135)))
	get_parent().add_child(enemyG)
	enemyG.add_to_group("quants")
	if $TimerEne.wait_time > .8:
		$TimerEne.wait_time -= .14
		$TimerEne.start()
	elif $TimerEne.wait_time < .8:
		$TimerEne.wait_time -= .0004

func _on_TimerPotion_timeout():
	
	print($TimerPotion.wait_time)
	var pre_Potion = pre_potion.instance()
	pre_Potion.set_position(Vector2(1846, rand_range(698,135)))
	get_parent().add_child(pre_Potion)
	pre_Potion.add_to_group("quants")
	if $TimerPotion.wait_time > 1.1:
		$TimerPotion.wait_time -= .07
		$TimerPotion.start()

func atualizar_score(score):
	$lbl_Score.text = str(score)


func _on_Score_timeout():
	score +=1
	atualizar_score(score)
	if score > scorefile.bestscore:
		scorefile.bestscore = score

																	 

func atualiza_saude(valor):
	saude = saude + valor
	var saude_bar = get_node("Control/saude_bar")
	var bar2 = get_node("Control/bar2")
	saude_bar.set_value(saude)
	verifica_fim_de_jogo()





func verifica_fim_de_jogo():
	if saude <=0:
		$Player.destroy()

func _on_Button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()

func deadman():
	var enemies = get_tree().get_nodes_in_group("quants")
	for enemy in enemies:
		enemy.queue_free()
	$Score.stop()
	$Player.visible = false
	$TimerEne.stop()
	$TimerPotion.stop()
	$Control/saude_bar.visible =false
	$Control/bar2.visible =false
	$Pause/bg.visible = false
	$Pause/pause.visible = false
	#$lbl_Score.visible = false
	$Controls/baixo.visible =false
	$Controls/cima.visible = false
	$Controls/shot.visible = false
	#$table_score.visible = false
	#get_tree().paused = true
	$MenuDead.visible = true






#func _on_irmenu_pressed():
	#get_tree().get_root().add_child(next_level2)



func _on_irmenu_released():
	pause()
	get_tree().change_scene("res://Cenas/Menu.tscn")
	var enemies = get_tree().get_nodes_in_group("quants")
	for enemy in enemies:
		 enemy.queue_free()


func _on_voltarjogo_released():
	get_tree().paused = false
	get_node("Pause/bg").hide()
	var enemies2 = get_tree().get_nodes_in_group("quants")
	for enemy in enemies2:
		enemy.visible = true


func _on_btnClose_released():
	get_node("CanvasLayer/janela_scoreBoard").hide()


func _on_btn_save_released():
	#var name = get_node("CanvasLayer/janela_scoreBoard/lenome").get_text()
	#var score = int(get_node("CanvasLayer/janela_scoreBoard/lblPontos").get_text())
	
	#Game_const.writeScore(name , score)
	
	#get_node("CanvasLayer/janela_scoreBoard").hide()
	pass



func _on_btn_save_pressed():
	var name = get_node("CanvasLayer/janela_scoreBoard/lenome").get_text()
	var score = int(get_node("CanvasLayer/janela_scoreBoard/lblPontos").get_text())
	
	Game_const.writeScore(name , score)
	
	get_node("CanvasLayer/janela_scoreBoard").hide()
	get_tree().change_scene("res://Cenas/Menu.tscn")
	pass













func _on_Potion_area_entered(area):
	$Player.life2+=35






func _on_p_again_pressed():
	get_tree().reload_current_scene()


func _on_p_menu_pressed():
	get_tree().change_scene("res://Cenas/Menu.tscn")
