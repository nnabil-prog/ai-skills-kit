# AI Skills Kit: install instructions for Claude

You are Claude. The user gave you this file to install skills and plugins from the AI Skills Kit. Follow these steps in sequence.

Kit page: https://nnabil-prog.github.io/ai-skills-kit/

## Step 1: Find what the user wants

1. Read the user's message. Find the names of the skills and plugins that the user wants.
2. If the user wrote "all", or did not name any items, select all items in Tables 1, 2 and 3.
3. If the user named a group, select all items in that group. The groups are "TypeScript clean code", "Python clean code" and "plugins".
4. If a name does not match a row in Tables 1, 2, 3 or 4, tell the user. Show the list of names. Do not guess.
5. Tell the user the list of items that you will install. Then continue.

## Step 2: Check the computer

1. Use a Bash shell. On Windows, use Git Bash. Do not use PowerShell or cmd.exe for these commands.
2. Run `git --version`. If the command fails, stop. Tell the user to install git from https://git-scm.com.
3. For a plugin in Table 3, run `claude --version`. If the command fails, do not install the plugins. Tell the user to install Claude Code.
4. Set the skills folder: `SKILLS_DIR="$HOME/.claude/skills"`. Then run `mkdir -p "$SKILLS_DIR"`.
5. Make a temporary folder: `WORK="$(mktemp -d)"`.

## Step 3: Install each skill from Table 1

Do these steps for each selected skill in Table 1.

1. If `$WORK/<clone>` does not exist, clone the repo:
   `git clone --quiet --depth 1 https://github.com/<repo>.git "$WORK/<clone>"`
2. Remove an old copy: `rm -rf "${SKILLS_DIR:?}/<folder>"`.
3. Copy the skill: `cp -R "$WORK/<clone>/<path>" "$SKILLS_DIR/<folder>"`.
4. Remove the git data: `rm -rf "${SKILLS_DIR:?}/<folder>/.git"`.
5. Make sure that the file `$SKILLS_DIR/<folder>/SKILL.md` exists. If it does not exist, tell the user that this skill failed.

The `<clone>` value is the repo name with `/` changed to `__`. Example: `ertugrul-dmr/clean-code-skills` becomes `ertugrul-dmr__clean-code-skills`.

**Table 1: Skills**

| Skill (folder) | Repo | Path in repo |
|---|---|---|
| boy-scout | ertugrul-dmr/clean-code-skills | skills/typescript/boy-scout |
| clean-comments | ertugrul-dmr/clean-code-skills | skills/typescript/clean-comments |
| clean-functions | ertugrul-dmr/clean-code-skills | skills/typescript/clean-functions |
| clean-general | ertugrul-dmr/clean-code-skills | skills/typescript/clean-general |
| clean-names | ertugrul-dmr/clean-code-skills | skills/typescript/clean-names |
| clean-tests | ertugrul-dmr/clean-code-skills | skills/typescript/clean-tests |
| typescript-clean-code | ertugrul-dmr/clean-code-skills | skills/typescript/typescript-clean-code |
| python-clean-code | ertugrul-dmr/clean-code-skills | skills/python/python-clean-code |
| apex | melvynx/aiblueprint | agents-config/skills/apex |
| thermo-nuclear-code-quality-review | cursor/plugins | thermos/skills/thermo-nuclear-code-quality-review |
| impeccable | pbakaus/impeccable | .claude/skills/impeccable |
| make-interfaces-feel-better | jakubkrehel/make-interfaces-feel-better | skills/make-interfaces-feel-better |
| changelog-generator | ComposioHQ/awesome-claude-skills | changelog-generator |
| asd-ste100 | danyuchn/asd-ste100-skill | `.` (the full repo) |

The "TypeScript clean code" group is the first 7 rows.

### Extra step for impeccable

After you copy impeccable, run:

```bash
sh "$SKILLS_DIR/impeccable/scripts/impeccable" --version >/dev/null || echo "impeccable gets its helper engine on first use."
```

### Extra step for asd-ste100

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

## Step 4: Install each skill from Table 2

The Python skills in the upstream repo use the same names as the TypeScript skills. Thus you install each one with a `py-` prefix. You also change the names inside its `SKILL.md`.

Do these steps for each selected skill in Table 2. `<name>` is the value in the "Upstream name" column.

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

**Table 2: Python clean code group**

| Skill (folder) | Upstream name |
|---|---|
| py-boy-scout | boy-scout |
| py-clean-comments | clean-comments |
| py-clean-functions | clean-functions |
| py-clean-general | clean-general |
| py-clean-names | clean-names |
| py-clean-tests | clean-tests |

The "Python clean code" group also includes `python-clean-code` from Table 1.

## Step 5: Install each plugin from Table 3

Run the commands in the row of each selected plugin. Run them in sequence. If a command shows that the plugin is already installed, continue.

**Table 3: Plugins**

| Plugin | Commands |
|---|---|
| superpowers | `claude plugin install superpowers@claude-plugins-official` |
| understand-anything | `claude plugin marketplace add Egonex-AI/Understand-Anything` then `claude plugin install understand-anything@understand-anything` |
| frontend-design | `claude plugin install frontend-design@claude-plugins-official` |
| design | `claude plugin marketplace add anthropics/knowledge-work-plugins` then `claude plugin install design@knowledge-work-plugins` |

The understand-anything plugin needs Node.js for its hooks.

## Step 6: Items that you cannot install

The items in Table 4 come from the user's claude.ai account. You cannot install them with a command. If the user selected one of them, tell the user to turn it on at claude.ai, in Customize. Do not try other methods.

**Table 4: Account skills**

consolidate-memory, docs, docx, explain-usage, google-workspace, import-memory, morning, pdf, pptx, setup-claude, setup-cowork, skill-creator, xlsx

## Step 7: Finish

1. Remove the temporary folder: `rm -rf "${WORK:?}"`.
2. Tell the user the result for each item: installed, failed (with the error text), or not possible (Table 4).
3. Tell the user to restart Claude. Claude loads new skills and plugins only at start.
