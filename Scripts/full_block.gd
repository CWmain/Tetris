extends Node2D

@export var color: Color


func _ready():
	self.get_tree().get_root().get_child(0).moveBlocks.connect(_on_moveBlocks)
	self.get_tree().get_root().get_child(0).rotateRight.connect(_on_rotateRight)
	self.get_tree().get_root().get_child(0).rotateLeft.connect(_on_rotateLeft)
	for c in self.get_children():
		c.sprite_2d.modulate = color

func _on_moveBlocks():
	self.position.y += 32

func _on_rotateRight():
	self.rotation += PI/2

func _on_rotateLeft():
	self.rotation -= PI/2



