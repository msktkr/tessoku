#include <stdio.h>
#include <stdlib.h>

int main() {
  int N, D;
  int *heya, *heyah, *heyat;
  int i, s, e, mh = 0, mt = 0;

  scanf("%d", &N);
  heya = (int *)malloc(sizeof(int) * N);
  heyah = (int *)malloc(sizeof(int) * N);
  heyat = (int *)malloc(sizeof(int) * N);

  for (i = 0; i < N; i++)
    scanf("%d", (heya + i));

  for (i = 0; i < N; i++) {
    heyah[i] = mh >= heya[i] ? mh : heya[i];
    mh = heyah[i];
    heyat[N - i - 1] = mt >= heya[N - i - 1] ? mt : heya[N - i - 1];
    mt = heyat[N - i - 1];
  }

  scanf("%d", &D);

  for (i = 0; i < D; i++) {
    scanf("%d%d", &s, &e);
    printf("%d\n", heyah[s - 2] >= heyat[e] ? heyah[s - 2] : heyat[e]);
  }
}
