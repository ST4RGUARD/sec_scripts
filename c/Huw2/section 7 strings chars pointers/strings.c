#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

#define MAXSTRLEN 100

char greeting[MAXSTRLEN];

char *string_function_dynamic(char *astring)
{
  char *s;
  s = malloc(MAXSTRLEN);
  s[0] = 0;
  strcat(s, "hello ");
  strcat(s, astring);
  strcat(s, "\n");
  return s;
}

char *string_function(char astring[])
{
  strcat(greeting, "hello ");
  strcat(greeting, astring);
  strcat(greeting, "\n");
  return greeting;
}

int main(int argc, char **argv)
{
  char str1[] = "hello";
  char str2[] = "good\0 morning";
  char *str3 = "goodbye";
  str3 = str2;
  int cpy;

  printf("str1: %s\n", str1);
  // prints until null byte encountered
  // printf("str2: %s %x %x\n", str2, str2, &str2);
  // printf("str3: %s %x %x\n", str3, str3, &str3);
  // strlen(str1); // length of string
  // strstr(mystring, searchstr);
  // strncpy(mysting, "test", 4);
  // strcat(msg1,"test");
  // isalnum() alpha letter or digit
  // isalpha() alpha letter
  // isblank() space or tab
  // islower()
  // isspace() whitespace character
  // isxdigit() hex
  // " for string " 'c' char

  cpy = strncpy(str1, str2, 5);
  printf("i copied this: %s with error code: %d\n", str1, cpy);

  printf("\n");
  printf(string_function_dynamic("test"));
  printf(string_function("meatball"));

  return 0;
}