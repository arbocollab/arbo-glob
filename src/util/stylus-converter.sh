#!/bin/bash

# Usage: ./stylus-converter.sh input.scss [output.styl]

if [ -z "$1" ]; then
  echo "Usage: $0 <input.scss> [output.styl]"
  exit 1
fi

INPUT="$1"
OUTPUT="${2:-${INPUT%.scss}.styl}"

if [ ! -f "$INPUT" ]; then
  echo "Error: File '$INPUT' not found."
  exit 1
fi

# Write :root wrapper
echo ':root' > "$OUTPUT"

# Process lines: indent variables and comments inside :root
sed -E \
  -e 's/#\{\$([a-zA-Z0-9_-]+)\}/var(--\1)/g' \
  -e 's/^\$([a-zA-Z0-9_-]+):[[:space:]]*([^;]+);[[:space:]]*(\/\/.*)?$/  --\1: \2/' \
  -e 's/^[[:space:]]*--([a-zA-Z0-9_-]+):[[:space:]]*([^;]+);[[:space:]]*(\/\/.*)?$/  --\1: \2/' \
  -e 's/^(\/\/.*)$/  \1/' \
  -e 's/[[:space:]]+$//' \
  "$INPUT" >> "$OUTPUT"

# Ensure file ends with a newline
printf '\n' >> "$OUTPUT"

echo "Done: $INPUT -> $OUTPUT"