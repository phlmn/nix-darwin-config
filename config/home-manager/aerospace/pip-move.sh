#!/bin/bash
# Move PiP windows to current workspace (handles both "Picture-in-Picture" and "Picture in Picture")
aerospace list-windows --all | grep -E "(Picture-in-Picture|Picture in Picture)" | awk '{print $1}' | while read window_id; do
    if [ -n "$window_id" ]; then
        aerospace move-node-to-workspace --window-id "$window_id" "$AEROSPACE_FOCUSED_WORKSPACE"
    fi
done
