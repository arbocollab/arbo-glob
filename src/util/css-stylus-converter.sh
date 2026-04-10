#!/bin/bash

# Usage: ./css-to-stylus.sh input.css [output.styl]

if [ -z "$1" ]; then
  echo "Usage: $0 <input.css> [output.styl]"
  exit 1
fi

INPUT="$1"
OUTPUT="${2:-${INPUT%.css}.styl}"

if [ ! -f "$INPUT" ]; then
  echo "Error: File '$INPUT' not found."
  exit 1
fi

# Process the CSS file - remove braces and semicolons, maintain indentation
sed -E \
  -e '/^[[:space:]]*\/\*/d' \
  -e '/^[[:space:]]*\*\//d' \
  -e 's/[[:space:]]*\{[[:space:]]*$//' \
  -e 's/[[:space:]]*\}[[:space:]]*$//' \
  -e 's/;[[:space:]]*$//' \
  -e '/^[[:space:]]*$/d' \
  "$INPUT" > "$OUTPUT"

echo "Done: $INPUT -> $OUTPUT"