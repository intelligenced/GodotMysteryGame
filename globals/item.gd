extends "res://globals/interactive.gd"

export(String,FILE) var events_path = ""

var event_table = {}

func interact(params):
	if "use" in event_table and !is_hidden():
		vm.run_event(event_table.use, {})

func _input(ev):
	if ev.is_action_pressed("use") and vm.can_interact():
		if has_node("Area2D") and get_node("Area2D").get_overlapping_areas().has(vm.game.current_player.get_node("area")):
			interact(null)

func _ready():
	if has_node("Area2D"):
		set_process_input(true)

	if events_path != "":
		event_table = vm.compile(events_path)