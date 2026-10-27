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

### The easy way: one command

You need [Node.js](https://nodejs.org) 22.20 or newer. Then run this in your terminal:

```bash
npx skills add yognrg/skill-compass
```

1. It asks which agents to install into. Pick yours (Claude Code, Codex, Cursor and many others are supported).
2. It copies Skill Compass into that agent's skills folder.
3. Restart your agent, then say **"skill compass"** in any chat.

Want it in every project instead of just the current one? Add `-g`:

```bash
npx skills add yognrg/skill-compass -g
```

To skip the menu and pick the agent yourself, add `-a`, for example `-a claude-code`.

> This uses the open [`skills`](https://github.com/vercel-labs/skills) installer, which downloads straight from GitHub. You do not need an npm account or a published package.

### Using a tool other than Claude Code?

The same command works for many agents. Add `-a` followed by your agent's name to install straight into it:

| Tool | Command |
| --- | --- |
| Codex | `npx skills add yognrg/skill-compass -a codex` |
| Cursor | `npx skills add yognrg/skill-compass -a cursor` |
| Gemini CLI | `npx skills add yognrg/skill-compass -a gemini-cli` |
| GitHub Copilot | `npx skills add yognrg/skill-compass -a github-copilot` |
| Windsurf | `npx skills add yognrg/skill-compass -a windsurf` |
| OpenCode | `npx skills add yognrg/skill-compass -a opencode` |
| Cline | `npx skills add yognrg/skill-compass -a cline` |
| Roo Code | `npx skills add yognrg/skill-compass -a roo` |
| Goose | `npx skills add yognrg/skill-compass -a goose` |
| Amp | `npx skills add yognrg/skill-compass -a amp` |

More are supported, including Continue, Kiro, Junie, Trae, Zed, Warp, Replit, Augment, Qwen Code and OpenHands. Run the command without `-a` to see the full menu, or install into several at once with `-a codex -a cursor`.

Two things to know:

* **The pick list looks different.** Claude shows a tick box popup. Other tools have no popup, so Skill Compass prints a numbered list and you reply with the numbers you want, like `1 3`.
* **Your tool must read `SKILL.md` skills.** The installer puts the folder in the right place, but a tool that does not load skills will not use it. Check your tool's docs if nothing happens.

### Other ways to install

Open the one that matches how you work.

<details>
<summary><strong>Claude Code plugin</strong> (two commands, inside Claude Code)</summary>

<br>

```
/plugin marketplace add yognrg/skill-compass
/plugin install skill-compass@skill-compass
```

Then type `/skill-compass`.

</details>

<details>
<summary><strong>Claude.ai or Claude Desktop</strong> (upload a zip)</summary>

<br>

1. Download `skill-compass.zip` from the [Releases page](https://github.com/yognrg/skill-compass/releases), or build it yourself with `./scripts/package.sh`.
2. Open **Settings**, then **Capabilities**, then **Skills**.
3. Choose **Upload skill** and pick the zip.
4. Turn it on, then say "skill compass" in any chat.

Menu names can change between app versions. If you cannot find them, search the app's help for "upload a skill".

</details>

<details>
<summary><strong>Copy it by hand</strong> (no Node.js needed)</summary>

<br>

Download or clone this repo, then copy the `skills/skill-compass` folder into your agent's skills folder:

| Agent | Everywhere (all projects) | This project only |
| --- | --- | --- |
| Claude Code | `~/.claude/skills/` | `.claude/skills/` |
| Codex | `~/.agents/skills/` | `.agents/skills/` |
| Other agents | The skills folder in your agent's docs | Same, inside your project |

Or let the included script do the copy:

```bash
git clone https://github.com/yognrg/skill-compass.git
cd skill-compass
./install.sh            # Claude Code, all projects
./install.sh --codex    # Codex, all projects
./install.sh --project  # Claude Code, this project only
./install.sh --dir PATH # any skills folder you choose
```

Restart your agent and say "skill compass".

</details>

### Check that it worked

Start a new chat and type `/skill-compass` or "which skills should I use for this?". You should see a short list of your installed skills to pick from. If not, restart the agent once and try again.

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

**Update:** run the same install command again to get the latest version.

```bash
npx skills add yognrg/skill-compass
```

Installed by hand? Run `git pull` and then `./install.sh` again. Plugin users run `/plugin marketplace update skill-compass`.

**Uninstall:** delete the folder.

```bash
rm -rf ~/.claude/skills/skill-compass
rm -rf ~/.agents/skills/skill-compass
```

If you installed it into one project, delete `.claude/skills/skill-compass` or `.agents/skills/skill-compass` inside that project instead. Plugin users run `/plugin uninstall skill-compass@skill-compass`.

---

## Repository layout

```
skill-compass/
├── skills/skill-compass/SKILL.md   the skill itself
├── .claude-plugin/                 Claude Code plugin and marketplace files
├── scripts/package.sh              builds the zip for Claude.ai
├── install.sh                      copy-it-for-me script (no Node.js needed)
├── docs/examples.md                example sessions
├── CONTRIBUTING.md
├── CHANGELOG.md
└── LICENSE
```

---

## FAQ

**Why is the install `npx skills add` and not an npm package?**
A skill is just a folder with a `SKILL.md` file. There is no code to build or publish, so there is nothing to put on npm. The open `skills` installer downloads the folder straight from GitHub and copies it into the right place for your agent. It needs Node.js only to run the installer. If you do not use Node.js, copy the folder by hand (see the install section).

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
