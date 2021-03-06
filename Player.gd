extends KinematicBody2D

const WALK_SPEED = 180
const GRAVITY = 40
const JUMPFORCE = -1100

var coins = 0

var velocity = Vector2.ZERO

func _physics_process(_delta):
	if Input.is_action_pressed('right'):
		velocity.x = WALK_SPEED
		$Sprite.play('walk')
		$Sprite.flip_h = false
	elif Input.is_action_pressed('left'):
		velocity.x = -WALK_SPEED
		$Sprite.play('walk')
		$Sprite.flip_h = true
	else:
		$Sprite.play('idle')
	if not is_on_floor():
		$Sprite.play('air')
	
	# gravity
	velocity.y += GRAVITY
	
	if Input.is_action_just_pressed('jump') and is_on_floor():
		velocity.y = JUMPFORCE
	
	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.x = lerp(velocity.x, 0, 0.2)
	
	if coins == 3:
		get_tree().change_scene("res://Level1.tscn")

func add_coin():
	coins += 1
	
