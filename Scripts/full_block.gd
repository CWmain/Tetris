extends Node2D

@export var color: Color
var blockedDown: bool = false
var blockedLeft: bool = false
var blockedRight: bool = false

#Signal to the blocks to detect collisions
signal processBlocks

func _ready():
	for c in self.get_children():
		c.sprite_2d.modulate = color
		c.blockedDown.connect(_on_blockedDown)
		c.blockedLeft.connect(_on_blockedLeft)
		c.blockedRight.connect(_on_blockedRight)
		c.blockedUp.connect(_on_blockedUp)

func _physics_process(delta):
	
	if Input.is_action_just_pressed("left"):
		processBlocks.emit()
		_on_moveLeft();
	if Input.is_action_just_pressed("right"):
		processBlocks.emit()
		_on_moveRight();
	if Input.is_action_just_pressed("speedUp"):
		processBlocks.emit()
		_on_moveBlocks()
	if Input.is_action_just_pressed("rotateLeft"):
		processBlocks.emit()
		_on_rotateLeft()
	if Input.is_action_just_pressed("rotateRight"):
		processBlocks.emit()
		_on_rotateRight()
	pass


func _on_blockedDown(value):
	print("DOWN emit %s" % value)
	if (snapped(rotation, 1) == snapped(PI/2,1)):
		blockedLeft = value
	if (snapped(rotation, 1) == snapped(((3*PI)/2),1)):
		blockedRight = value
	if (snapped(rotation, 1) == 0):
		blockedDown = value

func _on_blockedLeft(value):
	print("LEFT emit %s" % value)
	if (snapped(rotation, 1) == 0):
		blockedLeft = value
	if (snapped(rotation, 1) == snapped(PI,1)):
		blockedRight = value
	if (snapped(rotation, 1) == snapped(((3*PI)/2),1)):
		blockedDown = value
	
func _on_blockedRight(value):
	print("RIGHT emit %s" % value)
	if (snapped(rotation, 1) == snapped(PI,1)):
		blockedLeft = value
	if (rotation == 0):
		blockedRight = value
	if (rotation == PI/2):
		blockedDown = value
	
func _on_blockedUp(value):
	print("UP emit %s" % value)
	if (snapped(rotation, 1) == snapped((PI/2),1)):
		blockedRight = value
	if (snapped(rotation, 1) == snapped(PI,1)):
		blockedDown = value
	if (snapped(rotation, 1) == snapped(((3*PI)/2),1)):
		blockedLeft = value
	

func _on_moveBlocks():
	if (blockedDown):
		print("Can't move")
		return

	self.position.y += 32

func _on_rotateRight():
	self.rotation += PI/2
	if self.rotation == 2*PI:
		self.rotation = 0


func _on_rotateLeft():
	self.rotation -= PI/2
	if self.rotation < 0:
		self.rotation += 2*PI

func _on_moveLeft():
	self.position.x -= 32
	print("Unblock Down")
	blockedDown = false
	
func _on_moveRight():
	self.position.x += 32
	print("Unblock Down")
	blockedDown = false
