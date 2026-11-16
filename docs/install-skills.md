# AI Skills Kit: skill picker and install instructions

You are an AI assistant. The user gave you this file. Do the steps below in sequence. Do not install anything before the user selects items in Step 1.

Kit page: https://nnabil-prog.github.io/ai-skills-kit/

The skills and plugins in this kit are for Claude Code. They install into the folder `~/.claude/skills` and into Claude Code's plugin list.

## Step 1: Ask the user which items to install

Show the user the 12 items in the Picker list and an "All" option. Let the user select more than one item.

**Picker list**

| Item | Name | What it does |
|---|---|---|
| 0 | All | Installs items 1 to 12. |
| 1 | TypeScript clean code | 7 skills: boy-scout, clean-comments, clean-functions, clean-general, clean-names, clean-tests, typescript-clean-code. |
| 2 | Python clean code | 7 skills: python-clean-code and the py- versions of the 6 TypeScript skills. |
| 3 | apex | Staged implementation with checkpoints, tests and review. Runs only by its command `/apex`. |
| 4 | thermo-nuclear-code-quality-review | Strict maintainability review. Runs only by its command. |
| 5 | impeccable | Design, critique and polish UI. |
| 6 | make-interfaces-feel-better | UI polish details. |
| 7 | changelog-generator | Writes user-facing changelogs from git history. |
| 8 | asd-ste100 | Rewrites text in Simplified Technical English so that an agent or a person cannot misread it. |
| 9 | superpowers (plugin) | Planning, TDD, debugging, code review and git-worktree workflows. 15 skills. |
| 10 | understand-anything (plugin) | Makes a knowledge graph and a dashboard from a codebase. 9 skills. Needs Node.js. |
| 11 | frontend-design (plugin) | Visual direction and typography for UI work. 1 skill. |
| 12 | Design (plugin) | Design critique, accessibility, design systems, UX copy, user research and handoff. 7 skills. |

### Method A: you have a tool that shows a question with checkboxes

Use this method if you have a tool that asks the user a multiple-choice question and lets the user select more than one option. In Claude Code, this tool is `AskUserQuestion`. That tool accepts at most 4 questions and at most 4 options in each question. Use these 4 questions in one call:

| Question | Header | Select more than one | Options |
|---|---|---|---|
| Install all items in the kit? | All | No | "Yes, install all" and "No, only my selections" |
| Which code quality skills? | Code | Yes | items 1, 2, 3 and 4 |
| Which design skills? | Design | Yes | items 5, 6, 11 and 12 |
| Which writing and workflow skills? | Workflow | Yes | items 7, 8, 9 and 10 |

Use the name of each item as the option label. Use its "What it does" text as the option description.

If the user selects "Yes, install all", select items 1 to 12. Ignore the other answers.

### Method B: you do not have that tool

Write this checklist in your reply exactly. Then stop and wait for the user's answer.

```markdown
Which skills do you want to install? Reply with the numbers, for example "1, 5, 9". Reply "0" for all.

- [ ] 0. All
- [ ] 1. TypeScript clean code (7 skills)
- [ ] 2. Python clean code (7 skills)
- [ ] 3. apex
- [ ] 4. thermo-nuclear-code-quality-review
- [ ] 5. impeccable
- [ ] 6. make-interfaces-feel-better
- [ ] 7. changelog-generator
- [ ] 8. asd-ste100
- [ ] 9. superpowers (plugin)
- [ ] 10. understand-anything (plugin)
- [ ] 11. frontend-design (plugin)
- [ ] 12. Design (plugin)
```

The user can also reply with names, or check the boxes and send the list back. If the reply contains "0" or "all", select items 1 to 12.

### After the user answers

1. If the user's first message already named items or said "all", do not ask again. Use those items.
2. If an answer does not match an item, tell the user. Show the Picker list again. Do not guess.
3. Tell the user the list of items that you will install. Then continue to Step 2.

## Step 2: Find how to run the commands

1. If you can run shell commands on the user's computer, use **run mode**. Do Steps 3 to 7. Run each command yourself.
2. If you cannot run shell commands, use **script mode**. Write one Bash script that contains the commands of Steps 3 to 6 for the selected items. Put the script in one code block. Tell the user to save it as `install-skills.sh` and run `bash install-skills.sh` in a terminal. On Windows, tell the user to use Git Bash. Then do Step 7, item 3 only.

## Step 3: Check the computer

1. Use a Bash shell. On Windows, use Git Bash. Do not use PowerShell or cmd.exe for these commands.
2. Run `git --version`. If the command fails, stop. Tell the user to install git from https://git-scm.com.
3. If the user selected a plugin (items 9 to 12), run `claude --version`. If the command fails, do not install the plugins. Tell the user to install Claude Code.
4. Set the skills folder: `SKILLS_DIR="$HOME/.claude/skills"`. Then run `mkdir -p "$SKILLS_DIR"`.
5. Make a temporary folder: `WORK="$(mktemp -d)"`.

## Step 4: Install each selected skill from Table 1

Do these steps for each row in Table 1 whose item number the user selected.

1. If `$WORK/<clone>` does not exist, clone the repo:
   `git clone --quiet --depth 1 https://github.com/<repo>.git "$WORK/<clone>"`
2. Remove an old copy: `rm -rf "${SKILLS_DIR:?}/<folder>"`.
3. Copy the skill: `cp -R "$WORK/<clone>/<path>" "$SKILLS_DIR/<folder>"`.
4. Remove the git data: `rm -rf "${SKILLS_DIR:?}/<folder>/.git"`.
5. Make sure that the file `$SKILLS_DIR/<folder>/SKILL.md` exists. If it does not exist, tell the user that this skill failed.

The `<clone>` value is the repo name with `/` changed to `__`. Example: `ertugrul-dmr/clean-code-skills` becomes `ertugrul-dmr__clean-code-skills`.

**Table 1: Skills**

| Item | Skill (folder) | Repo | Path in repo |
|---|---|---|---|
| 1 | boy-scout | ertugrul-dmr/clean-code-skills | skills/typescript/boy-scout |
| 1 | clean-comments | ertugrul-dmr/clean-code-skills | skills/typescript/clean-comments |
| 1 | clean-functions | ertugrul-dmr/clean-code-skills | skills/typescript/clean-functions |
| 1 | clean-general | ertugrul-dmr/clean-code-skills | skills/typescript/clean-general |
| 1 | clean-names | ertugrul-dmr/clean-code-skills | skills/typescript/clean-names |
| 1 | clean-tests | ertugrul-dmr/clean-code-skills | skills/typescript/clean-tests |
| 1 | typescript-clean-code | ertugrul-dmr/clean-code-skills | skills/typescript/typescript-clean-code |
| 2 | python-clean-code | ertugrul-dmr/clean-code-skills | skills/python/python-clean-code |
| 3 | apex | melvynx/aiblueprint | agents-config/skills/apex |
| 4 | thermo-nuclear-code-quality-review | cursor/plugins | thermos/skills/thermo-nuclear-code-quality-review |
| 5 | impeccable | pbakaus/impeccable | .claude/skills/impeccable |
| 6 | make-interfaces-feel-better | jakubkrehel/make-interfaces-feel-better | skills/make-interfaces-feel-better |
| 7 | changelog-generator | ComposioHQ/awesome-claude-skills | changelog-generator |
| 8 | asd-ste100 | danyuchn/asd-ste100-skill | `.` (the full repo) |

### Extra step for impeccable (item 5)

After you copy impeccable, run:

```bash
sh "$SKILLS_DIR/impeccable/scripts/impeccable" --version >/dev/null || echo "impeccable gets its helper engine on first use."
```

### Extra step for asd-ste100 (item 8)

After you copy asd-ste100, ask the user this question: "Do you want every Claude Code session to use the asd-ste100 skill?" If the user says yes, and `$HOME/.claude/CLAUDE.md` does not contain the text `asd-ste100`, add this text to the end of that file:

```markdown

## Simplified Technical English (asd-ste100 skill)

Load the `asd-ste100` skill and apply its rules before you write any text that another agent, a tool or a system will read, or that a person must act on without asking you. That includes:

- prompts, briefs and instructions for subagents, workflows and other sessions
- tool descriptions, skill descriptions, CLAUDE.md and memory files
- error messages, log lines, status reports and handoff notes
- step-by-step instructions, runbooks and setup steps

Do not apply it to creative or marketing copy.
```

In script mode, ask this question before you write the script. Put this step in the script only if the user says yes.

## Step 5: Install the Python skills from Table 2 (item 2)

Do this step only if the user selected item 2.

The Python skills in the upstream repo use the same names as the TypeScript skills. Thus you install each one with a `py-` prefix. You also change the names inside its `SKILL.md`.

Do these steps for each row in Table 2. `<name>` is the value in the "Upstream name" column.

1. If `$WORK/ertugrul-dmr__clean-code-skills` does not exist, clone the repo:
   `git clone --quiet --depth 1 https://github.com/ertugrul-dmr/clean-code-skills.git "$WORK/ertugrul-dmr__clean-code-skills"`
2. Run these commands:

```bash
dest="$SKILLS_DIR/py-<name>"
rm -rf "${dest:?}"
cp -R "$WORK/ertugrul-dmr__clean-code-skills/skills/python/<name>" "$dest"
sed -i.bak -E "s/^name: <name>\$/name: py-<name>/; s/(^|[^-a-z])(clean-(comments|functions|general|names|tests))([^-a-z]|\$)/\1py-\2\4/g" "$dest/SKILL.md"
rm -f "$dest/SKILL.md.bak"
```

3. Make sure that `$dest/SKILL.md` contains the line `name: py-<name>`.

**Table 2: Python clean code (item 2)**

| Skill (folder) | Upstream name |
|---|---|
| py-boy-scout | boy-scout |
| py-clean-comments | clean-comments |
| py-clean-functions | clean-functions |
| py-clean-general | clean-general |
| py-clean-names | clean-names |
| py-clean-tests | clean-tests |

## Step 6: Install each selected plugin from Table 3

Run the commands in the row of each selected plugin. Run them in sequence. If a command shows that the plugin is already installed, continue.

**Table 3: Plugins**

| Item | Plugin | Commands |
|---|---|---|
| 9 | superpowers | `claude plugin install superpowers@claude-plugins-official` |
| 10 | understand-anything | `claude plugin marketplace add Egonex-AI/Understand-Anything` then `claude plugin install understand-anything@understand-anything` |
| 11 | frontend-design | `claude plugin install frontend-design@claude-plugins-official` |
| 12 | Design | `claude plugin marketplace add anthropics/knowledge-work-plugins` then `claude plugin install design@knowledge-work-plugins` |

## Step 7: Finish

1. Remove the temporary folder: `rm -rf "${WORK:?}"`.
2. Tell the user the result for each item: installed, or failed with the error text.
3. Tell the user to restart Claude Code. Claude Code loads new skills and plugins only at start.

## Skills that this file does not install

These skills come with a claude.ai account: consolidate-memory, docs, docx, explain-usage, google-workspace, import-memory, morning, pdf, pptx, setup-claude, setup-cowork, skill-creator, xlsx. If the user asks for one of them, tell the user to turn it on at claude.ai, in Customize. Do not try other methods.
