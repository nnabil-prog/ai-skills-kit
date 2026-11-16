# AI Skills Kit

Neil's own skills and plugins, and one command that puts them on another PC. Skills that ship with the app aren't listed.

Site: https://nnabil-prog.github.io/ai-skills-kit/ · [Changelog](docs/CHANGELOG.md)

## Install on another PC

Sign in to Claude with the same account, paste this into a terminal (Git Bash on Windows), then restart Claude. Needs git.

```bash
curl -fsSL https://nnabil-prog.github.io/ai-skills-kit/install.sh | bash
```

The script: [docs/install.sh](docs/install.sh)

### Install only some skills with Claude

Give Claude [docs/install-skills.md](docs/install-skills.md) and name the skills you want, or say "all". For example, paste this into Claude Code:

```text
Read https://nnabil-prog.github.io/ai-skills-kit/install-skills.md and install impeccable and changelog-generator.
```

## Skills · `~/.claude/skills` · 20

| Skill | What it does | Source |
|---|---|---|
| TypeScript clean code | boy-scout, clean-comments, clean-functions, clean-general, clean-names, clean-tests, typescript-clean-code. | [ertugrul-dmr/clean-code-skills](https://github.com/ertugrul-dmr/clean-code-skills) |
| Python clean code | python-clean-code, plus py-boy-scout, py-clean-comments, py-clean-functions, py-clean-general, py-clean-names, py-clean-tests. The upstream Python set reuses the TypeScript names, so the script installs it under py- names and points py-boy-scout at them. | Same repo. |
| apex `/apex` | Staged implementation with checkpoints, tests and review. Runs only by its command. | [melvynx/aiblueprint](https://github.com/melvynx/aiblueprint) |
| thermo-nuclear-code-quality-review `/thermo-nuclear-code-quality-review` | Strict maintainability review. Runs only by its command. | [cursor/plugins](https://github.com/cursor/plugins) |
| impeccable | Design, critique and polish UI. The script also fetches its helper engine into ~/.impeccable from the project's GitHub releases and checks it against the pinned checksum. | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) |
| make-interfaces-feel-better | UI polish details. | [jakubkrehel/make-interfaces-feel-better](https://github.com/jakubkrehel/make-interfaces-feel-better) |
| changelog-generator | User-facing changelogs from git history. | [ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) |
| asd-ste100 | Rewrites instructions, prompts, error messages and status reports in Simplified Technical English so an agent or a person can't misread them. The script also adds a rule to ~/.claude/CLAUDE.md so every session uses it. Its optional linter needs Python. | [danyuchn/asd-ste100-skill](https://github.com/danyuchn/asd-ste100-skill) |

## Plugins · 24 skills

| Plugin | What it does | Commands |
|---|---|---|
| superpowers | Planning, TDD, debugging, code review and git-worktree workflows (15 skills). Official marketplace. | |
| understand-anything | Turns a codebase or wiki into an interactive knowledge graph and dashboard (9 skills). Run /understand first to build the graph; the first run on a big repo uses a lot of tokens. Its hooks need Node.js. [Egonex-AI/Understand-Anything](https://github.com/Egonex-AI/Understand-Anything) | `/understand` `/understand-dashboard` `/understand-chat` `/understand-explain` `/understand-diff` `/understand-domain` `/understand-onboard` `/understand-knowledge` `/understand-figma` |

## From your account · arrive with sign-in

Skills and plugins added on claude.ai (Customize). They follow your sign-in to the app and claude.ai.

`asd-ste100` `consolidate-memory` `docs` `docx` `explain-usage` `google-workspace` `import-memory` `morning` `pdf` `pptx` `setup-claude` `setup-cowork` `skill-creator` `xlsx`

| Plugin | What it does | Commands |
|---|---|---|
| Design | Anthropic's design plugin (7 skills): critique, accessibility, design systems, UX copy, user research and developer handoff. It can use your Slack, Figma, Notion and other connectors if you connect them. [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins) | `/design-critique` `/accessibility-review` `/design-system` `/design-handoff` `/ux-copy` `/user-research` `/research-synthesis` |
| frontend-design | Anthropic's plugin for distinctive visual direction and typography when building or reshaping UI (1 skill). [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official) | `/frontend-design` |

## Repo layout

| Path | Contents |
|---|---|
| `docs/` | The site that GitHub Pages publishes: `index.html`, `install.sh`, `install-skills.md` and `CHANGELOG.md`. |
| `.claude/CLAUDE.md` | Rules for each Claude session that works in this repo. |
