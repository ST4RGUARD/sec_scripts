#include <stdio.h>

/* This program displays any arguments
 * that were passed to it */
int main(int argc, char **argv)
{
  int i;
  for (i = 0; i < argc; i++)
  {
    printf("Hello mom argc=%d arg num %d is %s\n", argc, i, argv[i]); // prints the arg at index i
    puts("i can only display a string");
  }
  return 0;
}