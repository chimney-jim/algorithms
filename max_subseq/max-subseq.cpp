//Course:        CS4413
//Student name:  John Doe
//Student ID:    000165563
//Assignemtn #:  1
//Due Date:      6/13/12
//
//Signature:  ______________________________
//
//Score:      ___________

#include <iostream>
#include <stdlib.h>
#include "max-subseq.h"

using namespace std;

int main ()
{
    int a[] = {4, -3, 5, -2, -1, 2, 6, -2};
    int maxSum;
    int l=0, r=8-1;

    maxSum = maxSumRec(a, l, r);

    printf("%i\n",maxSum);
    cout << maxSum;

    return 0;
};

int maxSumRec(int a[], int& left, int& right)
{
    int maxLeftBorderSum = 0; 
    int maxRightBorderSum = 0;
    int leftBorderSum = 0;
    int rightBorderSum = 0;
    int center = (left + right) /2;
    int middle = center+1;

    if (left == right)
    {
        if (a[left] > 0)
            return a[left];
        else
            return 0;
    }

    int maxLeftSum = maxSumRec(a, left, center);
    int maxRightSum = maxSumRec(a, middle, right);

    for (int i=center; i >= left; i--)
    {
        leftBorderSum += a[i];
        if (leftBorderSum > maxLeftBorderSum)
            maxLeftBorderSum = leftBorderSum;
    }

    for (int i=middle; i <= right; i++)
    {
        rightBorderSum += a[i];
        if (rightBorderSum > maxRightSum)
            maxRightBorderSum = rightBorderSum;
    }
    
    cout << "Left sum: " << maxLeftSum << "\n";
    cout << "Right sum: " << maxRightSum << "\n";

    int max = maxLeftSum;

    if (maxRightSum > max)
        max = maxRightSum;
    if (maxLeftBorderSum + maxRightBorderSum > max)
        max = maxLeftBorderSum + maxRightBorderSum;

    return max;

   // return max3 (maxLeftSum, maxRightSum, maxLeftBorderSum + maxRightBorderSum);
};

int max3 (int a, int b, int c)
{
    return a > b ? a > c ? a : c : b > c ? b : c;
};
