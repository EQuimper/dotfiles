# Repository Guidelines

## Project Structure & Module Organization
- `aerospace/.aerospace.toml` stores workspace layouts and keybindings; keep comments concise so live reloads stay readable.
- `nvim/.config/nvim` contains the LazyVim setup: `init.lua`, `lua/config/` for core options, and `lua/plugins/` for feature modules locked by `lazy-lock.json`. Co-locate related snippets under `snippets/`.
- `sketchybar/.config/sketchybar` uses `colors.sh`, `icons.sh`, and `items/` plus `plugins/` for runtime scripts; mirror the existing item → plugin pairing.
- `tmux/.config/tmux/tmux.conf` and `plugins/` manage multiplexer behaviour; changes should remain compatible with the synced Neovim and WezTerm keymaps.
- `wezterm/.wezterm.lua` and `zsh/.zshrc` are single-file configs—document new environment variables inline.

## Build, Test, and Development Commands
- `nvim --headless "+Lazy! sync" +qa` ensures plugin definitions match the lockfile before committing.
- `nvim --headless "+checkhealth" +qa` surfaces Lua/runtime regressions introduced by config edits.
- `stylua nvim/.config/nvim/lua` formats Lua modules in place using `stylua.toml` (2-space indent, 120-column wrap).
- `tmux start-server \; source-file $PWD/tmux/.config/tmux/tmux.conf` validates tmux changes without restarting existing sessions.
- `wezterm start --config-file $PWD/wezterm/.wezterm.lua --skip-config` quickly lints the Lua config.

## Coding Style & Naming Conventions
- Lua: two-space indentation, double-quoted strings for plugin specs, and hyphenated filenames (e.g., `tmux-navigator.lua`) to match module intent.
- Bash (Sketchybar): keep associative arrays aligned with two spaces, source shared files via `$CONFIG_DIR`, and prefer uppercase constants (`WIFI_DISCONNECTED`).
- Shell paths should remain repository-relative so GNU Stow or manual symlinks stay stable across machines.

## Testing Guidelines
- Add or update Lua plugin files alongside targeted `snippets/` or `after/` hooks; verify with both headless commands above and a manual Neovim launch.
- For Sketchybar items/plugins, run `sketchybar --reload` and monitor logs via `sketchybar --debug` before pushing.
- When altering tmux or WezTerm shortcuts, test the same key sequence in each tool to avoid conflicts; document intentional divergences.

## Commit & Pull Request Guidelines
- Follow the existing short, imperative subject style (`add config to aerospace`, `fix tmux navigator`); include the affected tool up front.
- Group related config edits per tool to keep diffs reviewable; cross-tool changes should explain the linkage in the body.
- PRs should describe the motivation, list touched directories, and call out any manual post-merge steps (reload commands, plugin installs).

## Security & Configuration Tips
- Never commit machine-specific secrets or API tokens; reference expected environment variables in comments instead.
- Mask host-dependent paths behind variables in `wezterm` or `zsh` configs so contributors can override them locally without forking.
