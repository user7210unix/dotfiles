#!/usr/bin/env bash
# Compact CPU percentage

read -r _ u1 n1 s1 i1 iw1 irq1 sirq1 _ < /proc/stat
sleep 0.35
read -r _ u2 n2 s2 i2 iw2 irq2 sirq2 _ < /proc/stat

prev_idle=$((i1 + iw1))
idle=$((i2 + iw2))
prev_total=$((u1 + n1 + s1 + i1 + iw1 + irq1 + sirq1))
total=$((u2 + n2 + s2 + i2 + iw2 + irq2 + sirq2))
diff_idle=$((idle - prev_idle))
diff_total=$((total - prev_total))

if [ "$diff_total" -gt 0 ]; then
    cpu=$(( (1000 * (diff_total - diff_idle) / diff_total + 5) / 10 ))
else
    cpu=0
fi

echo "CPU ${cpu}%"
