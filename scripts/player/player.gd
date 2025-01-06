extends CharacterBody2D
class_name Player

@onready var animy: AnimatedSprite2D = $animy
@onready var stateMachine: Node = $stateMachine

var direction: float = 0.0

func _ready() -> void:
	var states: Array[StateInterface] = [IdleState.new(self), MovimentState.new(self), JumpState.new(self)]
	stateMachine.startMachine(states)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
		stateMachine.transition(JumpState.stateName)
	direction = Input.get_axis("left", "right")
	handleFlip()
	move_and_slide()
	
func handleFlip() -> void:
	if direction == 1:
		animy.flip_h = false
	elif direction == -1:
		animy.flip_h = true
#Variaveis de Fisica

#const GRAVITY: float = 300.0
#const JUMP_FORCE: float = -150.0
#const MAX_JUMPS: int = 1
#
#var moveSpeed: float = RUNS_SPEED
#var moveDirectioX: int = 0	
#var jumps: int = 0
#var facing: int = 1
#
##Variaveis de Input
#var Up: bool = false
#var down: bool = false
#var left: bool = false
#var right: bool = false
#var jump: bool = false
#var jumpPressed: bool = false

#const WALK_SPEED: float = 150.0
#const RUN_SPEED: float = 250.0
#const ACCELERATION: float = 0.1
#const DECELERATION: float = 0.1
#const JUMP_VELOCITY: float = -300.0
#const DECELERATION_JUMP: float = 0.5
#const DASH_SPEED: float = 1000.0
#const DASH_DISTANCE: float = 300.0
#const DASH_COOLDOWN: float = 1.0
#@export var dash_curve: Curve
#
#var is_dashing: bool = false
#var dash_start_position: int = 0
#var dash_direction: int = 0
#var dash_time: int = 0
#
#
#func _physics_process(delta: float) -> void:
	## Add the gravity.
	#if not is_on_floor():
		#velocity += get_gravity() * delta
	#
	#var ancor: bool = is_on_floor() or is_on_wall()
#
	## Handle jump.
	#if Input.is_action_just_pressed("jump") and ancor:
		#velocity.y = JUMP_VELOCITY
		#
	#if Input.is_action_just_released("jump") and velocity.y < 0:
		#velocity.y *= DECELERATION_JUMP
		#
	#var speed: float
#
	#if Input.is_action_pressed("run"):
		#speed = RUN_SPEED
	#else:
		#speed = WALK_SPEED
#
	## Get the input direction and handle the movement/deceleration.
	## As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("left", "right")
	#if direction:
		#velocity.x = move_toward(velocity.x, direction*speed, speed*ACCELERATION)
	#else:
		#velocity.x = move_toward(velocity.x, 0, speed*DECELERATION)
#
##dash activation
	#var condition: bool = direction and not is_dashing and dash_time <= 0
	#if Input.is_action_just_pressed("dash") and condition:
		#is_dashing = true
		#dash_start_position = position.x
		#dash_direction = direction
		#dash_time = DASH_COOLDOWN
##perform atual dash
	#if is_dashing:
		#var current_distance: int = abs(position.x - dash_start_position)
		#if current_distance >= DASH_DISTANCE or is_on_wall():
			#is_dashing = false
		#else:
			#velocity.x = dash_direction * DASH_SPEED * dash_curve.sample(current_distance/DASH_DISTANCE)
			#velocity.y = 0
##Reduce the dash time
	#if dash_time > 0:
		#dash_time -= delta
	#move_and_slide()
