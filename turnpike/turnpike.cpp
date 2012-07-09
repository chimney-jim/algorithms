//Course:       CS4413
//Student Name: Jim Fitzgerald
//Student ID:   000165563
//Assignment #: 3
//Due Date:     6/13/12
//
//Signature:    _______________________
//
//Score:        ________

#include <iostream>
#include <stdlib.h>
#include <list>
#include <math>
#include "turnpike.h"

using namespace std;

int main()
{
    int n = 6;
    int x[6];
    int dlist[] = {1,2,2,2,3,3,3,4,5,5,5,6,7,8,10};
    list<int> d(dlist, dlist + sizeof(dlist)/sizeof(int));

    turnpike(x, d, n);
};

bool turnpike (int x[], list<int> d, int n)
{
    x[0]=0;
    x[n-1]=max(d);
    d.remove(max(d));
    x[n-2]=max(d);
    d.remove(max(d));

    if (isIn(d, x[n-1]-x[n-2]))
    {
        d.remove(x[n-1]-x[n-2]);
        return place(x, d, n, 1, n-3);
    }
    else
        return false;
};

bool place(int x[], list<int> d, int n, int left, int right)
{
    int dmax;
    bool found = false;

    if(d.empty())
        return true;

    dmax = max(d);

    for (1<=j<left && right<j<=n)
    {
        if (isIn(d,x[j]))
        {
            x[right] = dmax;
            for (1<=j<left, right<j<=n)
                d.remove(x[j]-dmax);
            found = place (x, d, n, left, right-1);
        }

        if (!found)
            for (1<=j<left, right<j<=n)
                d.insert(x[j]-dmax);
    }

    for (1<=j<left && right<j<=n)
    {
        if (!found && isIn(abs(x[n]-dmax-x[j])))
        {
            x[left] = x[n]-dmax;
            for (1<=j<left, right<j<=n)
                d.remove(abs(x[j]-dmax-x[j]));
            found = place (x, d, n, left+1, right);
        }

        if (!found)
            for (1<=j<left, right<j<=n)
                d.insert(abs(x[j]-dmax-x[j]));
    }

    return found;
}

int max (list<int> &list1)
{
    int maximum = 0;
    for (int i = 0; i < list1.size(); i++)
    {
        if (list1.front()>maximum)
        {
            maximum = list1.front();
            list1.pop_front();
        }
    }
    return maximum;
};

bool isIn (list<int> &list1, int num)
{
    for (list<int>::iterator it = list1.begin(); it != list1.end(); it++)
    {
        if (*it==num)
            return true;
        else
            return false;
    }
};
