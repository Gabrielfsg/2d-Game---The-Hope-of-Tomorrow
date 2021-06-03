 extends KinematicBody2D


const pre_bullet = preload("res://Cenas/bullet.tscn")
var chao = Vector2(64,720)
var chao2 = Vector2(2060,141)
var velocidade = Vector2()
var gravidade = 3000
var velocidadepulo = -1200
var modificador_gravidade = 0.5
var modificador_gravidade2 = 0.9
var time = 3
var prev_shot = false 
export var life = 100
export var life2 = 100
onready var init_life = life
onready var init_life2 = life2
var tamanho_tela
onready var game = get_node("/root/GAME")
signal rein


onready var mask = collision_mask
onready var layer = collision_layer

enum {PARA , CORRE , PULA , MORRE }
var status = CORRE

func _ready():
	tamanho_tela = get_viewport_rect().size





func _physics_process(delta):
	if status == CORRE:
		correr(delta)
	elif status == MORRE:
		morre(delta)
		emit_signal("rein")


func correr(delta):
	if Input.is_action_pressed("cima"):
		velocidade.y = -300
	elif Input.is_action_pressed("baixo"):
		velocidade.y = +350
	
	if Input.is_action_pressed("pular"):
		velocidade.y += gravidade * delta * modificador_gravidade
	
	else:
		velocidade.y +=gravidade * delta 
	
	if Input.is_action_just_pressed("pular") and position == chao:
		velocidade.y = velocidadepulo 
	 

	
	if Input.is_action_just_pressed("ui_shot"): #and not prev_shot and get_tree().get_nodes_in_group("bullet").size()==0:
		print("effjosf")
		if get_tree().get_nodes_in_group("bullet").size() < 5:
			var bullett = pre_bullet.instance()
			get_parent().add_child(bullett)
			bullett.global_position = $spawn_bullet.global_position
			$tiro.play()
	#prev_shot = Input.is_action_pressed("ui_shot")


	
	if position == chao:
		$AnimatedSprite.play("correr")
	else:
		$AnimatedSprite.play("pular")
	
	position += velocidade * delta
	
	velocidade = move_and_slide(velocidade, Vector2(0, -1))







	if get_position().y > chao.y :
		set_position(chao)
		velocidade = Vector2()

func morre(delta):
	$AnimatedSprite.play("morte")
	translate(velocidade * delta)
	velocidade.y += gravidade * delta



func _on_Timer_timeout():
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

func destroy():
	if status != MORRE:
		status = MORRE
		collision_mask = 0
		collision_layer = 0
		velocidade = Vector2(0, - 1000)
	   




func _on_Area2D_area_entered(area):
	life-=35


func _on_body2_area_entered(area):
	life2-=35








func _on_body3_area_entered(area):
	if life2 <100:
		life2+=35
	elif life2 >=100:
		life2+=0
	#if life2 ==100:
		#life2+=0
	pass # Replace with function body.
