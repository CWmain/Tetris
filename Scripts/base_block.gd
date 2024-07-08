extends Node2D


var locked: bool = false
@onready var sprite_2d = $Sprite2D

@onready var Dup = $Detections/Up
@onready var Ddown = $Detections/Down
@onready var Dleft = $Detections/Left
@onready var Dright = $Detections/Right

@export_subgroup("Detection")
@export var up :bool = true
@export var down :bool = true
@export var left :bool = true
@export var right :bool = true

func _ready():
	self.get_tree().get_root().get_child(0).shiftBlocks.connect(_on_shiftBlocks)
	
	# Enable / Disable raycasts
	Dup.enabled = up
	Ddown.enabled = down
	Dleft.enabled = left
	Dright.enabled = right

	pass

func _physics_process(delta):

	if Ddown.is_colliding():

		print("Under")
		print(Ddown.get_collider())
	pass

func move():
	#If locked then it can not move
	if locked:
		pass
	#self.position.y += 32

func clear():
	self.queue_free()

func _on_shiftBlocks():
	move()

