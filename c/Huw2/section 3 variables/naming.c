#include <stdio.h>

#define somevalue 10
#define SERVICE_CHARGE 33

int do_something(int x)
{
  return x + somevalue;
}

int main(int argc, char **argv)
{
  printf("%d\n", do_something(30));
  return 0;
}