#include <stdio.h>
#include <stdlib.h>

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

  // close file
  fclose(file);

  return 0;
  
}
