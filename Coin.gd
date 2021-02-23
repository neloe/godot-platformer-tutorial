extends Area2D



func _on_Coin_body_entered(body):
	$AnimationPlayer.play("bounce")
	body.add_coin()
