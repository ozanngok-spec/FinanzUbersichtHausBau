#!/bin/bash
set -e

if [ -z "$SUPABASE_URL" ] || [ -z "$SUPABASE_KEY" ]; then
  echo "Error: SUPABASE_URL and SUPABASE_KEY environment variables must be set."
  exit 1
fi

sed \
  -e "s|%%SUPABASE_URL%%|$SUPABASE_URL|g" \
  -e "s|%%SUPABASE_KEY%%|$SUPABASE_KEY|g" \
  index.template.html > index.html

echo "Build complete – index.html generated."
