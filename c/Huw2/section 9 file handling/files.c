#include <stdio.h>

#define MAXSTRLEN 200
#define FILENAME "test.txt"

void readlines()
{
  FILE *fp = fopen(FILENAME, "r");
  char line[MAXSTRLEN];
  if (fp != 0)
  {
    while (fgets(line, sizeof(line), fp) != NULL)
    {
      fputs(line, stdout);
    }
    fclose(fp);
  }
  else
  {
    printf("File %s cannot be opened", FILENAME);
  }
}

void appendlines()
{
  FILE *fp = fopen(FILENAME, "a");
  fputs("\nHello world\n", fp);
  fclose(fp);
}

int main(int argc, char **argv)
{
  readlines();
  appendlines();
  return 0;
}