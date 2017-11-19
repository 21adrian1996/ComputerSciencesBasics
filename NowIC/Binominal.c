#include <stdio.h>

int binomialCoeff(int, int);

int main() {
    int n;
    int k;
    printf("n: ");
    scanf("%d", &n);
    printf("k: ");
    scanf("%d", &k);
    int result = binomialCoeff(n, k);
    printf("(%d|%d) is %d", n, k, result);
    return 0;
}
int binomialCoeff(int n, int k) {
    int res = 1;

    // Since C(n, k) = C(n, n-k)
    if (k > n - k)
        k = n - k;

    // Calculate value of [n * (n-1) *---* (n-k+1)] / [k * (k-1) *----* 1]
    for (int i = 0; i < k; ++i) {
        res *= (n - i);
        res /= (i + 1);
    }

    return res;
}
