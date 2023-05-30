#include <stdio.h>
int factorial(int n);
int isPrime(int num);
void fibonacciSeries(int limit);
void multiplicationTable(int num);
int findMax(int num1, int num2, int num3);

int main() {
    int num = 5; // Example number for factorial and prime check
    printf("Factorial of %d: %d\n", num, factorial(num));
    if (isPrime(num)) {
        printf("%d is a prime number.\n", num);
    } else {
        printf("%d is not a prime number.\n", num);
    }
    int limit = 10; // Example limit for Fibonacci series
    fibonacciSeries(limit);
    int tableNum = 7; // Example number for multiplication table
    multiplicationTable(tableNum);
    int num1 = 12, num2 = 8, num3 = 15; // Example numbers for finding maximum
    int max = findMax(num1, num2, num3);
    printf("The maximum number among %d, %d, and %d is %d.\n", num1, num2, num3, max);
    return 0;
}

// Function to calculate the factorial of a number
__attribute__((annotate("O2"))) int factorial(int n) {
    int result = 1;
    for (int i = 1; i <= n; i++) {
        result *= i;
    }
    return result;
}

// Function to check if a number is prime
__attribute__((annotate("O3"))) int isPrime(int num) {
    if (num <= 1) {
        return 0;
    }
    for (int i = 2; i * i <= num; i++) {
        if (num % i == 0) {
            return 0;
        }
    }
    return 1;
}

// Function to calculate the Fibonacci series up to a given limit
__attribute__((annotate("O2"))) void fibonacciSeries(int limit) {
    int num1 = 0, num2 = 1, nextTerm;
    printf("Fibonacci Series up to %d terms:\n", limit);
    for (int i = 1; i <= limit; i++) {
        printf("%d, ", num1);
        nextTerm = num1 + num2;
        num1 = num2;
        num2 = nextTerm;
    }
    printf("\n");
}

// Function to print the multiplication table of a number
__attribute__((annotate("O1"))) void multiplicationTable(int num) {
    printf("Multiplication Table of %d:\n", num);
    for (int i = 1; i <= 10; i++) {
        printf("%d x %d = %d\n", num, i, num * i);
    }
}

// Function to find the maximum number among three numbers
__attribute__((annotate("O3"))) int findMax(int num1, int num2, int num3) {
    int max = num1;
    if (num2 > max) {
        max = num2;
    }
    if (num3 > max) {
        max = num3;
    }
    return max;
}