#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  int **AK; /* ALGO_Kingdom */
  int i, j;
  int H, W, N;
  int ns, es, ne, ee;

  scanf("%d%d%d", &H, &W, &N);

  AK = (int **)malloc(sizeof(int *) * (H + 2));
  for (i = 0; i <= (H + 1); i++) {
    AK[i] = (int *)malloc(sizeof(int) * (W + 2));
    memset(AK[i], 0, (sizeof(int) * (W + 2)));
  }

  for (i = 0; i < N; i++) {
    scanf("%d%d%d%d", &ns, &es, &ne, &ee);
    AK[ns][es]++;
    AK[ns][ee + 1]--;
    AK[ne + 1][es]--;
    AK[ne + 1][ee + 1]++;
  }

  for (i = 1; i <= H; i++) {
    for (j = 1; j <= W; j++) {
      AK[i][j] += AK[i][j - 1];
    }
  }

  for (i = 1; i <= H; i++) {
    for (j = 1; j <= W; j++) {
      AK[i][j] += AK[i - 1][j];
    }
  }

  for (i = 1; i <= H; i++) {
    for (j = 1; j <= W; j++) {
      printf("%d ", AK[i][j]);
    }
    puts("");
  }
}
