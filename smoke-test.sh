#!/usr/bin/env bash
set -euo pipefail

SITE_URL="https://wanaonimike.github.io/wanaoni-family/"
FORM_URL="https://formspree.io/f/mdkdoenp"

echo "1) Checking site status…"
HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$SITE_URL")
if [[ "$HTTP_CODE" == "200" ]]; then
  echo "   ✅ Site is up (HTTP $HTTP_CODE)"
else
  echo "   ⚠️ Site responded with HTTP $HTTP_CODE"
  exit 1
fi

echo "2) Verifying homepage content…"
if curl -s "$SITE_URL" | grep -q "Welcome to Our Family Home"; then
  echo "   ✅ Found hero text on homepage"
else
  echo "   ⚠️ Homepage text not found—check index.html"
  exit 1
fi

echo "3) Testing contact form endpoint…"
RESPONSE=$(curl -s -X POST \
  -F name="Test User" \
  -F email="test@example.com" \
  -F message="Hello from bash smoke test" \
  "$FORM_URL")
if echo "$RESPONSE" | grep -q '"ok":true'; then
  MSG=$(echo "$RESPONSE" | sed -n 's/.*"message":"\([^"]*\)".*/\1/p')
  echo "   ✅ Formspree replied: $MSG"
else
  echo "   ⚠️ Formspree didn’t return ok. Full response:"
  echo "$RESPONSE"
  exit 1
fi

echo "🎉 All checks passed. Your site and form endpoint are live!"
