#include <stdio.h>
int main(int argc, char *argv[]) {
    printf("시작\n");
    if (argc < 2) {
        printf("인자가 없습니다\n");
    } else {
        for (int i = 1; i < argc; i++) {
            printf("입력 인자 %d: %s\n", i, argv[i]);
        }
    }
    printf("끝\n");
    return 0;
}
