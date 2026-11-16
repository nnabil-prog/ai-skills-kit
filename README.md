# AI Skills Kit

Neil's own skills and plugins, and one command that puts them on another PC. Skills that ship with the app aren't listed.

Site: https://nnabil-prog.github.io/ai-skills-kit/ · [Changelog](docs/CHANGELOG.md)

## Install on another PC

Sign in to Claude with the same account, paste this into a terminal (Git Bash on Windows), then restart Claude. Needs git.

```bash
curl -fsSL https://nnabil-prog.github.io/ai-skills-kit/install.sh | bash
```

The script: [docs/install.sh](docs/install.sh)

### Pick skills with any AI

Drop [install-skills.md](docs/install-skills.md) into any AI chat. The AI shows a list with a checkbox next to each skill and an "All" option. Pick what you want, and the AI installs it. If the AI can't run commands, it gives you a script to run.

In Claude Code you can paste the link instead:

```text
Follow https://nnabil-prog.github.io/ai-skills-kit/install-skills.md
```

## Skills · 33

| Skill | What it does | Source |
|---|---|---|
| TypeScript clean code | boy-scout, clean-comments, clean-functions, clean-general, clean-names, clean-tests, typescript-clean-code. | [ertugrul-dmr/clean-code-skills](https://github.com/ertugrul-dmr/clean-code-skills) |
| Python clean code | python-clean-code, plus py-boy-scout, py-clean-comments, py-clean-functions, py-clean-general, py-clean-names, py-clean-tests. The upstream Python set reuses the TypeScript names, so the script installs it under py- names and points py-boy-scout at them. | Same repo. |
| apex `/apex` | Staged implementation with checkpoints, tests and review. Runs only by its command. | [melvynx/aiblueprint](https://github.com/melvynx/aiblueprint) |
| thermo-nuclear-code-quality-review `/thermo-nuclear-code-quality-review` | Strict maintainability review. Runs only by its command. | [cursor/plugins](https://github.com/cursor/plugins) |
| impeccable | Design, critique and polish UI. The script also fetches its helper engine into ~/.impeccable from the project's GitHub releases and checks it against the pinned checksum. | [pbakaus/impeccable](https://github.com/pbakaus/impeccable) |
| make-interfaces-feel-better | UI polish details. | [jakubkrehel/make-interfaces-feel-better](https://github.com/jakubkrehel/make-interfaces-feel-better) |
| changelog-generator | User-facing changelogs from git history. | [ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) |
| asd-ste100 | Rewrites instructions, prompts, error messages and status reports in Simplified Technical English so an agent or a person can't misread them. The script also adds a rule to ~/.claude/CLAUDE.md so every session uses it. Its optional linter needs Python. Also on your claude.ai account. | [danyuchn/asd-ste100-skill](https://github.com/danyuchn/asd-ste100-skill) |
| Office files | docx, pdf, pptx, xlsx. Create, read and edit Word documents, PDFs, PowerPoint decks and spreadsheets. | claude.ai account (Customize) |
| docs | Editable docs that people share and comment on. They export to Word, PDF, Markdown or Google Docs. | claude.ai account (Customize) |
| google-workspace | Create and change Google Docs, Sheets and Slides files in your Drive. | claude.ai account (Customize) |
| Memory | consolidate-memory merges duplicate memory files, fixes old facts and cleans the index. import-memory brings in a memory export from another AI assistant. | claude.ai account (Customize) |
| Setup | setup-claude and setup-cowork. Guided setup that installs plugins for your role and connects your tools. | claude.ai account (Customize) |
| skill-creator | Create, edit and test skills. | claude.ai account (Customize) |
| explain-usage | Shows where a session's tokens went, with one chart. | claude.ai account (Customize) |
| morning | Your morning brief as a page, or as a task that runs each weekday. | claude.ai account (Customize) |

Skills from your claude.ai account follow your sign-in to the app and claude.ai. The install script does not install them.

## Plugins · 4 plugins · 32 skills

| Plugin | What it does | Commands |
|---|---|---|
| superpowers | Planning, TDD, debugging, code review and git-worktree workflows (15 skills). Official marketplace. | |
| understand-anything | Turns a codebase or wiki into an interactive knowledge graph and dashboard (9 skills). Run /understand first to build the graph; the first run on a big repo uses a lot of tokens. Its hooks need Node.js. [Egonex-AI/Understand-Anything](https://github.com/Egonex-AI/Understand-Anything) | `/understand` `/understand-dashboard` `/understand-chat` `/understand-explain` `/understand-diff` `/understand-domain` `/understand-onboard` `/understand-knowledge` `/understand-figma` |
| Design | Anthropic's design plugin (7 skills): critique, accessibility, design systems, UX copy, user research and developer handoff. It can use your Slack, Figma, Notion and other connectors if you connect them. Added on claude.ai (Customize). [anthropics/knowledge-work-plugins](https://github.com/anthropics/knowledge-work-plugins) | `/design-critique` `/accessibility-review` `/design-system` `/design-handoff` `/ux-copy` `/user-research` `/research-synthesis` |
| frontend-design | Anthropic's plugin for distinctive visual direction and typography when building or reshaping UI (1 skill). Added on claude.ai (Customize). [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official) | `/frontend-design` |
