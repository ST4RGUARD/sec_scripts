#include <stdio.h>
#include <string.h>

#define NUMBER_OF_CDS 4

// struct cd
// {
//   char name[50];
//   char artist[50];
//   int trackcount;
//   int rating;
// };

// typedef alternative
typedef char Str50[50];

enum score
{
  Terrible,
  Bad,
  Average,
  Good,
  Excellent
};

typedef struct cd
{
  Str50 name;
  Str50 artist;
  int trackcount;
  enum score rating;
} CD;

// struct cd cd_collection[NUMBER_OF_CDS];
CD cd_collection[NUMBER_OF_CDS];

void create_cd_collection()
{
  strcpy(cd_collection[0].name, "Greatest Hits");
  strcpy(cd_collection[0].artist, "Bon Jovi");
  cd_collection[0].trackcount = 20;
  cd_collection[0].rating = Excellent;

  strcpy(cd_collection[1].name, "Mega Songs");
  strcpy(cd_collection[1].artist, "Lady Googoo");
  cd_collection[1].trackcount = 12;
  cd_collection[1].rating = Good;
}

void display_collection()
{
  int i;
  // struct cd thiscd;
  CD thiscd;
  for (i = 0; i < NUMBER_OF_CDS; i++)
  {
    thiscd = cd_collection[i];
    printf("CD #%d: '%s' by %s has %d tracks. My rating = %d\n", i, thiscd.name, thiscd.artist, thiscd.trackcount, thiscd.rating);
  }
}

int main(int argc, char **argv)
{
  create_cd_collection();
  display_collection();

  return 0;
}