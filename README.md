# CMSC 313 Project

## Project Structure

```text
.
├── README.md
├── asm/
│   ├── hexdump_O0.s
│   ├── hexdump_O1.s
│   └── hexdump_O3.s
├── build/
│   └── hexdump
├── data/
│   └── binary.out
├── docs/
│   └── analysis.md
├── outputs/
│   ├── hexdump_linux.txt
│   └── hexdump_program.txt
└── src/
    └── hexdump.c

## Build Program

```bash
gcc -Wall -Wextra -std=c11 src/hexdump.c -o build/hexdump
```

## Build Assembly

```bash
mkdir -p asm
gcc -Wall -O0 -S src/hexdump.c -o asm/hexdump_O0.s
gcc -Wall -O1 -S src/hexdump.c -o asm/hexdump_O1.s
gcc -Wall -O3 -S src/hexdump.c -o asm/hexdump_O3.s
```

## Run

```bash
./build/hexdump data/binary.out
```
