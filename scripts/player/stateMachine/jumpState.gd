extends PlayerState
class_name JumpState

static var stateName = "JUMP"

const JUMP_FORCE: float = 350.0
const JUMP_MAX_FORCE: float = 2000.0
const ACCELERATION: float = 20.0
const MAX_SPEED: float = 150.0
const STOP_FORCE: float = 5.0

var isJumping: bool = false

func getStateName() -> String:
	return stateName

func toEnter() -> void:
	if player.is_on_floor():
		player.velocity.y = -JUMP_FORCE
	isJumping = true

func toExit() -> void:
	isJumping = false

func process(_delta) -> void:
	player.animy.play("jump")

func phisics_process(_delta: float) -> void:
	var direction: float = player.direction*ACCELERATION
	if(player.is_on_floor() and isJumping):
		if direction == 0.0:
			stateMachine.transition(IdleState.stateName)
		else:
			stateMachine.transition(MovimentState.stateName)
		pass
	if abs(direction) < ACCELERATION * 0.2:
		player.velocity.x = move_toward(player.velocity.x, 0, STOP_FORCE)
	else:
		player.velocity.x += direction
	player.velocity.x = clamp(player.velocity.x, -MAX_SPEED, MAX_SPEED)
