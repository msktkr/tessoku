#include <stdio.h>
#include <stdlib.h>

int check(int K, int x, int *printers, int np) {

  long long int c = 0, i;
  for (i = 0; i < np; i++)
    c += (x / printers[i]);

  return c < K ? 1 : 0;
}

int main() {

  int N, K, *printers;
  int i, f;
  int imin = 1, imax = 1000000000, imid = 500000000;

  scanf("%d%d", &N, &K);

  printers = (int *)malloc(sizeof(int) * N);
  for (i = 0; i < N; i++)
    scanf("%d", printers + i);

  while (1) {
    f = check(K, imid, printers, N);
    if (imax <= imin) {
      break;
    } else if (f) {
      imin = ++imid;
      imid = (imid + imax) / 2;
    } else {
      imax = imid;
      imid = (imin + imid) / 2;
    }
  }
  printf("%d", imid + f);
  return 0;
}
