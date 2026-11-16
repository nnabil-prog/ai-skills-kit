#!/usr/bin/env bash
# Installs Neil's Claude Code skills and plugins. Needs git and the claude CLI (Git Bash on Windows).
set -euo pipefail
SKILLS_DIR="${SKILLS_DIR:-$HOME/.claude/skills}"
WORK="$(mktemp -d)"; trap 'rm -rf "$WORK"' EXIT
mkdir -p "$SKILLS_DIR"

# add <owner/repo> <path-in-repo> [folder-name]; the folder name is needed when the skill sits at the repo root.
add() {
  local repo="$WORK/${1//\//__}"
  [ -d "$repo" ] || git clone --quiet --depth 1 "https://github.com/$1.git" "$repo"
  if [ -n "${3:-}" ]; then
    rm -rf "$SKILLS_DIR/$3"
    cp -R "$repo/$2" "$SKILLS_DIR/$3"
    rm -rf "$SKILLS_DIR/$3/.git"
  else
    cp -R "$repo/$2" "$SKILLS_DIR/"
  fi
}

# The Python set reuses the TypeScript names, so it goes in as py-<name>, cross-references included.
add_py() {
  local dest="$SKILLS_DIR/py-$1"
  rm -rf "$dest"
  cp -R "$WORK/ertugrul-dmr__clean-code-skills/skills/python/$1" "$dest"
  sed -i.bak -E "s/^name: $1\$/name: py-$1/; s/(^|[^-a-z])(clean-(comments|functions|general|names|tests))([^-a-z]|\$)/\1py-\2\4/g" "$dest/SKILL.md"
  rm -f "$dest/SKILL.md.bak"
}

for s in boy-scout clean-comments clean-functions clean-general clean-names clean-tests typescript-clean-code; do
  add ertugrul-dmr/clean-code-skills "skills/typescript/$s"
done
add ertugrul-dmr/clean-code-skills skills/python/python-clean-code
for s in boy-scout clean-comments clean-functions clean-general clean-names clean-tests; do
  add_py "$s"
done
add melvynx/aiblueprint agents-config/skills/apex
add cursor/plugins thermos/skills/thermo-nuclear-code-quality-review
add pbakaus/impeccable .claude/skills/impeccable
add jakubkrehel/make-interfaces-feel-better skills/make-interfaces-feel-better
add ComposioHQ/awesome-claude-skills changelog-generator
add danyuchn/asd-ste100-skill . asd-ste100

# Tell every Claude Code session to use the STE100 skill (user-level CLAUDE.md, read at session start).
CLAUDE_MD="$HOME/.claude/CLAUDE.md"
if ! grep -q 'asd-ste100' "$CLAUDE_MD" 2>/dev/null; then
  cat >> "$CLAUDE_MD" <<'RULE'

## Simplified Technical English (asd-ste100 skill)

Load the `asd-ste100` skill and apply its rules before you write any text that another agent, a tool or a system will read, or that a person must act on without asking you. That includes:

- prompts, briefs and instructions for subagents, workflows and other sessions
- tool descriptions, skill descriptions, CLAUDE.md and memory files
- error messages, log lines, status reports and handoff notes
- step-by-step instructions, runbooks and setup steps

Do not apply it to creative or marketing copy, or to text whose wording Neil supplied.
RULE
fi

echo "Fetching impeccable's helper engine..."
sh "$SKILLS_DIR/impeccable/scripts/impeccable" --version >/dev/null \
  || echo "Couldn't fetch it now; impeccable downloads it on first use."

claude plugin install superpowers@claude-plugins-official
claude plugin marketplace add Egonex-AI/Understand-Anything
claude plugin install understand-anything@understand-anything

echo "Done. Restart Claude to load the skills."
