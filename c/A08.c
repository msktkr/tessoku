#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(){
  int H/* tate */, W/* yoko */;
  int Q;
  int i, j, tmp;
  int hv, hh, tv, th;
  int **matrix;
  int *yomikomi;

  scanf("%d%d", &H, &W);
  matrix = (int **)malloc(sizeof(int *) * (H + 1));

  for(i = 0; i <= H; i++){
    matrix[i] = (int *)malloc(sizeof(int) * (W + 1));
    matrix[i][0] = 0;
  }
  memset(matrix[0], 0, sizeof(int) * (W + 1));

  yomikomi = (int *)malloc(sizeof(int) * (W + 1));
  yomikomi[0] = 0;

  for(i = 1; i <= H; i++){
    for(j = 1; j <= W; j++){
      scanf("%d", &tmp);
      yomikomi[j] = yomikomi[j - 1] + tmp;
      matrix[i][j] = matrix[i - 1][j] + yomikomi[j];
    }
  }

  scanf("%d", &Q);

  for(i = 0; i < Q; i++){
    scanf("%d%d%d%d", &hv, &hh, &tv, &th);
    tmp = matrix[tv][th] - matrix[hv - 1][th] - (matrix[tv][hh - 1] - matrix[hv - 1][hh - 1]);
    printf("%d\n", tmp);
  }
}
