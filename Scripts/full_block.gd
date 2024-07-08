extends Node2D

@export var color: Color


func _ready():
	self.get_tree().get_root().get_child(0).moveBlocks.connect(_on_moveBlocks)
	self.get_tree().get_root().get_child(0).rotateRight.connect(_on_rotateRight)
	self.get_tree().get_root().get_child(0).rotateLeft.connect(_on_rotateLeft)
	for c in self.get_children():
		c.sprite_2d.modulate = color

func _physics_process(delta):
	if Input.is_action_just_pressed("left"):
		_on_moveLeft();
	if Input.is_action_just_pressed("right"):
		_on_moveRight();
	pass

func _on_moveBlocks():
	self.position.y += 32

func _on_rotateRight():
	self.rotation += PI/2

func _on_rotateLeft():
	self.rotation -= PI/2

func _on_moveLeft():
	self.position.x -= 32
	
func _on_moveRight():
	self.position.x += 32



