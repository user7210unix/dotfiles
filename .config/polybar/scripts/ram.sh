#!/usr/bin/env bash
# Compact RAM percentage

mem_total=$(awk '/MemTotal/{print $2}' /proc/meminfo)
mem_avail=$(awk '/MemAvailable/{print $2}' /proc/meminfo)
mem=$(( (mem_total - mem_avail) * 100 / mem_total ))

echo "RAM ${mem}%"
