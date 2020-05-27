#include "../includes/scu_suite.h"

void                    scu_suite::test()
{
    cout << MAGANTA << "No test found for suite " << YELLOW << this->name << MAGANTA "!" << END << endl;
}

void                    scu_suite::run_test(char *name, bool(*func)(void))
{
    bool                r;

    this->tests += 1;
    r = func();
    if (r && (this->errors += 1))
        cout << RED << "Error in test " << YELLOW << this->name << "::" << name << "!" << END << endl;
}

                        scu_suite::scu_suite(char *name)
{
    this->tests = 0;
    this->errors = 0;
    this->name = name;
    sc_start();
    this->test();
    sc_stop();
    if (!this->errors)
        cout << GREEN << "All " << YELLOW << this->tests << " / " << this->tests << GREEN;
    else
        cout << RED << "Only " << YELLOW << this->tests - this->errors << " / " << this->tests << RED;
    cout << " test(s) passed!" << endl;
};
