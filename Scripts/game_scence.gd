extends Node2D

signal moveBlocks
signal rotateLeft
signal rotateRight

func _process(delta):
	if Input.is_action_just_pressed("speedUp"):
		moveBlocks.emit()
	if Input.is_action_just_pressed("rotateLeft"):
		rotateLeft.emit()
	if Input.is_action_just_pressed("rotateRight"):
		rotateRight.emit()
	pass
