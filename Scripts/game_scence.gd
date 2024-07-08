extends Node2D

signal moveBlocks
signal shiftBlocks
signal rotateLeft
signal rotateRight
signal moveLeft
signal moveRight


func _process(delta):
	if Input.is_action_just_pressed("speedUp"):
		moveBlocks.emit()
	if Input.is_action_just_pressed("rotateLeft"):
		rotateLeft.emit()
	if Input.is_action_just_pressed("rotateRight"):
		rotateRight.emit()
	pass


