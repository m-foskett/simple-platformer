extends Area2D




func _on_body_entered(body):
	# If the player is interacting with this
	if body.name == "Player":
		# Add to the global gold variable
		Game.gold += 20
		# Save the game state
		Utils.saveGame()
		# Create Tweens
		var tweenP: Tween = get_tree().create_tween()
		var tweenV: Tween = get_tree().create_tween()
		# Tween Duration
		var duration: float = 0.5
		# Property to tween: position
		var property: NodePath = "position"
		# Final Value
		var finalVal: Variant = position - Vector2(0, 30)
		# Tween the position
		tweenP.tween_property(self, property , finalVal, duration)
		# Property to tween: visibility
		property = "modulate:a"
		# Final Value
		finalVal = 0
		# Tween Duration
		duration = 0.2
		# Tween the visibility
		tweenV.tween_property(self, property , finalVal, duration)
		# Callback from tween: queue_free
		tweenP.tween_callback(queue_free)
