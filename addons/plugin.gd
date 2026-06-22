@tool
extends EditorPlugin

func _enter_tree() -> void:
	add_autoload_singleton("Achievements", "res://addons/achievement_system_lite/achievement_system.gd")

func _exit_tree() -> void:
	remove_autoload_singleton("Achievements")
