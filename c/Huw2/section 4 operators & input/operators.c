#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STRLEN 5;

void flush_input()
{
  int ch;
  while ((ch = getchar()) != '\n' && ch != EOF)
    ;
}

// better line reading func
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

void getinput_with_gets()
{
  char firstname[5];
  char lastname[5];
  printf("Enter your first name: ");
  gets(firstname);
  printf("Enter your last name: ");
  gets(lastname);
  printf("Hello, %s, %s\n", firstname, lastname);
}

void getinput_with_fgets()
{
  char firstname[5];
  char lastname[5];
  printf("Enter your first name: ");
  readln(firstname, 5);
  // fgets(firstname, 5, stdin);
  // flush_input();
  printf("Enter your last name: ");
  readln(lastname, 5);
  // fgets(lastname, 5, stdin);
  // flush_input();
  printf("Hello, %s, %s\n", firstname, lastname);
}

int main(int argc, char **argv)
{
  char agestring[10];
  int age;
  int bonus, num1, num2;

  // compound operator += *= etc, ++ -- incrememnt and decrement

  printf("Enter your age: ");
  gets(agestring);

  age = atoi(agestring);
  if (age == 0)
  {
    printf("Invalid age");
  }
  else
  {
    if (age > 45)
    {
      bonus = 1000;
    }
    else
    {
      bonus = 500;
    }
    printf("Your age is: %d, so your bonus is %d\n", age, bonus);
    bonus += age;
    printf("Your compund is %d\n", bonus);
  }

  // prefix and postfix
  num1 = 10;
  num2 = num1++; // num2 = 10, num1 = 11
  num2 = ++num1; // num2 = 11, num1 = 11

  // getinput_with_gets();
  getinput_with_fgets();

  return 0;
}