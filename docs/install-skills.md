# AI Skills Kit: skill picker and install instructions

You are an AI assistant. The user gave you this file. Do the steps below in sequence. Do not install anything before the user selects items in Step 1.

Kit page: https://nnabil-prog.github.io/ai-skills-kit/

The skills and plugins in this kit are for Claude Code. They install into the folder `~/.claude/skills` and into Claude Code's plugin list.

## Step 1: Ask the user which items to install

### 1a. Check the user's message first

Read the message that came with this file. Use the rules in 1c to find items in it. If the rules find one or more items, do not ask the question. Go to 1d. If the rules find no items, go to 1b.

### 1b. Ask the question

The Picker list below has 12 items and an "All" option. Ask the user to select one or more of them. Use Method A if you can. If you cannot, use Method B.

**Picker list**

| Item | Name | What it does |
|---|---|---|
| 0 | All | Installs items 1 to 12. |
| 1 | TypeScript clean code | 7 skills: boy-scout, clean-comments, clean-functions, clean-general, clean-names, clean-tests, typescript-clean-code. |
| 2 | Python clean code | 7 skills: python-clean-code and the py- versions of the 6 TypeScript skills. |
| 3 | apex | Staged implementation with checkpoints, tests and review. Runs only by its command `/apex`. |
| 4 | thermo-nuclear-code-quality-review | Strict maintainability review. Runs only by its command `/thermo-nuclear-code-quality-review`. |
| 5 | impeccable | Design, critique and polish UI. |
| 6 | make-interfaces-feel-better | UI polish details. |
| 7 | changelog-generator | Writes user-facing changelogs from git history. |
| 8 | asd-ste100 | Rewrites text in Simplified Technical English so that an agent or a person cannot misread it. |
| 9 | superpowers (plugin) | Planning, TDD, debugging, code review and git-worktree workflows. 15 skills. |
| 10 | understand-anything (plugin) | Makes a knowledge graph and a dashboard from a codebase. 9 skills. Needs Node.js. |
| 11 | frontend-design (plugin) | Visual direction and typography for UI work. 1 skill. |
| 12 | Design (plugin) | Design critique, accessibility, design systems, UX copy, user research and handoff. 7 skills. |

**Method A: you have a tool that shows a question with checkboxes**

Use this method if you have a tool that asks the user a multiple-choice question and lets the user select more than one option. In Claude Code, this tool is `AskUserQuestion`. That tool accepts at most 4 questions and at most 4 options in each question. Use these 4 questions in one call:

| Question | Header | Select more than one | Options |
|---|---|---|---|
| Install all items in the kit? | All | No | "Yes, install all" and "No, only my selections" |
| Which code quality skills? | Code | Yes | items 1, 2, 3 and 4 |
| Which design skills? | Design | Yes | items 5, 6, 11 and 12 |
| Which writing and workflow skills? | Workflow | Yes | items 7, 8, 9 and 10 |

Use the name of each item as the option label. Use its "What it does" text as the option description. If the user selects "Yes, install all", select items 1 to 12 and ignore the other answers.

**Method B: you do not have that tool**

Show the checklist below in your reply. Show it as a normal Markdown list, not in a code block. Do not show the Picker list table. Then stop and wait for the user's answer.

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

### 1c. Read the user's answer

Use these rules to find the selected items in the user's message or answer:

1. If the text contains checklist lines, select each line that starts with `- [x]` or `- [X]`. Ignore each line that starts with `- [ ]`. Do not use rules 2 to 5.
2. Each complete number from 0 to 12 selects that item. A number is complete when no digit comes directly before or after it. Thus `10` selects item 10 only.
3. Each item name from the Picker list selects that item. Compare names without case. The text "(plugin)" is not necessary. Thus "design" selects item 12, and "typescript clean code" selects item 1.
4. The number `0` and the complete words `all` and `everything` select all items 1 to 12. This occurs only if rules 2 and 3 find no other item. Example: "install all" selects all items. "install all the Python skills" selects item 2 only. If you are not sure, ask the user.
5. Ignore other words, for example "install", "please", "and", "the" and "skills".
6. If a number is larger than 12, or a name is almost the same as an item name, do not guess. Tell the user which part did not match. Ask the user if you can install only the items that did match, or if the user wants to answer again.

### 1d. Tell the user the items

1. Tell the user the list of items that you will install.
2. If the user selected item 8 (asd-ste100), ask the user this question: "Do you want every Claude Code session to use the asd-ste100 skill?" Keep the answer for the "Extra step for asd-ste100".
3. Go to Step 2.

## Step 2: Write one install script

Write one Bash script that contains the commands of Steps 3 to 7 for the selected items only. Put the commands in the sequence of those steps. Use one script so that the variables `SKILLS_DIR` and `WORK` keep their values from start to end.

In the script, do these things:

- Where a step says "stop", write `echo "<the reason>"` and then `exit 1`.
- Where a step says "tell the user that this item failed", write `echo "FAILED: <folder or plugin>"` and continue with the next row.
- Where a step says "skip", write `echo "SKIPPED: <folder or plugin>. <the reason>"`.
- After each skill folder or plugin installs correctly, write `echo "OK: <folder or plugin>"`. Write one line for each row of Tables 1, 2 and 3, not one line for each item.

Then find how to run the script:

1. If you can run shell commands on the user's computer, use **run mode**. Save the script to a temporary file and run it with `bash` in one command. Then do Step 8.
2. If you cannot run shell commands, use **script mode**. Put the script in one code block in your reply. Tell the user to save it as `install-skills.sh` and run `bash install-skills.sh` in a terminal. On Windows, tell the user to use Git Bash. Tell the user to restart Claude Code after the script finishes.

## Step 3: Check the computer

1. The script must run in Bash. On Windows, use Git Bash. Do not use PowerShell or cmd.exe.
2. Run `git --version`. If the command fails, stop with the reason "Install git from https://git-scm.com, then run this again."
3. If the user selected a plugin (items 9 to 12), run `claude --version`. If the command fails, skip each selected plugin with the reason "Install Claude Code first."
4. Set the skills folder: `SKILLS_DIR="$HOME/.claude/skills"`. Then run `mkdir -p "${SKILLS_DIR:?}"`.
5. Make a temporary folder: `WORK="$(mktemp -d)"`.

## Step 4: Install each selected skill from Table 1

Do these steps for each row in Table 1 whose item number the user selected.

1. If `$WORK/<clone>` does not exist, clone the repo:
   `git clone --quiet --depth 1 "https://github.com/<repo>.git" "${WORK:?}/<clone>"`
2. If the folder `${WORK:?}/<clone>/<path>` does not exist, tell the user that this item failed. Do not do steps 3 to 6 for this row. This keeps an old copy of the skill if the clone failed.
3. Remove an old copy: `rm -rf "${SKILLS_DIR:?}/<folder>"`.
4. Copy the skill: `cp -R "${WORK:?}/<clone>/<path>" "${SKILLS_DIR:?}/<folder>"`.
5. Remove the git data: `rm -rf "${SKILLS_DIR:?}/<folder>/.git"`.
6. If the file `${SKILLS_DIR:?}/<folder>/SKILL.md` does not exist, tell the user that this item failed. If it exists, write the OK line.

The `<clone>` value is the repo name with `/` changed to `__`. Example: `ertugrul-dmr/clean-code-skills` becomes `ertugrul-dmr__clean-code-skills`. Write each value from the tables as plain text. Do not include the backticks.

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
| 8 | asd-ste100 | danyuchn/asd-ste100-skill | . |

For asd-ste100, the path `.` is the full repo. Thus its check in step 2 is a check that the clone folder exists.

### Extra step for impeccable (item 5)

Do this step only if the impeccable row wrote an OK line. Put it directly after that OK line. The helper script downloads impeccable's engine from the project's GitHub releases and checks it against a pinned checksum.

```bash
sh "${SKILLS_DIR:?}/impeccable/scripts/impeccable" --version >/dev/null 2>&1 || echo "NOTE: impeccable gets its helper engine on first use."
```

### Extra step for asd-ste100 (item 8)

You asked the user about this step in Step 1d. If the user said yes, put this step in the script after the asd-ste100 OK line. If the user said no, do not put it in the script.

The step: if `$HOME/.claude/CLAUDE.md` does not contain the text `asd-ste100`, add this text to the end of that file.

```markdown

## Simplified Technical English (asd-ste100 skill)

Load the `asd-ste100` skill and apply its rules before you write any text that another agent, a tool or a system will read, or that a person must act on without asking you. That includes:

- prompts, briefs and instructions for subagents, workflows and other sessions
- tool descriptions, skill descriptions, CLAUDE.md and memory files
- error messages, log lines, status reports and handoff notes
- step-by-step instructions, runbooks and setup steps

Do not apply it to creative or marketing copy.
```

## Step 5: Install the Python skills from Table 2 (item 2)

Do this step only if the user selected item 2.

The Python skills in the upstream repo use the same names as the TypeScript skills. Thus you install each one with a `py-` prefix. You also change the names inside its `SKILL.md`.

Do these steps for each row in Table 2. `<name>` is the value in the "Upstream name" column.

1. If `${WORK:?}/ertugrul-dmr__clean-code-skills` does not exist, clone the repo:
   `git clone --quiet --depth 1 "https://github.com/ertugrul-dmr/clean-code-skills.git" "${WORK:?}/ertugrul-dmr__clean-code-skills"`
2. If the folder `${WORK:?}/ertugrul-dmr__clean-code-skills/skills/python/<name>` does not exist, tell the user that this item failed. Do not do step 3 for this row.
3. Run these commands:

```bash
dest="${SKILLS_DIR:?}/py-<name>"
rm -rf "${dest:?}"
cp -R "${WORK:?}/ertugrul-dmr__clean-code-skills/skills/python/<name>" "$dest"
sed -i.bak -E "s/^name: <name>\$/name: py-<name>/; s/(^|[^-a-z])(clean-(comments|functions|general|names|tests))([^-a-z]|\$)/\1py-\2\4/g" "$dest/SKILL.md"
rm -f "$dest/SKILL.md.bak"
```

4. If `$dest/SKILL.md` does not contain the line `name: py-<name>`, tell the user that this item failed. If it contains the line, write the OK line.

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

Run the commands in the row of each selected plugin, in sequence. Write them in the script in this form:

```bash
claude plugin marketplace add <marketplace> || true
if claude plugin install <plugin>@<marketplace>; then echo "OK: <plugin>"; else echo "FAILED: <plugin>. Read the error above. If it says that the plugin is already installed, ignore it."; fi
```

A marketplace that is already added gives an error. The `|| true` ignores that error. Some rows have no `marketplace add` command.

**Table 3: Plugins**

| Item | Plugin | Commands |
|---|---|---|
| 9 | superpowers | `claude plugin install superpowers@claude-plugins-official` |
| 10 | understand-anything | `claude plugin marketplace add Egonex-AI/Understand-Anything` then `claude plugin install understand-anything@understand-anything` |
| 11 | frontend-design | `claude plugin install frontend-design@claude-plugins-official` |
| 12 | Design | `claude plugin marketplace add anthropics/knowledge-work-plugins` then `claude plugin install design@knowledge-work-plugins` |

## Step 7: Remove the temporary folder

At the end of the script, run `rm -rf "${WORK:?}"`. Then write `echo "Done. Restart Claude Code to load the new skills."`.

## Step 8: Report the result (run mode only)

1. Read the script output.
2. Tell the user the result for each item: installed (an `OK:` line) or failed (a `FAILED:` line, with the error text).
3. Tell the user to restart Claude Code. Claude Code loads new skills and plugins only at start.

## Skills that this file does not install

These skills come with a claude.ai account: consolidate-memory, docs, docx, explain-usage, google-workspace, import-memory, morning, pdf, pptx, setup-claude, setup-cowork, skill-creator, xlsx. If the user asks for one of them, tell the user to turn it on at claude.ai, in Customize. Do not try other methods.
