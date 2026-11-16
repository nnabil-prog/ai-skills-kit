# Claude Skills Kit: rules for every session

This repo is the source of the public site https://nnabil-prog.github.io/claude-skills-kit/. GitHub Pages publishes the `main` branch. A push to `main` updates the site in about 1 minute.

## Files

- `index.html`: the page.
- `install.sh`: the install script. The page shows the command `curl -fsSL <site>/install.sh | bash` and loads the script text from this file. Do not copy the script into `index.html`.
- `CHANGELOG.md`: the list of changes that users can see.
- `README.md`: the update steps for people.

## Skills to use in this repo

Use these skills for each task in this repo. Load each skill before you start the task.

1. `asd-ste100`: Load it before you write any text in this repo. This includes `CHANGELOG.md`, `README.md`, this file, commit messages and the help text in `index.html`. Use Strict mode for `install.sh` messages and for this file. Use STE-flavored mode for `CHANGELOG.md`, `README.md` and the page text.
2. `changelog-generator`: Load it each time you change `index.html` or `install.sh`. Add an entry to `CHANGELOG.md` in the same commit as the change. Write the entry for a user of the kit, not for a developer.
3. `impeccable` and `make-interfaces-feel-better`: Load them before you change the layout, the colors or the style of `index.html`.

## When you change the list of skills or plugins

1. Update `install.sh`.
2. Update the matching row and the count in `index.html`.
3. Add a `CHANGELOG.md` entry that names each skill or plugin that you added or removed.
4. Run `bash -n install.sh`. Do not commit if it shows an error.

## Update procedure

1. Make the change.
2. Add the `CHANGELOG.md` entry under today's date. Use the format `## YYYY-MM-DD`.
3. Commit, then push to `main`.
4. Wait about 1 minute. Then open the site and make sure that the change shows.
