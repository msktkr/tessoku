#include <stdio.h>

int main() {
  int N, X, i;
  int imin, imid, imax;

  scanf("%d%d", &N, &X);
  int vec[100000];

  for (i = 0; i < N; i++)
    scanf("%d", (vec + i));

  imin = 0;
  imax = N;
  imid = imax / 2;

  while (vec[imid] != X) {
    if (vec[imid] < X) {
      imin = imid;
      imid = (imax + imid) / 2;
    } else {
      imax = imid;
      imid = (imin + imid) / 2;
    }
  }

  printf("%d", imid + 1);
}
