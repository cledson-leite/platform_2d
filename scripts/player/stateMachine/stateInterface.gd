class_name StateInterface

#metodo para iniciar variaveis ao entrar no estado
func toEnter() -> void:
	pass

#metodo para finalizar variaveis ao sai do estado
func toExit() -> void:
	pass

#escolher um nome mais declarativo
func process(_delta: float) -> void:
	pass


#escolher um nome mais declarativo
func phisics_process(_delta: float) -> void:
	pass

func getStateName() -> String:
	push_error("Method getStateName() must be defined")
	return ""
