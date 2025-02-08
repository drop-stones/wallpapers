#!/usr/bin/env zsh

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <destination_file_path>"
  exit 1
fi

dest_path="$1"
wallpapers_subdir="21_9"

script_dir="$(dirname "$(realpath "$0")")"
wallpapers_dir="$(dirname "$script_dir")/$wallpapers_subdir/"

files=($wallpapers_dir/*(N))

if [[ ${#files[@]} -eq 0 ]]; then
  echo "No files found in $wallpapers_dir"
  exit 1
fi

random_file="${files[RANDOM % ${#files[@]} + 1]}"

cp "$random_file" "$dest_path"
