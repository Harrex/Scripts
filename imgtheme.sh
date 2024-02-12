#!/bin/bash
wal -i $1
swww img -t wipe --transition-duration 0 $1
