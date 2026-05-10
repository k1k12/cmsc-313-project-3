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

The bytes and ASCII output matched and I saved the output from the Linux hexdump in `outputs/hexdump_program.txt` and the Linux command output in `outputs/hexdump_linux.txt`.

## Optimisation Differences

The assembly files were made using `-O0`, `-O1`, and `-O3`.

| Optimisation Level | Assembly Lines |
|---|---:|
| `-O0` | 200 |
| `-O1` | 207 |
| `-O3` | 237 |

Looking at the code the `-O0` assembly is the easiest to follow because it stays closest to the original C code. The loops and variables are easier to match back to the source program. This makes using `-O0` useful for if I wanted to debug or understand the assembly.

The `-O1` assembly applyies some optimisation. It uses registers more actively and changes the structure of the code compared with `-O0`. This makes the assembly less of a direct copy of the C source code, but a little bit more efficient.

The `-O3` assembly is the longest (237 lines) even though it is the most effecient. The compiler rearranged instructions and loops to improve performance.

For example, the `-O3` assembly includes:

```asm
.p2align 4
```

This shows the compiler is aligning the code differently to help it run more efficiently.

## Conclusion

All three optimisation levels produce the same output. The main difference is how the compiler translates the C code into assembly.

For this program, optimisation probably does not make a large runtime difference because most of the work is file reading and formatted printing, rather than heavy computation.
