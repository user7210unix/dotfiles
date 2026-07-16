#!/bin/sh

exec_once () {
    pgrep "$1" || "$1" || notify_error "Failed to start: '$1'"
}
