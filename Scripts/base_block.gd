extends Node2D

@onready var sprite_2d = $Sprite2D

var locked: bool = false

func _ready():
	self.get_tree().get_root().get_child(0).moveBlocks.connect(_on_moveBlocks)
	

func move():
	#If locked then it can not move
	if locked:
		pass
	self.position.y += 32

func clear():
	self.queue_free()

func _on_moveBlocks():
	move()
