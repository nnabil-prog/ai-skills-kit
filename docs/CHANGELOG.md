# Changelog

Changes to the AI Skills Kit that you can see on the site or in the installer.

## 2026-11-26

### ✨ New

- **Session rules**: When you install security-audit, building-with-ai, click-path-audit or asd-ste100, the installer asks if every Claude Code session must use it. If you say yes, it adds a short rule to your `~/.claude/CLAUDE.md`. It adds each rule only one time and keeps the text that is already in the file.

- **click-path-audit**: Finds buttons that do not do what their label says. It traces each click through the state that it changes and finds actions that undo each other. From [affaan-m/ECC](https://github.com/affaan-m/ECC). Pick item 15 in the installer.

- **building-with-ai**: A guide skill for choosing libraries, UI components, icons, fonts and agent skills. It checks licenses, keeps projects small and adds quality checks for UI and copy. Pick item 14 in the installer.

## 2026-11-18

### ✨ New

- **security-audit**: Cloudflare's security skill is now in the kit. Ask Claude a security question or ask for a focused review. Ask for an audit or a pen test to get the full six-phase audit with verified findings. Its validators need Node.js. Source: [cloudflare/security-audit-skill](https://github.com/cloudflare/security-audit-skill).

### 🔧 Improvements

- **Picker groups**: In Claude Code, the picker now shows 4 groups: Review, Code & docs, Design and Workflow. "All" is the first option in the Review group.

## 2026-11-17 (update 6)

### 🔧 Improvements

- **Source link for Python clean code**: The Python clean code row now links to its source repo, ertugrul-dmr/clean-code-skills.

## 2026-11-17 (update 5)

### 🔧 Improvements

- **One way to install**: The skill picker is now the only installer. Drop [install-skills.md](https://nnabil-prog.github.io/ai-skills-kit/install-skills.md) into any AI chat, or copy the prompt from the page into Claude Code. The kit no longer has the `curl` install command or `install.sh`.
- **Kit skills only**: The lists no longer show the skills that come with a claude.ai account. These are docx, pdf, pptx, xlsx, docs, google-workspace, consolidate-memory, import-memory, setup-claude, setup-cowork, skill-creator, explain-usage and morning. The Skills list shows 20 skills.

## 2026-11-17 (update 4)

### ✨ New

- **Skill picker for any AI**: Drop [install-skills.md](https://nnabil-prog.github.io/ai-skills-kit/install-skills.md) into any AI chat. The AI shows a list with a checkbox next to each skill and an "All" option. Select the skills that you want, and the AI installs them.
- **Script for chat-only AIs**: If the AI cannot run commands on your computer, it gives you one script to run instead.

### 🔧 Improvements

- **Shorter example**: The README example now fits on one line.

## 2026-11-17 (update 3)

### 🔧 Improvements

- **One list of skills**: The skills from your claude.ai account are now in the Skills list, next to the other skills. Each row says where the skill comes from.
- **One list of plugins**: The Design and frontend-design plugins are now in the Plugins list. The list shows 4 plugins with 32 skills.
- **Shorter README**: The README no longer has the "From your account" section or the repo layout table.

## 2026-11-17 (later)

### ✨ New

- **New name**: The kit is now the AI Skills Kit. The new address is https://nnabil-prog.github.io/ai-skills-kit/. The old claude-skills-kit address no longer works.
- **Install only some skills**: Give Claude [install-skills.md](https://nnabil-prog.github.io/ai-skills-kit/install-skills.md) and name the skills that you want, or say "all". Claude installs them and tells you the result for each one.
- **Full README**: The repo README now has the same text and tables as the page.

### 🔧 Improvements

- **New install command**: `curl -fsSL https://nnabil-prog.github.io/ai-skills-kit/install.sh | bash`. The script did not change.

## 2026-11-17

### ✨ New

- **Public site**: The kit is now on a free public page. You do not need a Claude sign-in to open it.
- **Shorter install command**: The install command is now one line that uses `curl`. Each run gets the newest version of the script.
- **Changelog**: This page lists each change to the kit. The site links to it.

### 🔧 Improvements

- **Script preview**: "Show the script" now shows the same script that the command runs.

## 2026-11-10

- **First version**: The kit was a private claude.ai page. It listed 20 skills, 2 plugins and the skills from your Claude account, with a copy-and-paste install command.
