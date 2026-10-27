# Changelog

All notable changes are listed here. The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## [Unreleased]

### Changed
* Pick list options now explain what each skill is for, what you get, and how it differs from overlapping options, so choosing needs no guesswork.
* README install section rewritten around one command, `npx skills add yognrg/skill-compass`, with other methods in collapsible sections.
* Added a FAQ entry explaining why there is no npm package.

## [1.0.0] 2026-10-27

### Added
* First release of the Skill Compass skill.
* Skill discovery from the session skill list, skill search tools, or skill folders on disk.
* Ranked pick list with multiple selection, falling back to a numbered list in agents without a popup tool.
* Ordered execution of the selected skills.
* Claude Code plugin and marketplace files.
* `install.sh` for Claude Code, Codex, project level, and custom folders.
* `scripts/package.sh` to build a zip for Claude.ai and Claude Desktop.
