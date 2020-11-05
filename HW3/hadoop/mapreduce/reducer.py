#!/usr/bin/env python
import sys

current_word = None
current_count = 0
word = None
for line in sys.stdin:
    # trim
    line = line.strip()
    # split
    word, count = line.split("\t", 1)
    #print(word, count)
    try:
        count = int(count)
    except ValueError:
        print "count not value!"
        sys.exit()
    if word == current_word:
        current_count += count
    else:
        if current_word:
            print "%s\t%d" % (current_word, current_count)
        current_word = word
        current_count = count

if word == current_word:
	print "%s\t%d" % (current_word, current_count)