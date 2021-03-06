#!/bin/sh
#
# update-dotfiles
#
# `update-dotfiles` handles installation, updates, things like that. Run it
# periodically to make sure you're on the latest and greatest.
export DOTFILES="$HOME/.dotfiles"
cd "$DOTFILES" || exit 1

# fixes PATH (we could be running from the crontab)
PATH="$(command -p getconf PATH):/usr/local/bin"

# load custom config if any
[ -f ~/.localrc ] && . ~/.localrc

# # ssh would not work under cron, add a https one
# echo "› setting up update channel"
# git remote add updates https://github.com/kelvinwtan/dotfiles.git 2>/dev/null

# # Update repo
# echo "› git update"
# git pull --rebase --stat

echo "› registering last update"
git config --global dotfiles.lastupdate "$(date +%Y%m%d%H%M)"
