#!/bin/bash

# ============================================================
# SCSS to CSS Converter
# Usage:
#   ./scss-converter.sh <input.scss> [output.css]
#
# Examples:
#   ./scss-converter.sh input.scss output.css
#   ./scss-converter.sh input.scss              (outputs input.css)
# ============================================================

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

INPUT=""
OUTPUT=""

for arg in "$@"; do
  if [[ -z "$INPUT" ]]; then
    INPUT="$arg"
  elif [[ -z "$OUTPUT" ]]; then
    OUTPUT="$arg"
  fi
done

if [[ -z "$INPUT" ]]; then
  echo -e "${YELLOW}Usage: ./scss-converter.sh <input.scss> [output.css]${NC}"
  exit 1
fi

if [[ ! -f "$INPUT" ]]; then
  echo -e "${RED}Error: File '$INPUT' not found.${NC}"
  exit 1
fi

if [[ -z "$OUTPUT" ]]; then
  OUTPUT="${INPUT%.scss}.css"
fi

OUTPUT_DIR=$(dirname "$OUTPUT")
mkdir -p "$OUTPUT_DIR"

# Write :root opener
echo ':root {' > "$OUTPUT"

# Convert SCSS to CSS:
# 1. Convert $var: value; to --var: value;
# 2. Convert // comments to /* comments */
# 3. Trim trailing whitespace
sed -E \
  -e 's/#\{\$([a-zA-Z0-9_-]+)\}/var(--\1)/g' \
  -e '/^[[:space:]]*\/\//d' \
  -e 's/[[:space:]]*\/\/.*$//' \
  -e 's/^\$([a-zA-Z0-9_-]+):[[:space:]]*([^;]+);[[:space:]]*$/  --\1: \2;/' \
  -e 's/^[[:space:]]*--([a-zA-Z0-9_-]+):[[:space:]]*([^;]+);[[:space:]]*$/  --\1: \2;/' \
  -e 's/[[:space:]]+$//' \
  "$INPUT" >> "$OUTPUT"

# Close :root
echo '}' >> "$OUTPUT"

echo -e "Converting: $INPUT -> $OUTPUT ... ${GREEN}OK${NC}"