#!/bin/sh

# turn on bash's job control
set -m

uvicorn app.main:app --host 0.0.0.0 --port 8123 "$@"
