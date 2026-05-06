# Agent Instructions

This repository contains my personal dotfiles. Any AI agents operating within this repository MUST adhere to the following mandates:

## 1. Zero-Trust Commits
**NEVER execute a `git commit` without explicit confirmation from the user.** All configuration changes must be applied locally, tested by the user, and verified to be working before they are committed to the repository.

## 2. Architecture via Symlinks
Any new tool or configuration added to this repository must follow the established symlink architecture:
*   Store the actual configuration file in a dedicated folder within `~/Projects/dotfiles/` (e.g., `~/Projects/dotfiles/alacritty/alacritty.toml`).
*   Update `scripts/install.sh` to create the necessary directories and symlink to the target destination in the user's home folder.
*   If the tool requires a non-brew installation step (curl script, git clone), add it to `scripts/bootstrap.sh`.
*   If the tool is installable via Homebrew, add it to `homebrew/Brewfile`.

## 3. Minimalism
Do not introduce unnecessary plugins, heavy frameworks, or bloated themes unless specifically requested. Strive for a fast, clean, and distraction-free terminal environment.

## 4. Commit Standards
When given permission to commit, use atomic commits with conventional prefixes (`feat:`, `fix:`, `style:`, `chore:`, etc.).
