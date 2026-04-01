#!/bin/sh
# Render entrypoint: configure and start the gateway.
# Render's dockerCommand does not support shell operators (&&, ||, ;),
# so this script chains the config step and the gateway start.
set -e
node openclaw.mjs config set gateway.controlUi.dangerouslyAllowHostHeaderOriginFallback true
node openclaw.mjs config set gateway.trustedProxies '["10.0.0.0/8"]'
exec node openclaw.mjs gateway --allow-unconfigured --bind lan --port 8080
