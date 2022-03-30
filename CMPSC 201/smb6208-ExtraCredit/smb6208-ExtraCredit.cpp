#include <iostream>
#include <ctime>
using namespace std;

/*
 
 Name: Seth Barger
 Class: CMPSC 201 Section 8
 This is the main file for ExtraCredit
 The program will take the input of an array with width 20 with random numbers
 It will then sort the array in descending order and search for a random key
 
 */

//function prototypes
void arrayPrint (int,int);
void arrayFill (int, int);
void arraySort (int, int);
int arraySearch (int, int, int, int&);

/*
 This function will print the array to the screen
 It's input is an array and it's output it also an array
 It does not return anything
 */
void arrayPrint(int arrayLength, int array[arrayLength])
{
    for (int i = 0; i<arrayLength; i++)
    {
        cout << array[i] << " ";
    }
    cout << endl;
}

/*
 This function will fill an array with random numbers
 It's input is the length of an array and it's output is an array
 It does not return anything
 */
void arrayFill(int arrayLength, int array[arrayLength])
{
    srand(time(NULL));
    for (int i = 0; i<arrayLength; i++)
    {
        array[i] = (rand() % 100)+1;
    }
}

/*
 This function will sort the array in descending order
 It's input is an array and it's output is the same array sorted
 It does not return anything
 */
void arraySort(int arrayLength, int array[arrayLength])
{
    int tempvar;
    for (int i = 0; i < arrayLength; i++)
    {
        for (int j = 0; j < arrayLength; j++)
        {
            if (array[j+1] > array[j])
            {
                tempvar = array[j+1];
                array[j+1] = array[j];
                array[j] = tempvar;
            }
        }
    }
}

/*
 This function will print search the array for a key
 It's input is an array and it's output will say if the key was found or not
 It does not return anything
 */
int arraySearch(int arrayLength, int array[arrayLength], int key, int & middle)
{
    int high = arrayLength - 1, low = 0;
    while (low <= high)
    {
        middle = (low + high)/2;
        if ( key == array[middle])
        {
            return middle;
        
        } else if (key > array[middle])
        {
            high = middle - 1;
        } else if (key < array[middle])
        {
            low = middle + 1;
        }
    }
    
    return -1;
}

int main()
{
    int arrayLength = 20;
    int array[arrayLength];
    int middle, key, search;
    char cont = 'y';
    
    cout << "CMPSC 201-Extra Credit" << endl;
    cout << "This program fills an array, then sorts the array and searches for a random key value." << endl;
   
    do
    {
    arrayFill (arrayLength, array);
    cout << "Unordered array:" << endl;
    arrayPrint (arrayLength, array);
    arraySort (arrayLength, array);
    cout << "Array after bubble sort:" << endl;
    arrayPrint (arrayLength, array);
    
    key = (rand()%100) + 1;
    
    cout << "Searching for " << key << endl;
        search = arraySearch(arrayLength, array, key, middle);
    if (search == -1)
    {
        cout << "Key " << key << " not found in the array." << endl;
    } else if (search != -1)
    {
        cout << "Key " << key << " found in position " << middle << "." << endl;
    }
      cout << "Stop the program? (y/n) ";
        cin >> cont;
    } while (cont != 'y' && cont != 'Y');
        cout << endl;
    return 0;
}

