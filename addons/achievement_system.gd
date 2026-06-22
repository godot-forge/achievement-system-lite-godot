extends Node

const MAX_ACHIEVEMENTS: int = 10

signal achievement_unlocked(achievement_id: String)

var _achievements: Dictionary = {}

func define(achievement_id: String, title: String, description: String) -> bool:
	if _achievements.size() >= MAX_ACHIEVEMENTS and not _achievements.has(achievement_id):
		push_warning("Achievements Lite: max %d achievements. Upgrade to PRO." % MAX_ACHIEVEMENTS)
		return false
	_achievements[achievement_id] = {
		"title": title,
		"description": description,
		"unlocked": false,
		"unlock_time": 0,
	}
	return true

func unlock(achievement_id: String) -> bool:
	if not _achievements.has(achievement_id):
		return false
	if _achievements[achievement_id]["unlocked"]:
		return false
	_achievements[achievement_id]["unlocked"] = true
	_achievements[achievement_id]["unlock_time"] = Time.get_unix_time_from_system()
	emit_signal("achievement_unlocked", achievement_id)
	return true

func is_unlocked(achievement_id: String) -> bool:
	return _achievements.has(achievement_id) and _achievements[achievement_id]["unlocked"]

func reset(achievement_id: String) -> void:
	if _achievements.has(achievement_id):
		_achievements[achievement_id]["unlocked"] = false
		_achievements[achievement_id]["unlock_time"] = 0

func reset_all() -> void:
	for id in _achievements.keys():
		reset(id)

func get_info(achievement_id: String) -> Dictionary:
	if not _achievements.has(achievement_id):
		return {}
	return _achievements[achievement_id].duplicate()

func all_ids() -> Array:
	return _achievements.keys()

func unlocked_ids() -> Array:
	var result: Array = []
	for id in _achievements:
		if _achievements[id]["unlocked"]:
			result.append(id)
	return result

func completion_percent() -> float:
	if _achievements.is_empty():
		return 0.0
	return float(unlocked_ids().size()) / float(_achievements.size()) * 100.0

func save_state() -> Dictionary:
	var data: Dictionary = {}
	for id in _achievements:
		data[id] = {
			"unlocked": _achievements[id]["unlocked"],
			"unlock_time": _achievements[id]["unlock_time"],
		}
	return data

func load_state(data: Dictionary) -> void:
	for id in data:
		if _achievements.has(id):
			_achievements[id]["unlocked"] = data[id]["unlocked"]
			_achievements[id]["unlock_time"] = data[id]["unlock_time"]
