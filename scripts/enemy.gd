extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(delta: float) -> void:
	if player_chase == true:
		position += (player.position - position).normalized() * speed * delta
		animated_sprite.play("walk")
		move_and_collide(Vector2(0,0))
		
		if (player.position.x - position.x) < 0:
			animated_sprite.flip_h = true
		else:
			animated_sprite.flip_h = false
	else:
		animated_sprite.play("idle")
		



func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false
