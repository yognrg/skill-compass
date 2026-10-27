# Contributing

Thanks for helping improve Skill Compass.

## Ways to help

* **Report a problem:** open an issue with your agent (Claude Code, Codex, and so on), the task you gave, and what Compass suggested versus what you expected.
* **Suggest an improvement:** open an issue describing the use case before sending a large change.
* **Fix or improve the skill:** send a pull request.
* **Add install steps for another agent:** add a section to the README with the exact skills folder path and a link to that agent's docs.

## Editing the skill

The whole skill is one file: `skills/skill-compass/SKILL.md`.

Keep these rules:

1. The frontmatter needs `name` and `description`. The name must match the folder name.
2. The `description` says when to use the skill. Keep it under 1024 characters.
3. Keep instructions agent neutral. If you mention a Claude only tool, add a fallback for agents without it.
4. Keep the pick list step intact: the user must always choose before anything runs.
5. Write in plain, short sentences.

## Testing a change

Install your edited copy and try at least these cases:

* A clear task with several matching skills
* A vague request (it should ask one question)
* A task with no matching skill (it should say so, not force a match)
* A request to list installed skills with no task
* An agent without a popup tool (it should print a numbered list)

```bash
./install.sh --dir /tmp/compass-test
```

## Pull requests

* Keep each pull request focused on one change.
* Describe what you tested and in which agent.
* Update `CHANGELOG.md` under "Unreleased".
