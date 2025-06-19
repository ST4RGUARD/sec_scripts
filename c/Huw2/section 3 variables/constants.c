#include <stdio.h>
#include <math.h>

int main(int argc, char **argv)
{
#define PI 3.141593
  const double PIE = 9001;

  printf("%f\n", PI);
  printf("%.10f\n", M_PI);
  printf("%f\n", PIE);

  // can't redefine const PIE = 9999;
#define PI 3.5 // redefine define constant
  printf("%f\n", PIE);
  printf("%f\n", PI);
  return 0;
}