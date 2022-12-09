#!/bin/bash
set -e

while true; do
    ./start.sh &
    CHILD_PID=$!
    echo -e "\n--------------- started pid $CHILD_PID! ------------------\n"
    inotifywait -e close_write -q *
    killall qemu-system-x86_64 || true
done