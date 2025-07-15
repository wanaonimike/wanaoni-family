#!/usr/bin/env bash
set -euo pipefail

# Requires environment variables:
#   FORM_ID          e.g. mdkdoenp
#   FORMSPREE_TOKEN  your Formspree API token
OUTDIR="form-backups"
mkdir -p "$OUTDIR"
FILE="$OUTDIR/submissions-$(date +%F).json"

curl -s -H "Authorization: Bearer $FORMSPREE_TOKEN" \
  "https://api.formspree.io/v2/forms/$FORM_ID/submissions" \
  > "$FILE"

echo "Backed up to $FILE"
