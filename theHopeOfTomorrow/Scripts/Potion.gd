extends KinematicBody2D


var velocity =Vector2 (-500, 0)

func _ready():
	randomize()

func _physics_process(delta):
	set_position(position + velocity * delta)

#func _on_Potion_area_entered(area):
	#if $Player.life2 <100:
		#$Player.life2+=35
	#if $Player.life2 >=100:
		#$Player.life2+=0


















func _on_corpo_area_entered(area):
	queue_free()
