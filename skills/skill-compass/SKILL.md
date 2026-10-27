---
name: skill-compass
description: Use when the user asks which skills to use, wants help finding the right installed skill for the current project or task, or says "skill compass". Reads the task, checks the installed skill library, shows a short pick list of matching skills, then loads and uses the ones the user selects.
---

# Skill Compass

People forget which skills they have installed and where those skills help. Skill Compass reads the task, checks the installed skill library, shows a short list of recommended skills, and after the user confirms, loads and uses the selected ones.

## When to use

Use this skill when the user:

- Asks "which skills should I use", "what skills do I have for this", or "find me a skill for this".
- Calls it by name: "skill compass" or `/skill-compass`.
- Starts or continues a project and asks what could help.

Do not use it for ordinary work requests where the user already named the task and no skill choice is needed. If the user names a specific skill, load that skill directly instead.

## Workflow

### Step 1: Understand the task

1. Read the user's latest request and the recent conversation.
2. Look at the project context: attached files, file types in the working directory, and any named project or deliverable (deck, document, dashboard, landing page, email, analysis, and so on).
3. Write a one line summary of the goal for yourself. If the goal is genuinely unclear, ask one short question in plain text, then continue. Never ask more than one.

### Step 2: Check the installed skill library

Use the first source that works:

1. **The skill listing already in the session.** Most agents show every installed skill with a one line description. Read it.
2. **Skill search tools.** If tools such as ListSkills or SearchSkills are available (some are deferred and must be loaded first), use them to refresh the list and search by keywords from the task.
3. **The file system.** If neither is available, scan these folders for `SKILL.md` files and read the `name` and `description` from each frontmatter block:
   - `.claude/skills/` and `~/.claude/skills/`
   - `.agents/skills/` and `~/.agents/skills/`
   - Any other skills folder the current agent documents.

Treat each skill's description as its "when to use" rule. Match against that text, not against the skill name alone. Skip this skill (`skill-compass`) itself in the results.

### Step 3: Match and rank

1. Score each candidate on three things: fit to the deliverable, fit to the domain, and fit to the action the user wants (write, analyze, review, design, and so on).
2. Keep the strongest 3 to 8 matches. Drop weak matches rather than padding the list.
3. Where two skills do the same job, keep the better fit and mention the other in one phrase.
4. For each kept skill, prepare a plain language card with these parts:
   - **Name:** the skill name exactly as listed.
   - **Use it for:** the situation it helps with, in the user's own terms (for example "writing the headlines and button text").
   - **You get:** the result the user will see (for example "a finished, mobile friendly page").
   - **Pick this one if / skip it if:** only when it overlaps with another option or is easy to confuse with one. Say what makes them different.
   - **Needs:** a flag if it requires a connector or tool that is not available.
5. Write each card from the skill's real description. If the description is vague or the skill has a cryptic name, read the top of its `SKILL.md` before writing. Never invent abilities, and never paste the description word for word.
6. Plan the run order: research and data skills first, building and formatting skills next, review and polish skills last.
7. If nothing fits, say so plainly, name the closest one or two options, and offer to continue without a skill. Never force a match.

### Step 4: Show the pick list

The goal is that the user can choose without opening anything or guessing what a skill does. Every option must answer three questions: what is it for, what will I get, and how is it different from the other options.

**Writing the descriptions**

- Start with the situation, then the result: "Use for X. You get Y."
- Keep each popup description to one line, about 110 characters or fewer. Cut filler words first.
- Use plain words. Replace jargon with what the user will notice ("checks text is readable and buttons work with a keyboard", not "WCAG audit").
- When two options overlap, add the difference ("Pick this for the full page. The other only writes text.").
- If the skill name is cryptic, the description carries the meaning.

**If the agent has a multiple choice question tool** (for example AskUserQuestion in Claude, loading it first if it is deferred):

- Turn on multiple selection so the user can tick several skills.
- The question text restates the goal and the run order in one sentence, for example: "For your fintech landing page, which skills should I use? They run in this order: copy, build, review."
- Use the skill name as each option label. Use the "Use for X. You get Y." line as its description.
- A call holds at most 4 questions with at most 4 options each. With more than 4 matches, group them by purpose ("Research and data", "Build", "Review and polish") and use one question per group.
- Put the best fit first and add "(Recommended)" to its label.
- The user can type their own answer, so do not add a catch all option. Submitting with nothing selected means skip.

Example options:

```
frontend-design (Recommended)
  Use for the page layout, type and look. You get a finished responsive page.
design:ux-copy
  Use for headlines, buttons and short text. You get ready to paste wording.
design:accessibility-review
  Use after building. You get a list of readability and keyboard problems to fix.
```

**If no question tool exists**, print a numbered list with a short card for each skill and ask the user to reply with the numbers they want, or "all", or "none":

```
Skill Compass found these for your landing page. They run in this order.

1. design:ux-copy
   Use it for: headlines, buttons and short text
   You get: wording ready to paste into the page

2. frontend-design (Recommended)
   Use it for: the layout, type and visual style
   You get: a finished, responsive page

3. design:accessibility-review
   Use it for: checking the page after it is built
   You get: a list of readability and keyboard problems to fix
   Skip it if: you only need a rough draft

Reply with numbers (for example "1 3"), "all", or "none".
```

In both cases, mention missing requirements next to the skill so the user decides with full information. Submitting or replying is the go ahead. Never ask for confirmation twice.

### Step 5: Act on the answer

1. If the user selects nothing, say that no skills were applied and ask whether to continue the task without them. Stop there.
2. If the user typed a custom answer, treat it as an instruction. Match it to a skill if it names one, otherwise follow it as written.
3. For each selected skill, in the planned order:
   - Load it the way the current agent loads skills (the Skill tool in Claude, `$skill-name` or the skills menu in Codex, or by reading its `SKILL.md`).
   - Follow its instructions fully for the user's task.
   - Gather material before building, and use research skills before build skills.
4. If a selected skill cannot run because a tool or connector is missing, say which one in a single line, skip that skill, and continue with the rest.
5. If two selected skills conflict on output format, follow the more specific one and tell the user which you chose.

### Step 6: Report back

Finish with a short summary:

- Which skills were used, in order.
- What came out of the work, delivered the normal way for its type.
- One suggested next step, only if there is a real one.

Keep it to a few sentences. Do not recap every step.

## Edge cases

- **Library is empty or unreadable:** tell the user no skills could be read, and continue the task directly.
- **Very vague request such as "help me":** ask the one clarifying question from Step 1 before searching.
- **Same skill appears twice under different names:** list it once.
- **User asks "what skills do I have" with no task:** show the installed skills grouped by category in a short list, then offer to match them to a task. Skip the pick list in this case.
- **User repeats the request later in the same project:** rerun the matching, since the project may have changed, but do not re-offer skills they already declined unless the task changed.

## Style

- Keep every message short and plain.
- Use the exact skill names from the library so the user learns them and can call them directly next time.
- When useful, tell the user the direct way to call a chosen skill, for example its slash command, so they remember it later.
