#!/bin/zsh
# Auto-sync: commits and pushes any change in this repo every 30 seconds.
# Runs as LaunchAgent com.yoavtoren.shapira3d-autosync (KeepAlive).
cd /Users/yoavtoren/Apps/shapira-3d || exit 1

while true; do
  if [[ -n $(git status --porcelain) ]]; then
    git add -A
    git commit -m "Auto-commit: $(date '+%Y-%m-%d %H:%M:%S')" --quiet
    git push origin main --quiet 2>>/Users/yoavtoren/Library/Logs/shapira3d-autosync.log \
      && echo "$(date '+%F %T') pushed" >> /Users/yoavtoren/Library/Logs/shapira3d-autosync.log
  fi
  sleep 30
done
