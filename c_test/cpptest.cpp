#include <iostream>
#include <string.h>
#include <fstream>
#include "source.h"

using namespace std;

void getline2char(const char* ch)
{
    ifstream file;
    file.open(ch, ios::in);
    cout << "逐行读取 " << endl;
    // char *src[];
    string str;
    
    while (file)
    {
        // printf("ssss\n");
        std::getline(file, str);
        cout << str << endl;
    }
}

void test()
{
    ifstream iopen;
    iopen.open("222.txt", ios::in);
    int Type = 2; // 1:逐字符, 2:按行读取, 3:读取全部

    if (Type == 1)
    {
        cout << "逐字符读取 " << endl;
        char a;
        while (iopen.get(a))
        {
            cout << a;
        }
    }
    else if (Type == 2)
    {
        cout << "逐行读取 " << endl;
        string str;
        while (iopen)
        {
            std::getline(iopen, str);
            cout << str << endl;
        }
    }
    else if (Type == 3)
    {
        cout << "读取全部 " << endl;
        string str;
        std::getline(iopen, str, '\0');
        cout << str << endl;
    }
}