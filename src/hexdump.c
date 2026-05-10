#include <stdio.h>
#include <stdlib.h>
#define BYTES_PER_LINE 16

void print_hex_dump(FILE *file) {
  unsigned char buffer[BYTES_PER_LINE];
  size_t bytes_read;
  unsigned int offset = 0;

  while ((bytes_read = fread(buffer, 1, BYTES_PER_LINE, file)) > 0) {
    // print current byte offset in hex
    printf("%08x ",offset);

    // print each byte from buffer as 2 hex digits
    for (size_t i = 0; i < bytes_read; i++) {
      printf("%02x ", buffer[i]);
    }

    printf("\n");

    // move offset forward by bytes read
    offset += bytes_read;
  }
}

int main(int argc, char *argv[]) {
  
  // make sure file runs with one file as arg
  if (argc != 2) {
    fprintf(stderr, "Usage: %s <binary file>\n", argv[0]);
    return 1;
  }

  // open file in rb
  FILE *file = fopen(argv[1],"rb");

  // check that file can be opened
  if (file == NULL) {
    perror("Error opening file");
    return 1;
  }

  // print hex dump
  print_hex_dump(file);

  // close file
  fclose(file);

  return 0;
  
}
