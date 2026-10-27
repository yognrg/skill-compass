# Skill Compass

**Never forget which skills you have installed.**

Skill Compass is an agent skill that reads what you are working on, checks your installed skill library, shows a short pick list of the skills that fit, and then uses the ones you choose.

![License: MIT](https://img.shields.io/badge/license-MIT-blue.svg)
![Format: Agent Skills](https://img.shields.io/badge/format-SKILL.md-8A2BE2.svg)

---

## The problem

Skill libraries grow fast. A few weeks after installing them, most people cannot remember what they have, or which skill helps with which part of a project. Good skills sit unused.

## What Skill Compass does

1. **Reads your task** from your request and your project files.
2. **Checks your installed skills** and compares each one's "when to use" description with your task.
3. **Shows a pick list** of the best 3 to 8 matches, each with a one line reason.
4. **Runs your picks** in a sensible order: research first, building next, polish last.

You stay in control. Nothing runs until you choose.

```
You:   /skill-compass  I am building a landing page for a fintech app

Compass finds:
  1. frontend-design (Recommended)  distinctive UI, fits a landing page
  2. brand-guidelines               applies your brand colors and type
  3. accessibility-review           checks contrast and keyboard use
  4. ux-copy                        writes headlines and button text

You pick 1, 3 and 4. Compass loads them in order and gets to work.
```

---

## Install

Pick the tool you use. Every method installs the same skill.

### Claude Code

**Option A: plugin (easiest, updates with one command)**

Inside Claude Code, run:

```
/plugin marketplace add yognrg/skill-compass
/plugin install skill-compass@skill-compass
```

**Option B: copy the folder (personal, works in all your projects)**

```bash
git clone https://github.com/yognrg/skill-compass.git
cd skill-compass
./install.sh
```

Or by hand:

```bash
mkdir -p ~/.claude/skills
cp -R skills/skill-compass ~/.claude/skills/
```

**Option C: one project only (share it with your team through git)**

```bash
./install.sh --project
```

This copies the skill to `.claude/skills/skill-compass` in your current project. Commit it and your teammates get it too.

Restart your session, then type `/skill-compass`.

### Claude.ai and Claude Desktop

1. Build the zip: `./scripts/package.sh` (or download `skill-compass.zip` from the Releases page).
2. Open **Settings**, go to **Capabilities**, then **Skills**.
3. Choose **Upload skill** and select `skill-compass.zip`.
4. Turn it on, then say "skill compass" in any chat.

The exact menu names can change between app versions. If you do not see them, search the app's help for "upload a skill".

### Codex

```bash
git clone https://github.com/yognrg/skill-compass.git
cd skill-compass
./install.sh --codex
```

This copies the skill to `~/.agents/skills/skill-compass`. For one project only, copy `skills/skill-compass` into `.agents/skills/` inside that project. Restart Codex and ask for "skill compass".

Codex has no multiple choice popup, so Skill Compass prints a numbered list instead. Reply with the numbers you want.

### Any other agent that supports SKILL.md

Many coding agents read the same `SKILL.md` format. Copy the folder into the skills directory your agent documents:

```bash
./install.sh --dir /path/to/your/agent/skills
```

Then ask your agent to use "skill compass". If the agent has no popup tool, you get the numbered list.

---

## Use it

Any of these work:

| You say | What happens |
| --- | --- |
| `/skill-compass` | Reads the conversation and suggests skills for it |
| "Which skills should I use for this?" | Same, in plain words |
| "Skill compass: I need to analyze a sales export" | Matches skills to the task you describe |
| "What skills do I have?" | Lists your installed skills by category, no task needed |

Tips:

* Describe the deliverable (a deck, a dashboard, a contract review) for sharper matches.
* If you pick nothing, Compass stops and asks whether to continue without skills.
* Ask Compass to remind you how to call a skill directly, so you can skip it next time.

More worked examples are in [docs/examples.md](docs/examples.md).

---

## How it picks skills

Compass reads each installed skill's `description`, which says when the skill should be used. It scores each skill on three things:

* **Deliverable fit:** does it produce what you are making?
* **Domain fit:** is it about your field (design, sales, data, legal, writing)?
* **Action fit:** does it do what you want done (write, analyze, review, design)?

It keeps only strong matches and never forces a weak one. If two skills do the same job, it suggests the better fit.

Compass finds your skills in this order: the skill list the agent already shows, any skill search tools, and finally a scan of the usual skills folders (`.claude/skills`, `~/.claude/skills`, `.agents/skills`, `~/.agents/skills`).

---

## Update and uninstall

**Update:** pull the latest version and run the installer again. It replaces the old copy.

```bash
git pull
./install.sh
```

Plugin users run `/plugin marketplace update skill-compass`.

**Uninstall:** delete the folder.

```bash
rm -rf ~/.claude/skills/skill-compass
rm -rf ~/.agents/skills/skill-compass
```

Plugin users run `/plugin uninstall skill-compass@skill-compass`.

---

## Repository layout

```
skill-compass/
├── skills/skill-compass/SKILL.md   the skill itself
├── .claude-plugin/                 Claude Code plugin and marketplace files
├── scripts/package.sh              builds the zip for Claude.ai
├── install.sh                      one command installer
├── docs/examples.md                example sessions
├── CONTRIBUTING.md
├── CHANGELOG.md
└── LICENSE
```

---

## FAQ

**Does it send my data anywhere?**
No. It is plain instructions. It only reads the skill list and your project context that your agent already has.

**Will it run skills without asking?**
No. It always shows the pick list first. Your selection is the go ahead.

**Why did it not find a skill I know I have?**
Restart your session so the agent reloads its skills, then run Compass again. If the skill lives in a custom folder, tell Compass where to look.

**Can I change how it behaves?**
Yes. Edit `skills/skill-compass/SKILL.md`. For example, change how many matches it shows or the order skills run in.

---

## Contributing

Ideas and fixes are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

[MIT](LICENSE) © 2026 Yog Urkundwar
