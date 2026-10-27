# Examples

Three sample sessions showing how Skill Compass behaves. Skill names depend on what you have installed.

## 1. A clear task with several matches

**You:** `/skill-compass` I need a deck for next week's board meeting using last quarter's numbers in this spreadsheet.

**Compass reads:** deliverable is a presentation, the input is spreadsheet data.

**Pick list:**

1. `xlsx` (Recommended): reads and checks the spreadsheet numbers
2. `data-visualization`: turns the numbers into clear charts
3. `pptx`: builds the deck

**You pick:** all three.

**Compass runs them in order:** data first, charts next, deck last, then reports what it used.

## 2. A vague request

**You:** skill compass, help me with my project

**Compass asks one question:** What are you trying to produce, for example a document, a design, or an analysis?

**You:** a landing page

Compass now searches and shows the pick list as in example 1.

## 3. Nothing fits

**You:** which skills should I use to tune my guitar?

**Compass:** None of your installed skills fit this task. The closest are `user-research` and `deep-research`, but neither is a real match. Want me to continue without a skill?

Compass does not force a match when none is strong.

## 4. An agent without a popup (numbered list)

```
Skill Compass found these for your task:

1. frontend-design (Recommended): builds distinctive UI
2. brand-guidelines: applies your brand colors and type
3. accessibility-review: checks contrast and keyboard use

Reply with numbers (for example "1 3"), "all", or "none".
```

**You:** 1 3

Compass loads skills 1 and 3 and starts the work.

## 5. Just listing skills

**You:** what skills do I have?

**Compass:** shows your installed skills grouped by category, then offers to match them to a task.
