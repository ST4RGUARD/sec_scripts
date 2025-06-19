#include <stdio.h>

enum suits
{
  Hearts = 1,
  Diamonds = 4,
  Clubs = 6,
  Spades = 9
};

void showcard(enum suits card)
{
  if ((card == Hearts) || (card == Diamonds))
  {
    printf("This card is red (in suit #%d).\n", card);
  }
  else
  {
    printf("This card is a black card.\n");
  }
}

int main(int argc, char **argv)
{
  enum suits playingcard;
  playingcard = Diamonds;
  showcard(playingcard);

  return 0;
}