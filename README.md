# Achievement System Lite — Godot 4

Free Godot 4 addon for tracking achievements: unlock events, progress, tiers, categories, and save/load.

## Features (Lite — Free)

- Up to **10 achievements**
- `define()` achievements with title, description, category, tier, and required progress
- `unlock()` / `is_unlocked()` / `reset()` / `reset_all()`
- Progress-based unlocking via `advance_progress()` / `set_progress()`
- `completion_percent()` — overall progress
- `save_state()` / `load_state()` — persist across sessions
- Signal `achievement_unlocked(id)`

## Quick Start

```gdscript
# Autoload: Achievements
Achievements.define("first_blood", "First Blood", "Kill your first enemy")
Achievements.unlock("first_blood")   # emits achievement_unlocked signal
Achievements.is_unlocked("first_blood")  # true
```

## Installation

1. Copy `addons/achievement_system_lite/` into your project's `addons/` folder
2. Enable in **Project → Project Settings → Plugins**
3. An `Achievements` autoload is added automatically

## Upgrade to PRO

[Achievement System PRO](https://godot-forge.itch.io/achievement-system-pro-godot) adds:
- Unlimited achievements
- 4-tier system (Bronze/Silver/Gold/Platinum)
- Hidden achievements
- Categories filter
- Stat tracking (`track_stat` / `get_stat`)
- `tier_completed` signal

---
Made with ♥ by [GodotForge](https://itch.io/profile/godot-forge)
