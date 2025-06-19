#include <stdio.h>
#include <string.h>

char *chartype;

void greet(char name[])
{
  printf("Hello %s\n", name);
}

void findchartype(int i)
{
  switch (i)
  {
  case 0:
    chartype = "NULL";
    break;
  case 7:
    chartype = "Bell";
    break;
  case 8:
    chartype = "Backspace";
    break;
  case 9:
    chartype = "Tab";
    break;
  case 10:
    chartype = "LineFeed";
    break;
  case 13:
    chartype = "Carriage Return";
    break;
  case 32:
    chartype = "Space";
    break;
  case 48:
  case 49:
  case 50:
  case 51:
  case 52:
  case 53:
  case 54:
  case 55:
  case 56:
  // case 48-57 is Number
  case 57:
    chartype = "Number";
    break;
  default:
    chartype = "Character";
  }
  printf("type: %s\n", chartype);
}

int main(int argc, char **argv)
{
  findchartype(52);
  greet("sam");
  return 0;
}