#!/usr/bin/env bash
ver=$(uname -r | cut -d. -f1,2)
echo "${ver}"
