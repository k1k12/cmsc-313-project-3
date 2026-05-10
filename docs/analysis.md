# Project 3 Analysis

## Program Overview

This program reads a binary file and prints a hex dump. Each line shows:

- the byte offset
- sixteen bytes in hexadecimal
- the ASCII version of those bytes

The characters that aren't ASCII printable were replaced with `.`.

## Validation

I checked my programs hexdump against the Linux command:

```bash
hexdump -Cv data/binary.out
```

The bytes and ASCII output matched and I saved the output from the Linux hexdump in `outputs/hexdump_program.txt` and the Linux command output in `outputs/hexdump_linux.txt`..

## Optimisation Differences
