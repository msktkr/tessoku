#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  int **SQ;
  int i, j, count = 0;
  int N;
  int ns, es, ne, ee;
  int hen = 1500;

  SQ = (int **)malloc(sizeof(int *) * 1502);
  for (i = 0; i <= (hen + 1); i++) {
    SQ[i] = (int *)malloc(sizeof(int) * 1502);
    memset(SQ[i], 0, (sizeof(int) * 1502));
  }

  scanf("%d", &N);

  for (i = 0; i < N; i++) {
    scanf("%d%d%d%d", &ns, &es, &ne, &ee);
    SQ[ns + 1][es + 1]++;
    SQ[ns + 1][ee + 1]--;
    SQ[ne + 1][es + 1]--;
    SQ[ne + 1][ee + 1]++;
  }

  for (i = 1; i <= hen; i++) {
    for (j = 1; j <= hen; j++) {
      SQ[i][j] += SQ[i][j - 1];
    }
  }

  for (i = 1; i <= hen; i++) {
    for (j = 1; j <= hen; j++) {
      SQ[i][j] += SQ[i - 1][j];
    }
  }

  for (i = 1; i <= hen; i++) {
    for (j = 1; j <= hen; j++) {
      if (SQ[i][j])
        count++;
    }
  }

  printf("%d", count);
}
