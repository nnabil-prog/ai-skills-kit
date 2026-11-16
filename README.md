# Claude Skills Kit

A free public page on GitHub Pages: https://nnabil-prog.github.io/claude-skills-kit/

The page lists Neil's Claude Code skills and plugins. It gives one command that installs them on another PC.

## Update the site

1. Open Claude Code in this folder. Claude reads `CLAUDE.md` and uses the changelog and STE100 skills for each change.
2. Change `index.html` (the page) or `install.sh` (the install script).
3. Add an entry to `CHANGELOG.md`.
4. Commit, then push to `main`. GitHub Pages updates the site in about 1 minute.

The page builds the install command from the address of `install.sh` and loads the script text from that file. Thus you change the script in one file only.
