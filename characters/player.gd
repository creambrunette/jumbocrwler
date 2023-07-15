extends CharacterBody2D

@export var speed = 400
@onready var anim = $AnimationPlayer

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	if input_direction[0] == 1:
		anim.play("side")
		$AnimatedSprite2D.flip_h = true
	elif input_direction[0] == -1:
		anim.play("side")
		$AnimatedSprite2D.flip_h = false
	elif input_direction[1] == 1:
		anim.play("front")
	elif input_direction[1] == -1:
		anim.play("back")
	velocity = input_direction * speed

func _physics_process(_delta):
	get_input()
	move_and_slide()
