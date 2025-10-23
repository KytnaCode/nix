#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash jq gum
# shellcheck shell=bash

set -e

conf="$(cat "${FLATPAK_CONFIG_FILE:-"/etc/nixos/flatpak.json"}")"

# Get installed apps
installed="$(flatpak list --user --app --columns=app | sort)"

# Remotes format
# {
#   "remote1Name": "remote1URI",
#   "remote2Name": "remote2URI"
# }
remotes="$(jq -r '.remotes | (keys | .[]) as $key | "\($key) \(.[$key])"' <<<"$conf")"

# Apps format
# [ "com.example.one", "com.example.two" ]
apps="$(jq -r '.apps[]' <<<"$conf" | sort)"

# Add Remotes
while IFS= read -r line; do
  IFS=' ' read -ra entry <<<"$line"

  flatpak remote-add --user --if-not-exists "${entry[0]}" "${entry[1]}"
done <<<"$remotes"

# Install apps
while IFS= read -r app; do
  flatpak install --user --or-update --noninteractive "$app"
done <<<"$apps"

# Uninstall old apps
old="$(comm -13 <(echo -e "$apps") <(echo -e "$installed"))"

while IFS= read -r app; do
  flatpak uninstall --app --noninteractive --user "$app"
done <<<"$old"

gum style \
  --foreground 212 --border-foreground 212 --border double \
  --align center --width 50 --margin "1 2" --padding "2 4" \
  'flatpak updated succefully!'
