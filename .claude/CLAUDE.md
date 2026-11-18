# AI Skills Kit: rules for every session

This repo is the source of the public site https://nnabil-prog.github.io/ai-skills-kit/. GitHub Pages publishes the `docs/` folder of the `main` branch. A push to `main` updates the site in about 1 minute.

## Files

- `docs/index.html`: the page.
- `docs/install-skills.md`: the installer. A user drops it into any AI chat, or pastes the prompt from the page into Claude Code. The AI shows a checklist of the skills with an "All" option, then installs the selected items. This is the only installer. Do not add an install script.
- `docs/CHANGELOG.md`: the list of changes that users can see.
- `README.md`: the same text and tables as the page, in Markdown.
- `docs/.nojekyll`: stops GitHub Pages from changing the `.md` files. Do not remove it.

## Skills to use in this repo

Use these skills for each task in this repo. Load each skill before you start the task.

1. `asd-ste100`: Load it before you write any text in this repo. This includes `CHANGELOG.md`, `README.md`, this file, commit messages and the help text in `index.html`. Use Strict mode for `install-skills.md` and this file. Use STE-flavored mode for `CHANGELOG.md`, `README.md` and the page text.
2. `changelog-generator`: Load it each time you change a file in `docs/` or `README.md`. Add an entry to `docs/CHANGELOG.md` in the same commit as the change. Write the entry for a user of the kit, not for a developer.
3. `impeccable` and `make-interfaces-feel-better`: Load them before you change the layout, the colors or the style of `index.html`.
4. `design:accessibility-review`: Load it after you change `index.html`. Fix each WCAG 2.1 AA problem that it finds before you commit.
5. `design:ux-copy`: Load it before you change a button label, a status message or help text in `index.html`. Then apply `asd-ste100` to the result.
6. `security-review`: Load it before you commit a change to a command in `install-skills.md`. Users run these commands on their computers. The commands must clone only from the repos that they name. They must not run downloaded code without a check.
7. `superpowers:systematic-debugging`: Load it when the site does not update, the install command fails or the page shows an error. Find the cause before you change a file.
8. `superpowers:verification-before-completion`: Load it before you tell the user that you completed a change. Open the live site and make sure that the change shows there.

## Keep install-skills.md current

`docs/install-skills.md` must list each skill and plugin that the kit contains. When you add a skill or a plugin to the kit, add it to `install-skills.md` in the same commit:

1. Add the item to the Picker list in Step 1, to the Method B checklist and to one question in the Method A table. A Method A question has at most 4 options, and the call has at most 4 questions. Item 0 (All) is an option in the first question. If all 4 questions are full, tell the user, because the layout must change. Update the "Installs items 1 to N" text and each "items 1 to N" text.
2. Add a row to Table 1 for a skill that you copy from a repo. Write the item number, the folder name, the repo and the path in the repo.
3. Add a row to Table 2 for a Python clean code skill that gets the `py-` prefix.
4. Add a row to Table 3 for a plugin. Write the item number and each `claude plugin` command in sequence.
5. If the new item needs an extra step after the copy, add an "Extra step for <name>" section under Step 4.
6. Clone the repo into a temporary folder. Make sure that `SKILL.md` exists at the path that you wrote.

When you remove a skill or a plugin from the kit, remove its row from `install-skills.md` in the same commit.

## When you change the list of skills or plugins

Keep these 4 files the same. Do all steps in one commit.

1. Update the matching row and the count in `docs/index.html`.
2. Update the matching row and the count in `README.md`.
3. Update the matching tables in `docs/install-skills.md`. Follow "Keep install-skills.md current".
4. Add a `docs/CHANGELOG.md` entry that names each skill or plugin that you added or removed.

## Update procedure

1. Make the change.
2. Add the `docs/CHANGELOG.md` entry under today's date. Use the format `## YYYY-MM-DD`.
3. Commit, then push to `main`.
4. Wait about 1 minute. Then open the site and make sure that the change shows.

## Skills from a claude.ai account

Do not list skills that come only from a claude.ai account. Do not add them to the page, `README.md` or `install-skills.md`.
