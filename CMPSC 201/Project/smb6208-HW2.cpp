#include <iostream>
#include <iomanip>
#include <cmath>
using namespace std;

/**
 @file  smb6208-hw2.cpp
 The program will calculate the monthly payment of a loan after getting the user to input the amount, the period
 and the APR.
 
 @author Seth Barger <smb6208@pus.edu>
 @version 1.0
 @date 9-24-2014
 
 @brief CMPSC 201 HW 2
 */

int main()
{
    //Data Dictionary
    double amount, apr, monthlyPayment, monthlyRate;
    int timePeriod, timePeriodYears, timePeriodMonths;
    
    //INPUT
    cout << "Please enter the total loan amount (In Dollars): $";
    cin >> amount;
    cout << "Please enter the loan period in terms of months (1 year = 12 months): ";
    cin >> timePeriod;
    cout << "Please enter the APR (if the APR is 4.5%, simply enter 4.5): ";
    cin >> apr;
    cout << endl;
    
    //PROCESSING
    timePeriodYears = timePeriod / 12;
    timePeriodMonths = timePeriod % 12;
    monthlyRate = apr / 1200;
    monthlyPayment = amount * (monthlyRate*pow((monthlyRate+1.0),timePeriod))/(pow((1.0+monthlyRate),timePeriod)-1);
    
    //OUTPUT
    cout.setf(ios::fixed);
    cout.setf(ios::showpoint);
    cout.precision(2);
    
    cout << "CMPSC 201 - HW2" << endl;
    cout << "Loan Payment Calculation" << endl;
    cout << "============================" << endl;
    cout << "Total Loan Amount: $" << amount << endl;
    cout << "Loan Period: " << timePeriodYears << " years and " << timePeriodMonths << " months." << endl;
    cout.precision(3);
    cout << "Interest Rate: (APR): " << apr << "%" << endl;
    cout.precision(2);
    cout << "The monthly payment is $" << monthlyPayment << endl;
    
    return 0;
}






