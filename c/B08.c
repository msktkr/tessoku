#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){
  int N, Q;
  int hen = 1501;
  int i, j, x, y, tmp;
  int hv, hh, tv, th;
  int **points;
  int **mat;
  int *rui;

  rui = (int *)malloc(sizeof(int) * hen);

  points = (int **)malloc(sizeof(int *) * hen);
  mat    = (int **)malloc(sizeof(int *) * hen);

  for(i = 0; i < hen; i++){
    points[i] = (int *)malloc(sizeof(int) * hen);
    mat[i]    = (int *)malloc(sizeof(int) * hen);
    memset(points[i], 0, sizeof(int) * hen);
    mat[i][0] = 0;
  }
  memset(mat[0], 0, sizeof(int) * hen);

  scanf("%d", &N);

  for(i = 0; i < N; i++){
    scanf("%d%d", &x, &y);
    points[x][y]++;
  }

  rui[0] = 0;

  for(i = 1; i < hen; i++){
    for(j = 1; j < hen; j++){
      rui[j] = rui[j - 1] + points[i][j];
      mat[i][j] = rui[j] + mat[i - 1][j];
    }
  }

  scanf("%d", &Q);

  for(i = 0; i < Q; i++){
    scanf("%d%d%d%d", &hv, &hh, &tv, &th);
    tmp = mat[tv][th] + mat[hv - 1][hh - 1] - mat[hv - 1][th] - mat[tv][hh - 1];
    printf("%d\n", tmp);
  }
}
