#include <stdio.h>

// while loops

int main(int argc, char **argv)
{
  char c;
  c = ' ';
  // printf("\ngetchar() with while loop..\n");
  // while (c != 'y')
  // {
  //   printf("\nEnter y or n: ");
  //   c = getchar();
  //   getchar();
  // }

  do
  {
    printf("\nEnter y or n: ");
    c = getchar();
    getchar();

    if (c == 'n')
    {
      break;
    }
    if (c == 'c')
    {
      printf("continuing..");
      continue;
    }
  } while (c != 'y');
  printf("\nThat's it");
  return 0;
}