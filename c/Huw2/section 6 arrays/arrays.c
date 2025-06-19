#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// mullti-dimensional array
int grid[3][5] = {
    {1, 2, 3, 4, 5},
    {6, 7, 8, 9, 10},
    {11, 12, 13, 14, 15}};

void array_iter(char *arr)
{
  int i;
  int arr_length = sizeof arr;
  printf("arr_length: %d\n", arr_length);
  for (i = 0; i < arr_length; i++)
  {
    printf("arr[%d]: %c\n", i, arr[i]);
  }
}

void grid_iter()
{
  int row, col;

  for (row = 0; row < 3; row++)
  {
    printf("--- row %d --- \n", row);
    for (col = 0; col < 5; col++)
    {
      printf("column[%d], value=%d\n", col, grid[row][col]);
    }
  }
}

int readln(char s[], int maxlen)
{
  int len_s;
  fgets(s, maxlen, stdin);
  len_s = strlen(s);
  if (s[len_s - 1] == '\n')
  {
    s[len_s - 1] = '\0';
    len_s -= 1;
  }
  rewind(stdin); // flushes the keyboard buffer on win?
  return len_s;
}

int main(int argc, char **argv)
{
  int i;
  char array;
  printf("Enter something to iterate over: ");
  readln(&array, 10);
  printf("You entered: %s\n", &array);
  printf("Iterating... \n");
  array_iter(&array);
  grid_iter();
}