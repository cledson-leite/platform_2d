extends Node
class_name StateMachine

@export var isLogEnabled: bool = false

var currentState: StateInterface
var states: Dictionary = {}

var parentName: String

func startMachine(init_states: Array[StateInterface]) -> void:
	parentName = get_parent().name
	for state in init_states:
		states[state.getStateName()] = state

	currentState = init_states[0]
	if isLogEnabled: 
		print("[%s]: Entering state \"%s\"" % [parentName, currentState.getStateName()])
	currentState.toEnter()

func _process(delta: float) -> void:
	currentState.process(delta)
	
func _physics_process(delta: float) -> void:
	currentState.phisics_process(delta)

func transition(newStateName: String) -> void:
	var newState: StateInterface = states.get(newStateName)
	#var currentStateName: String = currentState.getStateName()
	
	if newState == null:
		push_error("An attempt has been made to transition to a non-existent state (%s)." % newStateName)
		
	elif newState != currentState:
		currentState.toExit()
		if isLogEnabled: 
			print("[%s]: Exiting state \"%s\"" % [parentName, currentState.getStateName()])
		currentState = states[newState.getStateName()]
		if isLogEnabled: 
			print("[%s]: Entering state \"%s\"" % [parentName, currentState.getStateName()])
		currentState.toEnter()
	else:
		push_warning("An attempt to transition to the current state has been made. Ignoring request.")
	
